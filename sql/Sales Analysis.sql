-- SQL Sales Analysis 

-- Query 1: Which products generate the most revenue?
 SELECT 
	StockCode,
    Product_Description,
    sum(Quantity) AS Units_Sold,
    Round(SUM(Revenue), 2) AS Total_Revenue
FROM retail_sales_clean
group by StockCode, Product_Description
order by Total_Revenue Desc
limit 10;


-- Query 2: Which products sell the most units?

SELECT 
	 StockCode,
    Product_Description,
    SUM(Quantity) AS Units_Sold
FROM retail_sales_clean
GROUP BY StockCode, Product_Description
ORDER BY Units_Sold DESC
LIMIT 10;


-- Query 3: How does revenue change over time?

SELECT
    DATE(InvoiceDate) AS Sales_Date,
    ROUND(SUM(Revenue), 2) AS Daily_Revenue,
    SUM(Quantity) AS Units_Sold
FROM retail_sales_clean
GROUP BY DATE(InvoiceDate)
ORDER BY Sales_Date;


SELECT *
FROM retail_sales_clean;