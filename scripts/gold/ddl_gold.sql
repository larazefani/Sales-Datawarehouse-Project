/*
===============================================================================
DDL Script: Create Gold Layer Views
===============================================================================
Purpose:
    This script builds the views for the Gold layer of our data warehouse.
    The Gold layer holds the final, ready-to-use data tables (Star Schema).
    These views transform and merge data from the Silver layer, resulting
    in clean, enhanced data for business use.
Usage:
    - Query these views for analytics and reports.
===============================================================================
*/
----------------------------------------------------------
/*
==========================================================
Create Dimension: gold.dim_customers
==========================================================
*/
IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO
CREATE VIEW gold.dim_customers AS
	SELECT 
		ROW_NUMBER() OVER(ORDER BY ci.cst_id) AS customer_key,
		ci.cst_id AS customer_id,
		ci.cst_key AS customer_number,
		ci.cst_firstname AS first_name,
		ci.cst_lastname AS last_name,
		cl.cntry AS country,
		ci.cst_marital_status AS marital_status,
		CASE 
			WHEN ci.cst_gndr != 'n/a'
			THEN ci.cst_gndr
			ELSE COALESCE(cb.gen, 'n/a')
		END AS gender,
		cb.bdate AS birthdate,
		ci.cst_create_date AS create_date
	FROM silver.crm_cust_info ci
	LEFT JOIN silver.erp_cust_az12 cb
	ON ci.cst_key = cb.cid
	LEFT JOIN silver.erp_loc_a101 cl
	ON ci.cst_key = cl.cid
;
GO

/*
==========================================================
Create Dimension: gold.dim_products
==========================================================
*/

IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO
CREATE VIEW gold.dim_products AS
	SELECT 
		ROW_NUMBER() OVER(ORDER BY pinfo.prd_start_dt, pinfo.prd_key) AS product_key,
		pinfo.prd_id AS product_id,
		pinfo.prd_key AS product_number,
		pinfo.prd_nm AS product_name,
		pinfo.cat_id AS category_id,
		pcat.cat AS category,
		pcat.subcat AS subcategory,
		pcat.maintenance AS maintenance,
		pinfo.prd_cost AS cost,
		pinfo.prd_line AS product_line,
		pinfo.prd_start_dt AS start_date
	FROM silver.crm_prd_info pinfo
	LEFT JOIN silver.erp_px_cat_g1v2 pcat
	ON pinfo.cat_id = pcat.id
	WHERE pinfo.prd_end_dt IS NULL -- TO FILTER OUT HISTORICAL DATA
;
GO

/*
==========================================================
Create Fact: gold.fact_sales
==========================================================
*/

IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO
CREATE VIEW gold.fact_sales AS
	SELECT
		sd.sls_ord_num AS order_number,
		pr.product_key,
		cu.customer_key,
		sd.sls_order_dt AS order_date,
		sd.sls_ship_dt AS shipping_date,
		sd.sls_due_dt AS due_date,
		sd.sls_price AS price,
		sd.sls_quantity AS quantity,
		sd.sls_sales AS sales_amount
	FROM silver.crm_sales_details sd
	LEFT JOIN gold.dim_products pr
	ON sd.sls_prd_key = pr.product_number
	LEFT JOIN gold.dim_customers cu
	ON sd.sls_cust_id = cu.customer_id
;
GO
