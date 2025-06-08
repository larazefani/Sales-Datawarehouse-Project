# 🧾 Data Warehouse Naming Conventions

This guide explains how to name schemas, tables, views, columns, stored procedures, and scripts in the data warehouse. Following a clear, consistent naming style helps keep things organized and maintainable.

---

## 📚 Table of Contents

- [⚙️ General Rules](#️-general-rules)
- [🧱 Table Naming Conventions](#-table-naming-conventions)
  - [🟤 Bronze Layer](#-bronze-layer)
  - [🪙 Silver Layer](#-silver-layer)
  - [🏆 Gold Layer](#-gold-layer)
- [📌 Column Naming](#-column-naming)
  - [🔑 Surrogate Keys](#-surrogate-keys)
  - [🛠️ Technical Columns](#️-technical-columns)
- [🧮 Stored Procedures](#-stored-procedures)

---

## ⚙️ General Rules

- Use `snake_case` (lowercase + underscores).
- Use **English** only.
- Don’t use **SQL reserved words** (`select`, `from`, `table`, etc.).

✅ `customer_sales`  
❌ `CustomerSales`, `select`

---

## 🧱 Table Naming Conventions

### 🟤 Bronze Layer

- Prefix table names with the **source system**.
- Keep the original name from the source—**no renaming**.

**Pattern**:  
`<source>_<entity>`

**Example**:  
`crm_customer_info` → Customer data from CRM

---

### 🪙 Silver Layer

- Same rule as Bronze: source system + original table name.

**Pattern**:  
`<source>_<entity>`

**Example**:  
`erp_product_list` → Product list from ERP

---

### 🏆 Gold Layer

- Use **business-friendly names** with a prefix showing the table’s role.

**Pattern**:  
`<category>_<entity>`

**Categories**:
- `dim_` → Dimension tables  
- `fact_` → Fact tables  
- `report_` → Summary/report tables

**Examples**:
- `dim_customers`
- `fact_sales`
- `report_sales_monthly`

---

## 📌 Column Naming

### 🔑 Surrogate Keys

Use `_key` suffix for surrogate (primary) keys in dimension tables.

**Pattern**:  
`<table_name>_key`

**Example**:  
`customer_key` → Primary key in `dim_customers`

---

### 🛠️ Technical Columns

System-generated columns should start with `dwh_`.

**Pattern**:  
`dwh_<purpose>`

**Example**:  
`dwh_load_date` → Date the record was loaded

---

## 🧮 Stored Procedures

Stored procedures for data loading should follow this pattern:

**Pattern**:  
`load_<layer>`

**Examples**:
- `load_bronze` → Loads raw data  
- `load_silver` → Loads cleaned data  
- `load_gold` → Loads final business-layer tables
