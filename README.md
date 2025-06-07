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
├── datasets/               # Raw ERP & CRM CSV files
├── scripts/                # SQL scripts for ETL and analysis
├── tests/                  # SQL tests and data validation scripts
├── docs/                   # Data model diagrams and documentation 
├── README.md
