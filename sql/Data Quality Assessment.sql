-- Data Quality Assessment 

-- STEP 1


-- QUERY 1 To check for any missing values

SELECT
    COUNT(*) AS total_rows,
    SUM( CASE 
    WHEN Product_Description IS NULL
        OR TRIM(Product_Description) = ''
        THEN 1 ELSE 0 END ) AS missing_descriptions,
    SUM( CASE
    WHEN CustomerID IS NULL
        OR TRIM(CustomerID) = ''
        THEN 1 ELSE 0 END) AS missing_customer_ids,
    SUM( CASE 
    WHEN UnitPrice IS NULL
        OR TRIM(UnitPrice) = ''
        THEN 1 ELSE 0 END) AS missing_prices
FROM retail_sales_raw;



-- QUERY 2: Check for Invalid or unusual transaction values

SELECT
    SUM( CASE 
    WHEN Quantity <= 0
        THEN 1 ELSE 0 END) AS non_positive_quantities,
    SUM( CASE 
    WHEN InvoiceNo LIKE 'C%'
        THEN 1 ELSE 0 END) AS cancellation_lines,
    SUM( CASE 
    WHEN TRIM(UnitPrice) NOT REGEXP
        '^[0-9]+([,.][0-9]+)?$'
        THEN 1 ELSE 0 END) AS unusual_price_formats
FROM retail_sales_raw;


-- QUERY 3: Check duplicate rows

SELECT
    InvoiceNo,
    StockCode,
    Product_Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    COUNT(*) AS occurrences
FROM retail_sales_raw
GROUP BY
    InvoiceNo,
    StockCode,
    Product_Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
HAVING COUNT(*) > 1;


