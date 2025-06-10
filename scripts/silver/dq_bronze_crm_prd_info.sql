-- Data Quality Check bronze.crm_prd_info

/* 
Check Nulls and Duplicates for Primary Key 
*/

SELECT prd_id, COUNT(*) FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

/*
Check for Whitespaces
*/

SELECT prd_nm FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

/*
Check for Nulls or Negative Numbers
*/

SELECT prd_cost FROM bronze.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

/*
Data Standardization & Consistency
*/
SELECT prd_line FROM bronze.crm_prd_info

/*
Check for Invalid Date Orders
*/
SELECT prd_start_dt, prd_end_dt FROM bronze.crm_prd_info
WHERE prd_start_dt > prd_end_dt OR prd_start_dt IS NULL OR prd_end_dt IS NULL

-- SOLUTION : USING WINDOW FUNCTION. 
-- prd_end_dt = (prd_start_dt of the 'next' record) - 1
