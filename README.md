# 📦 Zepto Inventory Analysis

This project provides a comprehensive SQL-based analysis of inventory data from Zepto, a retail/e-commerce platform. It includes an Excel dataset and SQL scripts for exploring product categories, pricing, stock levels, and uncovering key business insights.

📂 Project Structure

1. Dataset
   
File: zepto_v1.xlsx

Sheet: Sheet1

Description: Contains inventory details for various products.

Column Name	Description

-> category	Product category (e.g., Fruits & Vegetables, Cooking Essentials)

-> name	Product name

-> mrp	Maximum Retail Price (in paise)

-> discountPercent	Discount offered on the product

-> availableQuantity	Quantity of the product currently in stock

-> discountedSellingPrice	Selling price after discount (in paise)

-> weightInGms	Weight of the product in grams

-> outOfStock	TRUE/FALSE indicating if the product is out of stock

-> quantity	Sale unit quantity

2. SQL Script
   
File: ZEPTO_Inventory.sql

Purpose:

-> Create and structure a relational database

-> Clean and transform raw inventory data

-> Perform analytical queries to answer business-related questions

⚙️ Setup Instructions

1. Database Setup

Use any SQL-compatible DBMS (e.g., MySQL, PostgreSQL)

Run:

sql-> Copy-> Edit

CREATE DATABASE ZEPTO_ANALYSIS;

USE ZEPTO_ANALYSIS;

Import data from zepto_v1.xlsx into a table named ZEPTO

2. Data Cleaning
   
Remove records with mrp = 0

Convert mrp and discountedSellingPrice from paise to rupees

3. Running the SQL Script
   
Execute ZEPTO_Inventory.sql to:

Create necessary tables

Clean and preprocess data

Generate key analytical reports

📊 Business Insights Provided

The SQL script answers a variety of business-focused questions, including:

🔟 Top 10 best-value products (highest discounts)

❌ High-MRP out-of-stock items

💰 Estimated revenue by category

💸 Products with MRP > ₹500 and Discount < 10%

⭐ Top 5 categories by average discount %

⚖️ Price per gram for products ≥ 100g

🏷️ Categorization by weight: Low, Medium, Bulk

🪙 Total inventory weight per category

💡 Usage

Perform ad-hoc queries for inventory management, pricing decisions, and stock optimization.

Identify high-value or underperforming product categories.

Use output as a base for creating dashboards or data visualizations.

🔧 Customization Tips

Modify or extend the SQL queries to answer more complex business questions.

Integrate with Python, Excel, or Power BI to build visual reports.

Schedule data refresh and automation pipelines for real-time insights.

⚠️ Notes

Ensure mrp and discountedSellingPrice are converted to rupees for all final analyses.

Out-of-stock items are still present and can affect revenue and stock planning.

Duplicate product names are flagged in the script for further review.

🚀 Future Enhancements

Add dynamic dashboards using Python, Power BI, or Tableau

Integrate with real-time stock updates or order data

Automate ETL and reporting processes

📁 Files Included
File Name	Description
zepto_v1.xlsx	Raw inventory dataset
ZEPTO_Inventory.sql	SQL script for analysis and data cleaning
