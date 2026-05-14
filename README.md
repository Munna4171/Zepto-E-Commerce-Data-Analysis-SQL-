🛒 Zepto E-Commerce Data Analysis (SQL)

📌 Project Overview

This project involves a comprehensive end-to-end SQL analysis of real-world e-commerce data from Zepto, a leading quick-commerce platform. The goal was to mimic the workflow of a Data Analyst: starting from raw data ingestion and cleaning to extracting actionable business insights that drive decisions in inventory, marketing, and logistics.

📊 Dataset Description

The dataset contains 3,700+ unique SKUs across various categories (Beverages, Dairy, Fruits & Vegetables, etc.).

Columns: Category, Product Name, MRP, Discount Percentage, Available Quantity, Selling Price, Weight, and Stock Status.

Source: Scraped product listings from Zepto's official platform.

🛠️ Tools & Tech Stack

Database: PostgreSQL (pgAdmin 4)

Language: SQL (DDL, DML, DQL)

Key Concepts: Data Cleaning, Aggregations, Conditional Logic (CASE), Multi-level Sorting, and Mathematical Modeling.

🚀 Project Workflow

1. Data Setup & Integrity (DDL)
Designed a structured table schema with appropriate data types (NUMERIC, INTEGER, BOOLEAN).

Implemented primary keys to ensure data uniqueness.

2. Data Cleaning & Transformation
Invalid Data Removal: Identified and deleted rows with impossible values (e.g., MRP = 0).

Unit Conversion: Transformed price data from paise to rupees using arithmetic updates to ensure standard reporting formats.

Null Value Auditing: Conducted a comprehensive check across all columns to ensure 100% data completeness.

3. Exploratory Data Analysis (EDA)
Analyzed inventory distribution (In-stock vs. Out-of-stock).

Identified product variations and SKU counts per product name.

💡 Key Business Insights

The project answers critical business questions, including:

Revenue Estimation: Calculated the total valuation of inventory currently held in the warehouse.

Logistics Optimization: Identified "Weight-Heavy but Revenue-Light" categories to optimize delivery fleet planning.

Discount Strategy: Discovered that certain categories (like Fruits & Vegetables) carry significantly higher average discounts than premium staples.

Risk Management: Generated "Emergency Restock" lists for items with dangerously low quantities (1-3 units).

Opportunity Cost: Calculated the potential revenue lost due to high-value items being out of stock.
