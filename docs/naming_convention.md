# 🧾 Data Warehouse Naming Conventions

This guide explains how to name schemas, tables, views, columns, and stored procedures in the data warehouse. Sticking to a consistent naming standard helps keep things clean, understandable, and easier to maintain.

---

## 📚 Table of Contents

- General Rules
- Table Naming (Bronze, Silver, Gold)
- Column Naming
- Surrogate Keys
- Technical Columns
- Stored Procedures

---

## ⚙️ General Rules

- Use **snake_case** (lowercase with underscores) for all names.
- Always use **English**.
- Avoid using **SQL reserved words** (like `select`, `table`, `from`, etc.).
  
Example: ✅ `customer_sales`, ❌ `CustomerSales` or `select`

---

## 🧱 Table Naming Conventions

### 🟤 Bronze Layer

- Table names start with the **source system name**.
- Keep the original source table name—**no renaming**.

**Pattern**:  
`<source>_<entity>`

**Example**:  
`crm_customer_info` → Customer data from CRM system

### 🪙 Silver Layer

- Follows the **same rule as Bronze**: use the source system and original table name.

**Pattern**:  
`<source>_<entity>`

**Example**:  
`erp_product_list` → Product list from ERP system

### 🏆 Gold Layer

- Tables use **business-friendly names** with a clear prefix that shows their role.

**Pattern**:  
`<category>_<entity>`

Where:
- `dim_` → Dimension tables  
- `fact_` → Fact tables  
- `report_` → Report-level summary tables

**Examples**:  
- `dim_customers` → Customer dimension  
- `fact_sales` → Sales fact table  
- `report_sales_monthly` → Monthly sales report

---

## 📌 Column Naming

### 🔑 Surrogate Keys

Use `_key` as a suffix for all surrogate (primary) keys in dimension tables.

**Pattern**:  
`<table_name>_key`

**Example**:  
`customer_key` → Surrogate key in `dim_customers`

### 🛠️ Technical Columns

System-generated columns should start with `dwh_`.

**Pattern**:  
`dwh_<purpose>`

**Example**:  
`dwh_load_date` → Date when the row was loaded into the warehouse

---

## 🧮 Stored Procedures

All procedures for loading data into a specific layer must follow this format:

**Pattern**:  
`load_<layer>`

**Examples**:  
- `load_bronze` → Loads raw data  
- `load_silver` → Loads cleaned and transformed data  
- `load_gold` → Loads final business-facing tables
