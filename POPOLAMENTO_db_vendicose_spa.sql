-- Popolazione tabella magazzini
INSERT INTO Warehouses (Name, Location, Email, PhoneNo) 
	VALUES
('Magazzino Nord', 'Milano', 'nord@warehouse.it', '0245678910'),
('Magazzino Sud', 'Napoli', 'sud@warehouse.it', '0815678910'),
('Magazzino Centro', 'Roma', 'centro@warehouse.it', '0645678910'),
('Magazzino Est', 'Venezia', 'est@warehouse.it', '0415678910'),
('Magazzino Ovest', 'Torino', 'ovest@warehouse.it', '0115678910'),
('Magazzino Sicilia', 'Palermo', 'sicilia@warehouse.it', '0915678910'),
('Magazzino Sardegna', 'Cagliari', 'sardegna@warehouse.it', '0705678910');

-- Popolazione tabella categorie
INSERT INTO Category (ID, Name, RestockLevel, Description) 
	VALUES
(1, 'Frutta e Verdura', 150, 'Prodotti freschi di frutta e verdura'),
(2, 'Latticini', 185, 'Latte, formaggi e derivati'),
(3, 'Carne e Pesce', 250, 'Carne, pesce e salumi'),
(4, 'Bevande', 214, 'Bibite, succhi e alcolici'),
(5, 'Pane e Pasticceria', 65, 'Pane fresco, dolci e prodotti da forno'),
(6, 'Alimenti in Scatola', 60, 'Conserve, legumi e alimenti confezionati'),
(7, 'Snack e Dolciumi', 140, 'Patatine, cioccolata e dolci vari'),
(8, 'Surgelati', 200, 'Prodotti surgelati di vario genere'),
(9, 'Cura della Casa', 15, 'Detersivi, detergenti e prodotti per la casa'),
(10, 'Cura della Persona', 65, 'Saponi, shampoo e prodotti igienici'),
(11, 'Pasta e Riso', 98, 'Pasta, riso e cereali'),
(12, 'Condimenti e Spezie', 74, 'Oli, aceti, spezie e condimenti vari'),
(13, 'Alimenti per Bambini', 32,'Omogeneizzati e prodotti per infanzia'),
(14, 'Salute e Benessere', 210, 'Integratori e prodotti per la salute'),
(15, 'Prodotti Biologici', 65,'Alimenti biologici e naturali');

-- Popolazione tabella prodotti
INSERT INTO Product (ID, Name, CategoryID, Description, MaxUnitSalesPrice) 
	VALUES
