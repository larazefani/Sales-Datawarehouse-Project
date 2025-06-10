# 🏗️ Building Data Warehouse

## 📌 Project Objective

The goal of this project is to build a modern data warehouse using **SQL Server** that consolidates sales data from multiple sources. This solution is designed to support analytical use cases and enable data-driven decision making.

---

## 📂 Data Pipeline Overview

### 🔹 Data Sources
- Two source systems: **ERP** and **CRM**
- Provided in **CSV format**

### 🔹 Data Quality
- Clean and standardize data
- Address missing values, duplicates, and inconsistent formatting

### 🔹 Integration
- Merge ERP and CRM data into a **single unified data model**
- Optimized for **analytical queries** and reporting

### 🔹 Scope
- Work is focused on the **most recent datasets only**
- **No historization** or slowly changing dimensions (SCD) implemented

### 🔹 Documentation
- Includes **clear data model documentation** for both:
  - Business stakeholders
  - Analytics & engineering teams

---

# 📊 BI: Analytics & Reporting

## 🎯 Objective

Develop SQL-based analytics to generate insights into:

- 🧍‍♂️ **Customer Behavior** – understand buying patterns and engagement
- 📦 **Product Performance** – track product-level KPIs and performance
- 📈 **Sales Trends** – analyze historical sales patterns and revenue trends

---

## 🛠️ Tech Stack

- SQL Server
- T-SQL (SQL queries & procedures)
- CSV data ingestion
- Power BI / Tableau *(optional, for visualization)*

---

## 📁 Repository Structure

```bash
.
📁 datasets
├── 📁 source_crm
│ ├── cust_info.csv
│ ├── placeholder
│ ├── prd_info.csv
│ └── sales_details.csv
├── 📁 source_erp
│ ├── CUST_AZ12.csv
│ ├── LOC_A101.csv
│ ├── PX_CAT_G1V2.csv
│ ├── placeholder
│ └── placeholder

📁 docs
├── architecture.png
├── data_catalog.md
├── data_flow_diagram.png
├── data_model.drawio.png
├── integration_model.png
├── naming_convention.md
└── placeholder

📁 scripts
├── 📁 bronze
│ ├── ddl_bronze.sql
│ └── proc_load_bronze.sql
├── 📁 gold
│ └── ddl_gold.sql
├── 📁 silver
│ ├── ddl_silver.sql
│ ├── proc_load_silver.sql
│ └── init_database.sql
└── placeholder

📁 tests
├── data_quality_checks_gold.sql
├── data_quality_checks_silver.sql
└── placeholder
