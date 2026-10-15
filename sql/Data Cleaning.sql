-- DATA CLEANING 

use retail_sales_db;
drop table if exists retail_sales_clean;

create table retail_sales_clean as
SELECT
	InvoiceNo,
    StockCode,
    Product_Description,
    Quantity,
    str_to_date( -- Changing date format of the Invoice_Date column
		InvoiceDate,
        '%Y/%m/%d %H:%i'
    ) as InvoiceDate,
    CAST( -- Changing the datatype of the UnitPrice column fron text to decimal
        REPLACE(UnitPrice, ',', '.')
        AS DECIMAL(12,4)
    ) AS UnitPrice,
    NULLIF(TRIM(CustomerID), '') AS CustomerID, -- Two inputs are compared and if they are equal it returns null 
    Country,
    ROUND(
        Quantity * -- Quantity multiplied by UnitPrice to calculate the Revenue
        CAST(
            REPLACE(UnitPrice, ',', '.')
            AS DECIMAL(12,4)
        ), 2 -- rounded off to 2 decimal places
    ) AS Revenue
FROM retail_sales_raw
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(
      REPLACE(UnitPrice, ',', '.')
      AS DECIMAL(12,4)
  ) > 0;
  
  
  -- Checking the cleaned data:
  
  select count(*) AS cleaned_rows, -- count the number of cleaned rows
  round(Sum(Revenue), 2) as total_revenue, -- Round off the sum of revenue to 2 dedimal places
  min(InvoiceDate) as earliest_transaction, 
  max(InvoiceDate) as latest_transaction
  from retail_sales_clean;
  
  -- Preview the cleaned data
  SELECT * 
  FRoM retail_sales_clean
  Limit 10;