('A1X3Y9', 'Mele Golden', 1, 'Mele Golden fresche al kg', 2.99),
('B7Z2W5', 'Banane', 1, 'Banane biologiche al kg', 1.89),
('C2X5Y8', 'Arance Tarocco', 1, 'Arance Tarocco siciliane al kg', 3.49),
('D3L7M2', 'Pere Williams', 1, 'Pere Williams fresche al kg', 2.79),
('E8P9Q4', 'Uva Bianca', 1, 'Uva bianca senza semi al kg', 3.99),
('F1K4T7', 'Latte intero', 2, 'Latte intero fresco 1L', 1.29),
('G5M9X2', 'Latte Parzialmente Scremato', 2, 'Latte parzialmente scremato 1L', 1.19),
('H8N2Y4', 'Yogurt Naturale', 2, 'Yogurt naturale intero 150g', 0.99),
('I3P7T6', 'Burro Tradizionale', 2, 'Burro tradizionale 250g', 2.49),
('J9X1L3', 'Mozzarella di Bufala', 2, 'Mozzarella di bufala campana 125g', 2.99),
('K1X9Y5', 'Petto di Pollo', 3, 'Petto di pollo fresco al kg', 7.99),
('L7Z2W8', 'Filetto di Salmone', 3, 'Filetto di salmone fresco al kg', 15.99),
('M3K6N1', 'Carne Macinata', 3, 'Carne macinata di bovino al kg', 9.49),
('N5P2Q9', 'Cosce di Pollo', 3, 'Cosce di pollo fresche al kg', 6.99),
('O4R8L2', 'Gamberi Freschi', 3, 'Gamberi freschi al kg', 19.99),
('P9T3V6', 'Acqua Naturale', 4, 'Bottiglia di acqua naturale 1.5L', 0.50),
('Q4R8L2', 'Succo di Arancia', 4, 'Succo di arancia senza zuccheri 1L', 2.49),
('R2J8V6', 'Tè Freddo Limone', 4, 'Tè freddo al limone 1.5L', 1.79),
('S7H3P9', 'Bevanda Vegetale di Soia', 4, 'Bevanda vegetale di soia 1L', 2.29),
('T1G5X7', 'Acqua Frizzante', 4, 'Bottiglia di acqua frizzante 1.5L', 0.55),
('U4F2N8', 'Pane Integrale', 5, 'Pane integrale fresco 500g', 1.99),
('V6E9K1', 'Croissant', 5, 'Croissant con crema 4 pezzi', 3.49),
('W3D7T2', 'Baguette', 5, 'Baguette francese 250g', 1.49),
('X2A7P5', 'Grissini', 5, 'Grissini stirati torinesi 200g', 1.29),
('Y5B3M8', 'Focaccia Genovese', 5, 'Focaccia genovese classica 300g', 3.79),
('Z9C1L4', 'Tonno in Scatola', 6, "Tonno in scatola all'olio d'oliva", 2.99),
('A3K9M4', 'Piselli in Scatola', 6, 'Piselli lessati in scatola', 1.79),
('B8T4Y1', 'Fagioli Cannellini', 6, 'Fagioli cannellini lessati 400g', 1.69),
('C7H3P9', 'Lenticchie in Scatola', 6, 'Lenticchie lessate 400g', 1.89),
('D2J8V6', 'Pomodori Pelati', 6, 'Pomodori pelati in scatola 500g', 2.49),
('E9T1V6', 'Cioccolato Fondente', 7, 'Tavoletta di cioccolato fondente 85%', 2.49),
('F4R7L8', 'Patatine Classiche', 7, 'Patatine croccanti classiche 150g', 1.99),
('G6N3X1', 'Biscotti Integrali', 7, 'Biscotti integrali senza zuccheri aggiunti 300g', 3.19),
('H2B5C7', 'Barrette di Cereali', 7, 'Barrette di cereali e miele 6x25g', 2.99),
('I8M4T2', 'Crackers Salati', 7, 'Crackers salati classici 250g', 1.79),
('J1X9Y5', 'Pizza Margherita Surgelata', 8, 'Pizza Margherita surgelata 400g', 3.99),
('K7Z2W8', 'Verdure Miste Surgelate', 8, 'Mix di verdure surgelate 1kg', 4.99),
('L3K6N1', 'Bastoncini di Pesce', 8, 'Bastoncini di pesce surgelati 300g', 3.49),
('M5P2Q9', 'Gelato alla Vaniglia', 8, 'Gelato alla vaniglia 500g', 4.49),
('N4R8L2', 'Lasagne Surgelate', 8, 'Lasagne alla bolognese surgelate 600g', 5.99),
('N4R8L1', 'Detersivo Piatti', 9, 'Detersivo liquido per piatti', 2.99),
('N4R8C2', 'Candeggina', 9, 'Candeggina per la pulizia della casa', 1.49),
('N4R8L3', 'Pulitore Multisuperficie', 9, 'Pulitore per tutte le superfici della casa', 3.29),
('N4R8L4', 'Sgrassatore', 9, 'Sgrassatore potente per cucina e bagno', 3.79),
('N4R8L5', 'Ammorbidente', 9, 'Ammorbidente per bucato', 2.59),
('N4R8L6', 'Sapone Liquido', 10, 'Sapone liquido per mani', 1.99),
('N4R8L7', 'Shampoo per Capelli Secchi', 10, 'Shampoo idratante per capelli secchi', 4.50),
('N4R8L8', 'Bagnoschiuma', 10, 'Bagnoschiuma profumato e delicato', 2.79),
('N4R8L9', 'Deodorante', 10, 'Deodorante per una protezione duratura', 3.99),
('N4R8L10', 'Crema Idratante', 10, 'Crema per il viso e corpo idratante', 5.29),
('N4R8L11', 'Spaghetti', 11, 'Pasta lunga, 500g', 1.29),
('N4R8L12', 'Riso Arborio', 11, 'Riso per risotti, 1kg', 2.50),
('N4R8L13', 'Cous Cous', 11, 'Cous cous precotto, 500g', 3.00),
('N4R8L14', 'Fusilli', 11, 'Pasta corta, 500g', 1.49),
('N4R8L15', 'Farina di Grano', 11, 'Farina tipo 00, 1kg', 1.09),
('N4R8L16', 'Olio Extra Vergine di Oliva', 12, 'Olio extra vergine di oliva, 500ml', 4.99),
('N4R8L17', 'Aceto Balsamico', 12, 'Aceto balsamico tradizionale, 250ml', 5.99),
('N4R8L18', 'Pepe Nero', 12, 'Pepe nero macinato, 50g', 1.59),
('N4R8L19', 'Sale Marino', 12, 'Sale marino grosso, 1kg', 0.99),
('N4R8L20', 'Origano', 12, 'Origano essiccato, 30g', 1.29),
('N4R8L21', 'Omogeneizzato di Carne', 13, 'Omogeneizzato di carne per bambini', 2.10),
('N4R8L22', 'Omogeneizzato di Frutta', 13, 'Omogeneizzato di frutta per bambini', 1.80),
('N4R8L23', 'Latte in Polvere', 13, 'Latte in polvere per neonati', 8.90),
('N4R8L24', 'Pappe per Bambini', 13, 'Pappa pronta per bambini', 3.50),
('N4R8L25', 'Biscotti per Infanzia', 13, 'Biscotti per bambini, 200g', 2.99),
('N4R8L26', 'Integratore Vitamine', 14, 'Integratore di vitamine per adulti', 12.99),
('N4R8L27', 'Omega 3', 14, 'Integratore Omega 3, 60 capsule', 15.49),
('N4R8L28', 'Magnesio', 14, 'Magnesio in compresse, 30 compresse', 7.99),
('N4R8L29', 'Probiotici', 14, 'Integratori probiotici per la digestione', 9.49),
('N4R8L30', 'Collagene', 14, 'Integratore di collagene, 90 capsule', 18.99),
('N4R8L31', 'Miele Biologico', 15, 'Miele biologico di alta qualità', 5.49),
('N4R8L32', 'Pasta Integrale', 15, 'Pasta integrale, 500g', 2.99),
('N4R8L33', 'Farina di Mais Biologica', 15, 'Farina di mais biologica, 1kg', 3.49),
('N4R8L34', 'Succhi di Frutta Biologici', 15, 'Succhi di frutta biologici, 250ml', 1.99),
('N4R8L35', 'Legumi Biologici', 15, 'Legumi biologici, 500g', 2.69);

