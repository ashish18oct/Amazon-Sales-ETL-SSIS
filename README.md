# Amazon Sales ETL Project using SSIS

## 📌 Project Overview

This project is a data warehousing and ETL pipeline implementation using SQL Server Integration Services (SSIS). The goal is to transform raw Amazon sales data into a structured star schema format to enable efficient business intelligence and reporting.

The project is built as part of an academic class assignment for learning and applying core ETL, data transformation, and warehousing concepts using Microsoft technologies.

---

## 📂 Repository Structure

```
├── AmazonSalesETL/           # SSIS packages and control flow logic
├── Data/                     # Raw source files used in ETL
├── DbScripts/                # SQL scripts for database schema and data loading
├── images/                   # Diagrams and visuals used in documentation
├── DataWarehousing & Pipeline Project Report.pdf  # Final report
├── Setup-Instructions.txt    # Local setup instructions
├── README.md                 # Project readme (this file)
└── AmazonSalesETL.sln        # Visual Studio solution file
```

---

## 📊 Star Schema Design

The original flat file was transformed into a **star schema** consisting of one fact table and five dimension tables:

- **Fact Table:**
  - `FactSales`:
    - `SalesKey` (PK)
    - `ProductKey` (FK)
    - `TimeKey` (FK)
    - `LocationKey` (FK)
    - `SalesChannelKey` (FK)
    - `OrderStatusKey` (FK)
    - `Quantity`
    - `Amount`

- **Dimension Tables:**
  - `DimProduct`: `SKU`, `Style`, `Category`, `Size`, `ProductCode` (parsed), `Line` (parsed)
  - `DimTime`: `Date`, `Day`, `Month`, `Quarter`, `Year`, `Week`
  - `DimLocation`: `City`, `State`, `PostalCode`, `Country`
  - `DimSalesChannel`: `Sales Channel`, `Fulfilment`, `Service Level`
  - `DimOrderStatus`: `Status`, `Status Category` (derived)

---

## ⚙️ ETL Pipeline Using SSIS

The ETL process is managed using **SQL Server Integration Services (SSIS)** and consists of:

1. **Extract**: Reading data from Excel/CSV files located in the `Data` folder.
2. **Transform**:
   - Data cleansing (null handling, data type conversions)
   - Parsing of `ProductCode` and `Line` in `DimProduct`
   - Derivation of `Status Category` in `DimOrderStatus`
   - Derived column creation and type casting
   - Lookup operations for dimension key retrieval
3. **Load**:
   - Populating dimension tables first
   - Then populating the fact table using foreign keys

ETL logic is modularized using **Sequence Containers** in the SSIS package.

---

## 📈 Key Insights Derived

The project analyzes sales data to answer business-oriented questions such as:

- Which product categories generate the highest revenue?
- How does customer location influence order volume?
- What time periods (monthly/quarterly) show peak sales?
- What is the preferred sales channel among customers?

These insights are documented in the project report.

---

## 🧰 Tools & Technologies Used

- **SQL Server 2019**
- **SSIS (SQL Server Integration Services)**
- **Visual Studio 2019**
- **MS Excel** for raw data storage
- **T-SQL** for schema creation and data manipulation

---

## 📄 Documentation

Please refer to the following documents for detailed understanding:

- [`DataWarehousing & Pipeline Project Report.pdf`](./DataWarehousing%20%26%20Pipeline%20Project%20Report.pdf): Complete technical documentation including star schema, data dictionary, and results.
- [`Setup-Instructions.txt`](./Setup-Instructions.txt): Step-by-step guide to set up the project on your local environment.

---

## ✅ How to Run

1. Clone this repository.
2. Install SQL Server and Visual Studio with the SSIS extension.
3. Run the scripts in the `DbScripts` folder to create the schema.
4. Load the SSIS solution (`AmazonSalesETL.sln`) in Visual Studio.
5. Execute the packages after connecting to your local database and Excel source files.

---

## 🧑‍💻 Authors & Contributions

This project was completed as part of the [ETL & Data Warehousing Class Project]. Contributions are detailed in the `Work-Repartition.pdf` file.

---

## 📬 Contact

For any questions or feedback, feel free to open an issue or contact the author via GitHub.

---
