# 🚴 AdventureWorks Power BI Dashboard

[![Power BI](https://img.shields.io/badge/Built%20with-Power%20BI-yellow?logo=powerbi&logoColor=white)](https://powerbi.microsoft.com/)
[![AdventureWorks](https://img.shields.io/badge/Data-AdventureWorks-blue?logo=microsoftsqlserver)](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure)

> **A comprehensive interactive sales dashboard based on the Microsoft AdventureWorks sample database.**

---

## 📦 About the Database

**AdventureWorks** is a sample relational database provided by Microsoft. It simulates the business processes of a fictional company that manufactures and sells bicycles and cycling-related products. The dataset includes:

- Product catalog (with categories and models)
- Customer and order information
- Regional and store-level sales data
- Shipping methods and performance
- Pricing, costs, and discount data
- Employee and departmental structure

➡️ [Learn more about AdventureWorks](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure)

---

## 📈 Report Overview

This Power BI report consists of **three pages**, each offering a different angle on sales performance and business insights:

---

### 1. 🧾 Sales Overview

> High-level metrics and trends across the business

- Total orders, revenue, profit, and margin
- Average order value (AOV), product lines per order
- Sales trends over time (monthly breakdown)
- Subcategory performance: Road Bikes, Jerseys, Wheels, etc.
- Filters by region, store, and store type
- Profitability by product model

![screen1](screenshots/1.png)

---

### 2. 🚴 Products Overview

> Focused analysis on products and product lines

- Revenue by product line: Road, Mountain, Touring, Standard
- 266 unique products and 35 subcategories analyzed
- Revenue by product style: Universal, Women’s, Men’s
- Model-level revenue breakdown (e.g., Mountain-200, Road-250)
- Profitability, costs, AOV, and quantity sold per subcategory
- Filterable by region, store, model, and more

![screen2](screenshots/2.png)

---

### 3. 💸 Discounts Overview

> Discount impact analysis across products and regions

- Number and percentage of discounted orders
- Total discount amount by type and product
- Discount categories: seasonal, volume, excess inventory, discontinued, etc.
- Discounted quantity by product and region
- Profit margin comparison for discounted vs. full-price products
- Top discounted models and subcategories

![screen3](screenshots/3.png)

---

## 🛠 Technologies Used

- [Power BI Desktop](https://powerbi.microsoft.com/)
- [Microsoft SQL Server](https://www.microsoft.com/en-us/sql-server/)
- [AdventureWorks DW 2022](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure)
- DAX / M / SQL (data modeling and transformation)

---

## 📁 Repository Structure

/AdventureWorks-Dashboard/<br>
│<br>
├── AdventureWorks Dashboard.pbix   # Power BI Report file<br>
├── README.md                       # Project documentation<br>
└── /data/                          # (Optional) Scripts or raw data extracts<br>

---

## ✅ Requirements

- Power BI Desktop (latest version)
- AdventureWorks DW database (2014+)
- Optional: SQL Server (for direct database queries)

---