-- Controllare che i nomi siano tutti distinti
SELECT COUNT(Name) AS ProdottiTotali, COUNT(DISTINCT Name) AS ProdottiDistinti FROM Product;
    
-- Popolazione tabella negozi
INSERT INTO Stores (ID, WarehouseID, Name, Location, ManagerName, ContactNumber) 
	VALUES
('ST1542', 7, 'Esselunga Milano', 'Milano, Via Torino 12', 'Marco Rossi', '+39 02 1234567'),
('ST2584', 7, 'Carrefour Market Milano', 'Milano, Corso Buenos Aires 45', 'Laura Bianchi', '+39 02 9876543'),
('ST8574', 6, 'Conad Roma', 'Roma, Via del Corso 33', 'Giovanni Verdi', '+39 06 2222333'),
('ST1584', 6, 'Lidl Roma', 'Roma, Piazza Venezia 5', 'Francesca Neri', '+39 06 4444555'),
('ST1526', 5, 'Coop Napoli', 'Napoli, Via Toledo 99', 'Antonio Esposito', '+39 081 1111222'),
('ST7251', 5, 'Penny Market Napoli', 'Napoli, Corso Umberto I 25', 'Elisa De Luca', '+39 081 5555666'),
('ST9024', 4, 'Ipercoop Firenze', 'Firenze, Via de Tornabuoni 18', 'Paolo Ricci', '+39 055 7777888'),
('ST4433', 4, 'Pam Firenze', 'Firenze, Piazza della Repubblica 7', 'Anna Conti', '+39 055 3333444'),
('ST9800', 3, 'Eurospin Torino', 'Torino, Via Roma 120', 'Luca Martini', '+39 011 6666777'),
('ST3931', 3, 'Conad Torino', 'Torino, Corso Vittorio Emanuele 99', 'Giulia Ferri', '+39 011 2222333'),
('ST4121', 3, 'Esselunga Bologna', 'Bologna, Via Indipendenza 55', 'Matteo Galli', '+39 051 9999000'),
('ST7878', 3, 'Carrefour Bologna', 'Bologna, Piazza Maggiore 3', 'Sara Romano', '+39 051 8888777'),
('ST1499', 4, 'Lidl Palermo', 'Palermo, Via Libertà 88', 'Davide Greco', '+39 091 4444333'),
('ST0518', 4, 'Conad Palermo', 'Palermo, Corso Calatafimi 102', 'Martina Russo', '+39 091 1111222'),
('ST3474', 1, 'Supermercati Dok Venezia', 'Venezia, Campo San Polo 17', 'Federico Moretti', '+39 041 6666777'),
('ST2005', 2, 'Ipercoop Venezia', 'Venezia, Strada Nova 46', 'Valentina Sartori', '+39 041 8888999'),
('ST9747', 2, 'Penny Market Genova', 'Genova, Via Garibaldi 21', 'Roberto De Santis', '+39 010 7777888'),
('ST8500', 5, 'Carrefour Genova', 'Genova, Corso Italia 78', 'Alessia Bruno', '+39 010 9999000'),
('ST2140', 7, 'Conad Bari', 'Bari, Via Sparano 14', 'Pietro Romano', '+39 080 3333444'),
('ST4178', 2, 'Pam Bari', 'Bari, Corso Cavour 62', 'Elena Gatti', '+39 080 2222111');


