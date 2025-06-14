/*
==========================================================
Project      : Sales Data Warehouse
Script Name  : init_database.sql
Description  : Initializes the data warehouse by creating the 
               database and layered schemas (bronze, silver, gold).
               Drops existing objects if they already exist.
Author       : Lara Zefani
Date Created : [2025-06-07]
==========================================================
*/

-- Drop the database if it already exists
IF DB_ID('dwh_sales') IS NOT NULL
BEGIN
    DROP DATABASE dwh_sales;
END
GO

-- Create the main Data Warehouse database
CREATE DATABASE dwh_sales;
GO

-- Switch context to the newly created database
USE dwh_sales;
GO


-- Create layered schemas

-- Bronze: Raw ingested data from ERP & CRM
CREATE SCHEMA bronze;
GO

-- Silver: Cleaned and transformed data
CREATE SCHEMA silver;
GO

-- Gold: Final data model optimized for reporting
CREATE SCHEMA gold;
GO
