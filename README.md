# E-commerce Sales Analysis (October & November 2019)

## Author
Sameeha H  
**Date:** August 2025  

## Project Overview
This project analyzes e-commerce sales data from October and November 2019.  
The goal was to explore customer behavior across different event types such as `view`, `cart`, and `purchase`.

## Datasets
- **sales_oct** – October 2019 sales events  
- **sales_nov** – November 2019 sales events  

## Project Structure
```
Ecommerce_project/
│── data_raw/ # Raw dataset files (October & November 2019)
│── ecommerce/ # SQLite database files
│── ecommerce_sales_analysis.sql # SQL queries used for analysis
│── README.md # Project documentation
```

## Queries Run
- Total rows in dataset  
- Count of events (`view`, `cart`, `purchase`)  
- Top 10 most purchased products  
- Purchases per day  
- Daily views, carts, and purchases  
- Conversion rates (cart rate and purchase rate)  
- Combined October and November monthly stats  

## Key Insights
- Identified daily trends in views, carts, and purchases  
- Found conversion rates from view → cart and cart → purchase  
- Compared October vs November performance  
- Highlighted top-selling products  

## How to Use
1. Open the database in SQLite.  
2. Run the queries in `ecommerce_sales_analysis.sql`.  
3. Compare results across October and November datasets. 

## 🔎 SQL Queries
All queries used for this project are saved in [`ecommerce_sales_analysis.sql`](ecommerce_sales_analysis.sql).