-- Popolazione Warehouse 1
INSERT INTO StockLevel (ProductID, WarehouseID, Stock)
VALUES
('A1X3Y9', 1, 100),
('B7Z2W5', 1, 150),
('D3L7M2', 1, 200),
('E8P9Q4', 1, 250),
('F4R7L8', 1, 300),
('G5M9X2', 1, 120),
('H8N2Y4', 1, 80),
('I3P7T6', 1, 50),
('J9X1L3', 1, 90),
('K7Z2W8', 1, 180),
('L7Z2W8', 1, 220),
('M3K6N1', 1, 60),
('N4R8L12', 1, 40),
('O4R8L2', 1, 70),
('P9T3V6', 1, 300),
('Q4R8L2', 1, 130),
('R2J8V6', 1, 110),
('S7H3P9', 1, 90),
('T1G5X7', 1, 60),
('V6E9K1', 1, 250),
('W3D7T2', 1, 180);

-- Popolazione Warehouse 2
INSERT INTO StockLevel (ProductID, WarehouseID, Stock)
VALUES
('A1X3Y9', 2, 100),
('B7Z2W5', 2, 150),
('D3L7M2', 2, 200),
('E8P9Q4', 2, 250),
('F4R7L8', 2, 300),
('G5M9X2', 2, 120),
('H8N2Y4', 2, 80),
('I3P7T6', 2, 50),
('J9X1L3', 2, 90),
('K7Z2W8', 2, 180 ),
('L7Z2W8', 2, 220 ),
('M3K6N1', 2, 60 ),
('N4R8L12', 2, 40 ),
('O4R8L2', 2, 70),
('P9T3V6', 2, 300 ),
('Q4R8L2', 2, 130 ),
('R2J8V6', 2, 110 ),
('S7H3P9', 2, 90 ),
('T1G5X7', 2, 60),
('V6E9K1', 2, 250 ),
('W3D7T2', 2, 180 );

