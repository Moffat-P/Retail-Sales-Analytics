
## Dashboard Preview

![Retail Sales Performance Dashboard](screenshots/dashboard.png.png)


# Retail Sales Performance Analysis

## Project Overview

This project analyses a sample of retail transaction data to understand sales performance, identify high-revenue products, and visualise sales activity.

The analysis was completed using MySQL for data cleaning and querying, and Power BI for dashboard development.

## Tools Used

- MySQL and MySQL Workbench
- Power BI Desktop
- DAX
- CSV

## Dataset

**Source:** UCI Machine Learning Repository — Online Retail Dataset

https://archive.ics.uci.edu/dataset/352/online+retail

A sample of approximately 2,004 transaction records was imported for this project rather than the complete dataset.

## Data Preparation

The dataset was inspected for missing values, cancelled transactions, invalid quantities, and duplicate records.

A cleaned table was created by excluding cancellations and non-positive quantities or prices. Date and price fields were converted into suitable data types, and a revenue column was calculated.

The original imported data was preserved separately.

## SQL Analysis

SQL queries were used to investigate:

- Top products by revenue
- Top products by quantity sold
- Revenue by date

## Power BI Dashboard

The dashboard presents:

- Total revenue
- Total units sold
- Total number of orders
- Top 10 products by revenue
- Revenue over time

## Limitations

This analysis uses a small sample of the original dataset. Results should not be interpreted as representing the retailer's complete sales performance or long-term trends.

## Skills Demonstrated

SQL querying, data cleaning, data transformation, aggregation, DAX measures, dashboard development, and business intelligence reporting.
