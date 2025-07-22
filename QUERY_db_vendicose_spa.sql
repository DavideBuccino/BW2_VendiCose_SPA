-- 2 - Quali sono le query da eseguire per verificare quante unità di un prodotto ci sono in un dato magazzino e per monitorare le soglie di restock?
-- Per verificare quante unità di prodotto (ID 1) ci sono nel magazzino (ID 1)

-- ------------------
-- !!! Vendita 1001 !!!
-- -------------------

-- Verifichiamo quali stores sono associati al magazzino 2
SELECT ID
FROM Stores
WHERE WarehouseID = 2;

-- Scegliamo uno store "ST2005"
-- Che prodotti ci sono nel magazzino 2?
SELECT ProductID
FROM StockLevel
WHERE WarehouseID = 2;

-- Scegliamo un prodotto che vogliamo vendere "A1X3Y9"
-- Verifichiamo lo stock attuale e la soglia di restock della sua categoria
SELECT * FROM VistaRestockProdotto WHERE CodiceProdotto = "A1X3Y9" AND CodiceMagazzino = 2;

-- Eseguiamo una vendita per questo prodotto
INSERT INTO Sales (StoreID, SalesID, LineID, ProductID, Quantity, UnitPrice, PaymentMethod)
VALUES
('ST2005', 1001, 1, 'A1X3Y9', 10, 1.89, 'Debit Card');

-- Controlliamo vendita generata
SELECT * FROM Sales;

-- Ricontrolliamo stock
SELECT * FROM VistaRestockProdotto WHERE CodiceProdotto = "A1X3Y9" AND CodiceMagazzino = 2;

-- Verifichiamo se ci sono allarmi di prodotti sottosoglia
SELECT * FROM StockAlerts;

-- Riapprovigionamento stock dei prodotti sottosoglia
UPDATE StockLevel
SET Stock =	(SELECT Category.RestockLevel
			 FROM Category
             JOIN Product ON Category.ID = Product.CategoryID
			 WHERE Product.ID = StockLevel.ProductID) + 100
WHERE ProductID IN (SELECT ProductID FROM StockAlerts) AND Stock < (SELECT Category.RestockLevel
																	FROM Category
																	JOIN Product ON Category.ID = Product.CategoryID
																	WHERE Product.ID = StockLevel.ProductID);
                                                                    
-- Ricontrolliamo lo stock
SELECT * FROM VistaRestockProdotto WHERE CodiceProdotto = "A1X3Y9" AND CodiceMagazzino = 2;

-- ------------------
-- !!! Vendita 1002 !!!
-- -------------------

-- Verifichiamo quali stores sono associati al magazzino 2
SELECT ID
FROM Stores
WHERE WarehouseID = 5;

-- Scegliamo uno store 'ST8500'
-- Che prodotti ci sono nel magazzino 2?
SELECT ProductID
FROM StockLevel
WHERE WarehouseID = 5;

-- Scegliamo un prodotto che vogliamo vendere 'D3L7M2'
-- Verifichiamo lo stock attuale e la soglia di restock della sua categoria
SELECT * FROM VistaRestockProdotto WHERE CodiceProdotto = 'D3L7M2' AND CodiceMagazzino = 5;

-- Eseguiamo una vendita per questo prodotto
INSERT INTO Sales (StoreID, SalesID, LineID, ProductID, Quantity, UnitPrice, PaymentMethod)
VALUES
('ST8500', 1003, 1, 'D3L7M2', 1, 1.89, 'Debit Card');

-- Controlliamo vendita generata
SELECT * FROM Sales;

-- Ricontrolliamo stock
SELECT * FROM VistaRestockProdotto WHERE CodiceProdotto = 'D3L7M2' AND CodiceMagazzino = 5;

-- Verifichiamo se ci sono allarmi di prodotti sottosoglia
SELECT * FROM StockAlerts;

-- Riapprovigionamento stock dei prodotti sottosoglia
UPDATE StockLevel
SET Stock =	(SELECT Category.RestockLevel
			 FROM Category
             JOIN Product ON Category.ID = Product.CategoryID
			 WHERE Product.ID = StockLevel.ProductID) + 100
WHERE ProductID IN (SELECT ProductID FROM StockAlerts) AND Stock < (SELECT Category.RestockLevel
																	FROM Category
																	JOIN Product ON Category.ID = Product.CategoryID
																	WHERE Product.ID = StockLevel.ProductID);
                                                                    
-- Ricontrolliamo lo stock
SELECT * FROM VistaRestockProdotto WHERE CodiceProdotto = 'D3L7M2' AND CodiceMagazzino = 5;

-- ------------------
-- !!! Vendita 1004 !!!
-- -------------------
-- Che prodotti ci sono al 'Ipercoop Venezia' ?
SELECT Product.ID AS CodiceProdotto, Product.Name AS NomeProdotto, StoreStockLevel.Stock AS Quantità, Category.RestockLevel AS SogliaRestock
FROM Stores JOIN StoreStockLevel ON Stores.ID = StoreStockLevel.StoreID
JOIN Product ON StoreStockLevel.ProductID = Product.ID
JOIN Category ON Product.CategoryID = Category.ID
WHERE Stores.Name = 'Ipercoop Venezia';

-- Vendiamo Mele Golden 'A1X3Y9'
INSERT INTO Sales (StoreID, SalesID, LineID, ProductID, Quantity, UnitPrice, PaymentMethod)
VALUES
('ST2005', 1004, 1, 'A1X3Y9', 30, 1.89, 'Debit Card');

-- Verifichiamo stock ipercoop venezia
SELECT Product.ID AS CodiceProdotto, Product.Name AS NomeProdotto, StoreStockLevel.Stock AS Quantità, Category.RestockLevel AS SogliaRestock
FROM Stores JOIN StoreStockLevel ON Stores.ID = StoreStockLevel.StoreID
JOIN Product ON StoreStockLevel.ProductID = Product.ID
JOIN Category ON Product.CategoryID = Category.ID
WHERE Stores.Name = 'Ipercoop Venezia' AND Product.ID = 'A1X3Y9';


                                                                    