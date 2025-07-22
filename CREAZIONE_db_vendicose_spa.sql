
-- Creazione database VendiCose SPA
CREATE DATABASE db_vendicose_spa;
USE db_vendicose_spa;

-- Creazione tabella magazzini
CREATE TABLE Warehouses (
	ID INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(20),
	Location VARCHAR(20),
	Email VARCHAR(45),
	PhoneNo VARCHAR(15)
);

-- Creazione tabella categoria
CREATE TABLE Category (
		 ID INT PRIMARY KEY,
         Name VARCHAR(20),
         RestockLevel INT,
         Description TEXT
);

-- Creazione tabella prodotti
CREATE TABLE Product (
	ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(45) NOT NULL,
    CategoryID INT,
    Description TEXT,
    MaxUnitSalesPrice DECIMAL(10,2),
    FOREIGN KEY (CategoryID) REFERENCES Category(ID)
);

-- Creazione tabella Stock presente in magazzino 
CREATE TABLE StockLevel (
    ProductID VARCHAR(10) NOT NULL,
    WarehouseID INT,
    Stock INT NOT NULL CHECK (Stock >= 0),
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Product(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Creazione tabella Negozi
CREATE TABLE Stores (
	ID VARCHAR(7) PRIMARY KEY,
    WarehouseID INT,
    Name VARCHAR(25) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    ManagerName VARCHAR(255),
    ContactNumber VARCHAR(20),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Creazione tabella vendite
CREATE TABLE Sales (
	StoreID VARCHAR(7),
    SalesID INT,
    LineID INT,
    ProductID VARCHAR(6),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL,
    TotalPrice DECIMAL(10,2) GENERATED ALWAYS AS (Quantity * UnitPrice) STORED,
    SaleDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod ENUM('Cash', 'Credit Card', 'Debit Card', 'Online') NOT NULL,
    PRIMARY KEY (SalesID, LineID),
    FOREIGN KEY (StoreID) REFERENCES Stores(ID),
    FOREIGN KEY (ProductID) REFERENCES Product(ID)
);



-- Creazione trigger per aggiornamento stock magazzino
DELIMITER $$								 	-- Serve a modificare temporaneamente il simbolo che indica il termine di un comando, così che SQL non interpreti ; come la fine del comando ma usi $$

CREATE TRIGGER update_stock_after_insert 		-- Definiamo un trigger con un nome
AFTER INSERT ON Sales 							-- Il trigger si attiverà ogni volta che viene effettuata una insert nella tabella Sales
FOR EACH ROW 									-- Il trigger verrà eseguito per ogni riga inserita nella tabella Sales
BEGIN											-- Identifica l'inizio del blocco di istruzioni
	UPDATE StockLevel							-- Update utilizzato per diminuire lo stock
    SET Stock = Stock - NEW.Quantity			-- NEW.Quantity identifica la quantità appena inserita nella tabella Sales nella riga per cui si è stato attivato il trigger
    WHERE ProductID = NEW.ProductID				-- NEW.ProductID identifica l'ID del prodotto appena inserito nella tabella Sales nella riga per cui si è attivato il trigger
    AND WarehouseID = (							
		SELECT Warehouses.ID					-- Subquery per recuperare il magazzino correlato allo store che è stato inserito nella vendita
        FROM Warehouses
        JOIN Stores ON Warehouses.ID = Stores.WarehouseID
        WHERE Stores.ID = NEW.StoreID			-- NEW.StoreID identifica l'ID dello store appena inserito nella tabella Sales nella riga per cui si è attivato il trigger
	);
END;											-- Fine del blocco di istruzioni
$$												-- Delimitatore di fine comando temporaneo impostato prima

DELIMITER ; -- Ripristina il delimitatore di fine comando a ;

SHOW TRIGGERS;

-- Creazione tabella allarmi sottosoglia
CREATE TABLE StockAlerts (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID VARCHAR(10),
    WarehouseID INT,
    AlertMessage TEXT,
    AlertTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Product(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Creazione trigger per generazione allarme quando prodotto va sottosoglia
DELIMITER $$

DELIMITER $$

CREATE TRIGGER check_stock_level
AFTER UPDATE ON StockLevel
FOR EACH ROW
BEGIN
	DECLARE soglia INT;

	SELECT Category.RestockLevel INTO soglia
	FROM Category
	JOIN Product ON Category.ID = Product.CategoryID
	WHERE Product.ID = NEW.ProductID
	LIMIT 1;

	IF NEW.Stock < soglia THEN
		INSERT INTO StockAlerts (ProductID, WarehouseID, AlertMessage)
		VALUES (NEW.ProductID, NEW.WarehouseID, "La quantità in stock è sottosoglia");
	END IF;
END;
$$

DELIMITER ;

SHOW TRIGGERS;

CREATE VIEW VistaRestockProdotto AS
	SELECT Product.Name AS NomeProdotto, Product.ID AS CodiceProdotto, Warehouses.ID AS CodiceMagazzino, StockLevel.Stock, Category.RestockLevel AS SogliaDiRestock
	FROM Product JOIN StockLevel ON Product.ID = StockLevel.ProductID
	JOIN Warehouses ON Warehouses.ID = StockLevel.WarehouseID
	JOIN Category ON Product.CategoryID = Category.ID;
    
SELECT * FROM VistaRestockProdotto;


CREATE TABLE StoreStockLevel (
	ProductID VARCHAR(10) NOT NULL,
    StoreID Varchar(7) NOT NULL,
    Stock INT NOT NULL CHECK (Stock >= 0),
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (ProductID, StoreID),
    FOREIGN KEY (ProductID) REFERENCES Product(ID),
    FOREIGN KEY (StoreID) REFERENCES Stores(ID)
);

-- Creazione tabella vendite
CREATE TABLE RestockStore (
	StoreID VARCHAR(7),
    RestockID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID VARCHAR(10),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    RestockDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StoreID) REFERENCES Stores(ID),
    FOREIGN KEY (ProductID) REFERENCES Product(ID)
);

-- Creazione trigger per aggiornamento stock store
DELIMITER $$								 	-- Serve a modificare temporaneamente il simbolo che indica il termine di un comando, così che SQL non interpreti ; come la fine del comando ma usi $$

CREATE TRIGGER update_store_stock 		-- Definiamo un trigger con un nome
AFTER INSERT ON Sales 							-- Il trigger si attiverà ogni volta che viene effettuata una insert nella tabella Sales
FOR EACH ROW 									-- Il trigger verrà eseguito per ogni riga inserita nella tabella Sales
BEGIN											-- Identifica l'inizio del blocco di istruzioni
	UPDATE StoreStockLevel							-- Update utilizzato per diminuire lo stock
    SET Stock = Stock - NEW.Quantity			-- NEW.Quantity identifica la quantità appena inserita nella tabella Sales nella riga per cui si è stato attivato il trigger
    WHERE ProductID = NEW.ProductID				-- NEW.ProductID identifica l'ID del prodotto appena inserito nella tabella Sales nella riga per cui si è attivato il trigger
    AND StoreID = NEW.StoreID;
END;											-- Fine del blocco di istruzioni
$$												-- Delimitatore di fine comando temporaneo impostato prima

DELIMITER ; -- Ripristina il delimitatore di fine comando a ;

SHOW TRIGGERS;

-- Creazione trigger per inserimento rifornimento
DELIMITER $$								 	-- Serve a modificare temporaneamente il simbolo che indica il termine di un comando, così che SQL non interpreti ; come la fine del comando ma usi $$

CREATE TRIGGER insert_restock_order 		-- Definiamo un trigger con un nome
AFTER UPDATE ON StoreStockLevel 							-- Il trigger si attiverà ogni volta che viene effettuata una insert nella tabella Sales
FOR EACH ROW 									-- Il trigger verrà eseguito per ogni riga inserita nella tabella Sales
BEGIN	
	IF NEW.Stock < (SELECT Category.RestockLevel
						FROM Category
						JOIN Product ON Category.ID = Product.CategoryID
						WHERE Product.ID = NEW.ProductID) THEN
		INSERT INTO RestockStore(StoreID, ProductID, Quantity)
		VALUES 
			(NEW.StoreID, NEW.ProductID, (SELECT Category.RestockLevel FROM Category JOIN Product ON Category.ID = Product.CategoryID WHERE Product.ID = NEW.ProductID));
	END IF;
END;											-- Fine del blocco di istruzioni
$$												-- Delimitatore di fine comando temporaneo impostato prima

DELIMITER ; -- Ripristina il delimitatore di fine comando a ;