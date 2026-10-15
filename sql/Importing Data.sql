-- Create database and table to import the data to 

CREATE DATABASE IF NOT EXISTS retail_sales_db;
USE retail_sales_db; -- Commands should operate inside it


-- Copying data into table i created so that i can edt data without messing with the original data
CREATE TABLE IF NOT EXISTS retail_sales_raw(
InvoiceNo VarChar(20),
StockCode Varchar(30),
Product_Description Text,
Quantity int,
InvoiceDate varchar(40),
UnitPrice VArchar(40),
CustomerID VarChar(30),
Country varchar(100)
);

-- change UnitPRice data type to VarChar 
-- import failed because its decimal has commas and mysql is trying to get them with fullstops
ALTER table retail_sales_raw
Modify column UnitPrice Varchar(40);


SELECT COUNT(*) AS rows_before_cleanup
FROM retail_sales_raw;

-- Counting total number of rows in our table
select count(*) as total_rows
FROM retail_sales_raw;

-- Checking if our data has been loaded in correctly by looking at the first 10 records 
select * 
from retail_sales_raw
limit 10;


-- 

