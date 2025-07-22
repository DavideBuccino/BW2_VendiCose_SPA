# 🛒 Sistema di Gestione per VendiCose S.p.A.

Questo progetto implementa un sistema relazionale completo per la gestione logistica e commerciale della catena di supermercati **VendiCose S.p.A.**, comprendente magazzini, negozi, prodotti, vendite e automatismi per il riassortimento.

---

## 📁 Struttura del Progetto

### 📌 1. `CREAZIONE_db_vendicose_spa.sql`

Questo script crea il database `db_vendicose_spa` e tutte le tabelle necessarie alla gestione aziendale.

#### 📋 Tabelle Principali

- **`Warehouses`**: elenco dei magazzini con dettagli di contatto.
- **`Category`**: categorie merceologiche con soglie di riassortimento.
- **`Product`**: anagrafica dei prodotti.
- **`StockLevel`**: livelli di stock per ciascun prodotto in ogni magazzino.
- **`Stores`**: negozi fisici collegati ai magazzini.
- **`Sales`**: vendite effettuate nei negozi.
- **`StoreStockLevel`**: stock di prodotti nei punti vendita.
- **`RestockStore`**: pianificazione automatica di riassortimenti per negozi.
- **`StockAlerts`**: notifiche automatiche per prodotti sotto soglia nei magazzini.

#### 🔁 Trigger

- `update_stock_after_insert`: decrementa lo stock in magazzino dopo una vendita.
- `check_stock_level`: genera un alert se lo stock in magazzino scende sotto la soglia.
- `update_store_stock`: aggiorna lo stock del negozio dopo ogni vendita.
- `insert_restock_order`: inserisce una richiesta di rifornimento se lo stock di un negozio è inferiore alla soglia.

#### 👁️ Vista

- **`VistaRestockProdotto`**: mostra il livello di stock attuale, il codice magazzino e la soglia di riassortimento per ciascun prodotto.

---

### 📌 2. `POPOLAMENTO_db_vendicose_spa.sql`

Popola il database con dati realistici e coerenti:

#### 🏬 Magazzini

7 magazzini situati in tutta Italia: Milano, Napoli, Roma, Venezia, Torino, Palermo, Cagliari.

#### 🗃️ Categorie

15 categorie (es. Frutta e Verdura, Latticini, Carne e Pesce, Cura della Persona, Prodotti Biologici) ognuna con una descrizione e soglia di riassortimento.

#### 📦 Prodotti

Inseriti più di 70 prodotti, ciascuno legato a una categoria e con un prezzo massimo di vendita.

#### 🛒 Negozi

20 punti vendita associati ai magazzini, con dati completi su posizione, manager e contatti.

#### 📊 Stock

- I magazzini sono riforniti con stock iniziale per numerosi prodotti.
- Anche i negozi hanno stock indipendenti, gestiti separatamente.

⚙️ Funzionalità Avanzate
Automazione completa con trigger per aggiornamento stock e generazione ordini di riassortimento.

Integrità referenziale garantita grazie a chiavi esterne e vincoli CHECK.

Monitoraggio in tempo reale dello stato del magazzino e dei negozi.

Scalabilità: il sistema è facilmente estendibile a nuovi prodotti, negozi o magazzini.

▶️ Come usare il sistema
Eseguire CREAZIONE_db_vendicose_spa.sql per creare il database e le tabelle.

Eseguire POPOLAMENTO_db_vendicose_spa.sql per inserire dati reali e strutturati.

Eseguire QUERY_db_vendicose_spa.sql per simulare vendite e verificare il comportamento dei trigger.

📌 Obiettivi didattici
Questo progetto è utile per comprendere:

Progettazione logica e fisica di un database.

Utilizzo di trigger e viste.

Automatismi nel flusso di lavoro aziendale (es. restock automatico).

Gestione relazionale complessa in contesti aziendali.
---

### 📌 3. `QUERY_db_vendicose_spa.sql`

Contiene una serie di query dimostrative che simulano vendite e testano il comportamento del sistema.

#### Esempi di funzionalità:

  ```sql
  - **Verifica stock e soglie**:
  SELECT * FROM VistaRestockProdotto WHERE CodiceProdotto = 'A1X3Y9' AND CodiceMagazzino = 2;
  
  ### Esecuzione di una vendita:
  INSERT INTO Sales (StoreID, SalesID, LineID, ProductID, Quantity, UnitPrice, PaymentMethod)
  VALUES ('ST2005', 1001, 1, 'A1X3Y9', 10, 1.89, 'Debit Card');
  
  ### Verifica degli alert sottosoglia:
  SELECT * FROM StockAlerts;
  
  ### Riapprovvigionamento automatico:
  UPDATE StockLevel
  SET Stock = (SELECT Category.RestockLevel FROM Category 
             JOIN Product ON Category.ID = Product.CategoryID 
             WHERE Product.ID = StockLevel.ProductID) + 100
  WHERE ProductID IN (SELECT ProductID FROM StockAlerts);