-- Popolazione Warehouse 3
INSERT INTO StockLevel (ProductID, WarehouseID, Stock)
VALUES
('A1X3Y9', 3, 100),
('B7Z2W5', 3, 150),
('D3L7M2', 3, 200),
('E8P9Q4', 3, 250),
('F4R7L8', 3, 300),
('G5M9X2', 3, 120),
('H8N2Y4', 3, 80),
('I3P7T6', 3, 50),
('J9X1L3', 3, 90),
('K7Z2W8', 3, 180),
('L7Z2W8', 3, 220),
('M3K6N1', 3, 60),
('N4R8L12', 3, 40),
('O4R8L2', 3, 70),
('P9T3V6', 3, 300),
('Q4R8L2', 3, 130),
('R2J8V6', 3, 110),
('S7H3P9', 3, 90),
('T1G5X7', 3, 60),
('V6E9K1', 3, 250),
('W3D7T2', 3, 180);

-- Popolazione Warehouse 4
INSERT INTO StockLevel (ProductID, WarehouseID, Stock)
VALUES
('A1X3Y9', 4, 110),
('B7Z2W5', 4, 160),
('D3L7M2', 4, 210),
('E8P9Q4', 4, 260),
('F4R7L8', 4, 310),
('G5M9X2', 4, 130),
('H8N2Y4', 4, 85),
('I3P7T6', 4, 55),
('J9X1L3', 4, 95),
('K7Z2W8', 4, 190),
('L7Z2W8', 4, 230),
('M3K6N1', 4, 65),
('N4R8L12', 4, 45),
('O4R8L2', 4, 75),
('P9T3V6', 4, 310),
('Q4R8L2', 4, 140),
('R2J8V6', 4, 120),
('S7H3P9', 4, 95),
('T1G5X7', 4, 65),
('V6E9K1', 4, 260),
('W3D7T2', 4, 190);

-- Popolazione Warehouse 5
INSERT INTO StockLevel (ProductID, WarehouseID, Stock)
VALUES
('A1X3Y9', 5, 120),
('B7Z2W5', 5, 170),
('D3L7M2', 5, 220),
('E8P9Q4', 5, 270),
('F4R7L8', 5, 320),
('G5M9X2', 5, 140),
('H8N2Y4', 5, 90),
('I3P7T6', 5, 60),
('J9X1L3', 5, 100),
('K7Z2W8', 5, 200),
('L7Z2W8', 5, 240),
('M3K6N1', 5, 70),
('N4R8L12', 5, 50),
('O4R8L2', 5, 80),
('P9T3V6', 5, 320),
('Q4R8L2', 5, 150),
('R2J8V6', 5, 130),
('S7H3P9', 5, 100),
('T1G5X7', 5, 70),
('V6E9K1', 5, 270),
('W3D7T2', 5, 200);


-- Popolazione Warehouse 6
INSERT INTO StockLevel (ProductID, WarehouseID, Stock)
VALUES
('A1X3Y9', 6, 130),
('B7Z2W5', 6, 180),
('D3L7M2', 6, 230),
('E8P9Q4', 6, 280),
('F4R7L8', 6, 330),
('G5M9X2', 6, 150),
('H8N2Y4', 6, 95),
('I3P7T6', 6, 65),
('J9X1L3', 6, 105),
('K7Z2W8', 6, 210),
('L7Z2W8', 6, 250),
('M3K6N1', 6, 75),
('N4R8L12', 6, 55),
('O4R8L2', 6, 85),
('P9T3V6', 6, 330),
('Q4R8L2', 6, 160),
('R2J8V6', 6, 140),
('S7H3P9', 6, 105),
('T1G5X7', 6, 75),
('V6E9K1', 6, 280),
('W3D7T2', 6, 210);


-- Popolazione Warehouse 7
INSERT INTO STOCKLEVEL (ProductID, WarehouseID, Stock)
VALUES
('A1X3Y9', 7, 140),
('B7Z2W5', 7, 190),
('D3L7M2', 7, 240),
('E8P9Q4', 7, 290),
('F4R7L8', 7, 340),
('G5M9X2', 7, 160),
('H8N2Y4', 7, 100),
('I3P7T6', 7, 70),
('J9X1L3', 7, 110),
('K7Z2W8', 7, 220),
('L7Z2W8', 7, 260),
('M3K6N1', 7, 80),
('N4R8L12', 7, 60),
('O4R8L2', 7, 90),
('P9T3V6', 7, 340),
('Q4R8L2', 7, 170),
('R2J8V6', 7, 150),
('S7H3P9', 7, 110),
('T1G5X7', 7, 80),
('V6E9K1', 7, 290),
('W3D7T2', 7, 220);



