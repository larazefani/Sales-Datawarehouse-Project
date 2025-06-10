/*
===============================================================================
Gold Layer Data Quality Checks
===============================================================================
Purpose:
    This script checks the Gold Layer data to make sure it's correct and reliable.
    It verifies:
    - Unique IDs in customer and product tables.
    - That sales data is linked correctly to customer and product information.
    - Overall data relationships for accurate reporting.

How to Use:
    - If any checks show problems, investigate and fix the data.
===============================================================================
*/

-- ====================================================================
-- Checking 'gold.dim_customers' Table
-- ====================================================================
-- Check: Are there any duplicate Customer IDs?
-- Expected Result: No duplicates found.
SELECT
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.dim_products' Table
-- ====================================================================
-- Check: Are there any duplicate Product IDs?
-- Expected Result: No duplicates found.
SELECT
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.fact_sales' Table
-- ====================================================================
-- Check: Are all sales records correctly linked to customers and products?
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL
