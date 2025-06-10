# Data Catalog: Gold Layer - Ready-to-Use Data

## Overview

The Gold Layer contains the final, business-ready data in our data warehouse.  It's organized for easy analysis and reporting, using a star schema design with dimension and fact tables. This layer combines and transforms data from the Silver Layer to provide clean, consistent information.

---

### 1. **gold.dim_customers**

- **Purpose:**  Customer information, ready for reporting. Combines customer details from CRM and ERP systems with location data.
- **Source Tables:** `silver.crm_cust_info`, `silver.erp_cust_az12`, `silver.erp_loc_a101`
- **Key Columns:**

| Column Name   | Data Type | Description                                                                 |
|---------------|-----------|-----------------------------------------------------------------------------|
| customer_key  | INT       | Unique ID for each customer in this table.                                  |
| customer_id   | INT       | Customer ID from the CRM system.                                           |
| customer_number | NVARCHAR(50) | Customer Number from the CRM system.                                           |
| first_name    | NVARCHAR(50) | Customer's first name.                                                    |
| last_name     | NVARCHAR(50) | Customer's last name.                                                     |
| country       | NVARCHAR(50) | Customer's country of residence.                                          |
| marital_status| NVARCHAR(50) | Customer's marital status.                                                |
| gender        | NVARCHAR(50) | Customer's gender.                                                        |
| birthdate     | DATE      | Customer's date of birth.                                                   |
| create_date   | DATE      | Date the customer record was created in the CRM system.                      |

---

### 2. **gold.dim_products**

- **Purpose:** Product information, ready for reporting. Combines product details from CRM and ERP systems.
- **Source Tables:** `silver.crm_prd_info`, `silver.erp_px_cat_g1v2`
- **Key Columns:**

| Column Name         | Data Type | Description                                                                 |
|---------------------|-----------|-----------------------------------------------------------------------------|
| product_key         | INT       | Unique ID for each product in this table.                                  |
| product_id          | INT       | Product ID from the CRM system.                                            |
| product_number      | NVARCHAR(50) | Product number from the CRM system.                                            |
| product_name        | NVARCHAR(50) | Product name.                                                             |
| category_id         | NVARCHAR(50) | Category ID from the ERP system.                                          |
| category            | NVARCHAR(50) | Product category (e.g., Bikes, Components).                               |
| subcategory         | NVARCHAR(50) | Product subcategory (e.g., Road Bikes, Mountain Bikes).                    |
| maintenance_required| NVARCHAR(50) | Indicates if the product requires maintenance (Yes/No).                     |
| cost                | INT       | Product cost.                                                               |
| product_line        | NVARCHAR(50) | Product line (e.g., Road, Mountain).                                      |
| start_date          | DATE      | Date the product became available.                                          |

---

### 3. **gold.fact_sales**

- **Purpose:** Sales transaction data, ready for reporting and analysis.
- **Source Table:** `silver.crm_sales_details`
- **Key Columns:**

| Column Name   | Data Type | Description                                                                 |
|---------------|-----------|-----------------------------------------------------------------------------|
| order_number  | NVARCHAR(50) | Unique identifier for each sales order.                                     |
| product_key   | INT       | Foreign key linking to the `dim_products` table.                             |
| customer_key  | INT       | Foreign key linking to the `dim_customers` table.                            |
| order_date    | DATE      | Date the order was placed.                                                  |
| shipping_date | DATE      | Date the order was shipped.                                                 |
| due_date      | DATE      | Date the order payment was due.                                             |
| sales_amount  | INT       | Total sales amount for the order line item.                                 |
| quantity      | INT       | Quantity of the product ordered.                                            |
| price         | INT       | Price per unit of the product.                                              |