INSERT INTO StoreStockLevel (ProductID, StoreID, Stock)
VALUES
    ('A1X3Y9', 'ST3474', 23), ('A1X3Y9', 'ST2005', 45), ('A1X3Y9', 'ST4178', 67), ('A1X3Y9', 'ST9747', 12), ('A1X3Y9', 'ST3931', 34), ('A1X3Y9', 'ST4121', 78), ('A1X3Y9', 'ST7878', 56), ('A1X3Y9', 'ST9800', 89),
    ('B7Z2W5', 'ST3474', 21), ('B7Z2W5', 'ST2005', 90), ('B7Z2W5', 'ST4178', 48), ('B7Z2W5', 'ST9747', 33), ('B7Z2W5', 'ST3931', 62), ('B7Z2W5', 'ST4121', 14), ('B7Z2W5', 'ST7878', 77), ('B7Z2W5', 'ST9800', 59),
    ('C2X5Y8', 'ST3474', 82), ('C2X5Y8', 'ST2005', 31), ('C2X5Y8', 'ST4178', 26), ('C2X5Y8', 'ST9747', 95), ('C2X5Y8', 'ST3931', 18), ('C2X5Y8', 'ST4121', 43), ('C2X5Y8', 'ST7878', 64), ('C2X5Y8', 'ST9800', 29),
    ('D3L7M2', 'ST3474', 57), ('D3L7M2', 'ST2005', 81), ('D3L7M2', 'ST4178', 42), ('D3L7M2', 'ST9747', 70), ('D3L7M2', 'ST3931', 39), ('D3L7M2', 'ST4121', 88), ('D3L7M2', 'ST7878', 11), ('D3L7M2', 'ST9800', 61),
    ('E8P9Q4', 'ST3474', 25), ('E8P9Q4', 'ST2005', 76), ('E8P9Q4', 'ST4178', 49), ('E8P9Q4', 'ST9747', 23), ('E8P9Q4', 'ST3931', 45), ('E8P9Q4', 'ST4121', 67), ('E8P9Q4', 'ST7878', 12), ('E8P9Q4', 'ST9800', 34),
    ('F1K4T7', 'ST3474', 78), ('F1K4T7', 'ST2005', 56), ('F1K4T7', 'ST4178', 89), ('F1K4T7', 'ST9747', 21), ('F1K4T7', 'ST3931', 90), ('F1K4T7', 'ST4121', 48), ('F1K4T7', 'ST7878', 33), ('F1K4T7', 'ST9800', 62),
    ('G5M9X2', 'ST3474', 14), ('G5M9X2', 'ST2005', 77), ('G5M9X2', 'ST4178', 59), ('G5M9X2', 'ST9747', 82), ('G5M9X2', 'ST3931', 31), ('G5M9X2', 'ST4121', 26), ('G5M9X2', 'ST7878', 95), ('G5M9X2', 'ST9800', 18),
    ('H8N2Y4', 'ST3474', 43), ('H8N2Y4', 'ST2005', 64), ('H8N2Y4', 'ST4178', 29), ('H8N2Y4', 'ST9747', 57), ('H8N2Y4', 'ST3931', 81), ('H8N2Y4', 'ST4121', 42), ('H8N2Y4', 'ST7878', 70), ('H8N2Y4', 'ST9800', 39),
    ('I3P7T6', 'ST3474', 88), ('I3P7T6', 'ST2005', 11), ('I3P7T6', 'ST4178', 61), ('I3P7T6', 'ST9747', 25), ('I3P7T6', 'ST3931', 76), ('I3P7T6', 'ST4121', 49), ('I3P7T6', 'ST7878', 23), ('I3P7T6', 'ST9800', 45),
    ('J9X1L3', 'ST3474', 67), ('J9X1L3', 'ST2005', 12), ('J9X1L3', 'ST4178', 34), ('J9X1L3', 'ST9747', 78), ('J9X1L3', 'ST3931', 56), ('J9X1L3', 'ST4121', 89), ('J9X1L3', 'ST7878', 21), ('J9X1L3', 'ST9800', 90);