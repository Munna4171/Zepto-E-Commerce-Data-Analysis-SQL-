# 🛒 Zepto Quick-Commerce Inventory Engine & Operational Analytics

[![Database](https://img.shields.io/badge/Database-PostgreSQL%2015+-blue.svg)](https://www.postgresql.org/)
[![Client Interface](https://img.shields.io/badge/Client-pgAdmin%204-orange.svg)](https://www.pgadmin.org/)
[![Framework](https://img.shields.io/badge/Domain-Supply_Chain_&_Logistics_Fulfillment-success.svg)]()

## 📌 Project Overview & Operational Impact
An end-to-end relational database design, data sanitization, and complex business intelligence query pipeline built on **3,700+ commercial quick-commerce SKU records** scraped from Zepto. The project simulates a production-grade analytics workflow—turning raw, improperly formatted e-commerce scraped inputs into structured, actionable schemas engineered to optimize warehouse storage, product visibility, pricing strategies, and fleet payload limits.

### 🚀 Key Technical Metrics Achieved:
* **3,732 Inventory Records** successfully mapped, structured, and pushed into a PostgreSQL instance.
* **100% Arithmetic Precision Retention:** Cleaned structural price calculation irregularities across the entire product catalog without rounding decay or data truncation errors.
* **Proactive Stock Risk Coverage:** Designed immediate warning query metrics to track critical supply dependencies before catalog items face out-of-stock anomalies.
* **Logistics Optimization Blueprint:** Engineered aggregate compound mathematical vectors (`Revenue per Kilogram`) to provide operations teams with vehicle space profitability scores.

---

## 🛠️ Tech Stack & Architecture
* **Database Core Engine:** PostgreSQL (DDL Table Constraints, System Schemas, Relational Indexing Models)
* **Query Optimization Engine:** SQL (Complex Aggregations, Group Filters via `HAVING`, Advanced Data Transformations using `CASE WHEN` branches)
* **Client Interface:** pgAdmin 4 (Bulk File Ingestion Profiles, System Transaction Verification)

---

## 🏗️ Core Engineering Pipeline & Implementation Details

### 1. Robust Schema Design & Data Sanitization (DDL / DML)
* **Resilient Table Architecture:** Programmed safe-drop conditions followed by strict data type assignment schemas, utilizing auto-generating sequences (`SERIAL`) to guarantee relational identifier uniqueness.
```sql
DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR,
    name VARCHAR NOT NULL,
    mrp NUMERIC,
    discount_percent NUMERIC,
    available_quantity INTEGER,
    discounted_selling_price NUMERIC,
    weight_in_gms INTEGER,
    out_of_stock BOOLEAN,
    quantity INTEGER
);
