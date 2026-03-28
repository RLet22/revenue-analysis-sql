# revenue-analysis-sql
SQL-based analysis of retail transaction data focusing on revenue, customers, and product performance.

# Revenue Analysis (SQL Project)

## Objective

The goal of this project is to analyze retail transaction data to understand revenue performance, customer behavior, and product trends.

This analysis focuses on:

* Revenue generation and order volume
* Customer spending patterns
* Top-performing products
* Monthly revenue trends

---

## Dataset

The dataset used is the **Online Retail dataset**, which contains transactional sales data.

### Table: `revenue_project`

**Key columns:**

* `InvoiceNo` — order identifier (cancellations prefixed with 'C')
* `StockCode` — product identifier
* `Description` — product name
* `Quantity` — number of units purchased (negative values indicate returns)
* `InvoiceDate` — transaction timestamp
* `UnitPrice` — price per unit
* `CustomerID` — customer identifier
* `Country` — customer location

### Data Grain

Each row represents a **single product within an invoice** (line-item level).

---

## Data Cleaning & Assumptions

To ensure accurate and meaningful analysis, the following rules were applied:

* **Excluded cancelled orders**
  `InvoiceNo NOT LIKE 'C%'`

* **Excluded returns for gross revenue calculations**
  `Quantity > 0`

* **Removed non-product transaction codes**
  Excluded: `POST`, `DOT`, `M`
  These represent shipping, discounts, or manual adjustments rather than actual products.

* **Excluded NULL CustomerID values for customer-level analysis**
  Ensures analysis reflects identifiable customers only.

---

## Key Metrics

* **Total Orders**
  Count of distinct completed invoices

* **Gross Revenue**
  Sum of `Quantity * UnitPrice` for completed, positive transactions

* **Net Revenue**
  Includes all transactions (returns included)

* **Average Order Value (AOV)**
  Gross Revenue / Total Orders

* **Customer Revenue**
  Total spend per customer

* **Product Revenue**
  Total revenue per product (excluding non-product codes)

* **Monthly Revenue**
  Revenue aggregated by month

---

## Analysis & Queries

All analysis was performed using SQL Server (T-SQL).

Key queries are organized in the `/sql` folder:

* `00_summary_metrics.sql` — overall revenue summary
* `01_total_orders.sql` — total completed orders
* `02_gross_revenue.sql` — gross revenue calculation
* `03_net_revenue.sql` — net revenue calculation
* `04_average_order_value.sql` — average order value
* `05_customer_revenue.sql` — revenue per customer
* `06_top_10_customers_top.sql` — top customers (TOP method)
* `07_top_10_customers_row_number.sql` — top customers (ROW_NUMBER)
* `08_product_revenue.sql` — revenue per product
* `09_top_10_products.sql` — top products
* `10_monthly_product_revenue.sql` — monthly revenue trends

---

## Key Findings

* Revenue is concentrated among a relatively small number of customers.
* A limited number of products drive a large portion of total sales.
* Monthly revenue shows variability, suggesting potential seasonality or demand fluctuations.
* Data cleaning decisions (e.g., removing non-product codes and handling returns) significantly impact analytical results.

---

## Tools Used

* SQL Server (T-SQL)
* SQL Server Management Studio (SSMS)

---

## Project Structure

```
revenue-analysis-sql/
│
├── README.md
└── sql/
    ├── 00_summary_metrics.sql
    ├── 01_total_orders.sql
    ├── 02_gross_revenue.sql
    ├── 03_net_revenue.sql
    ├── 04_average_order_value.sql
    ├── 05_customer_revenue.sql
    ├── 06_top_10_customers_top.sql
    ├── 07_top_10_customers_row_number.sql
    ├── 08_product_revenue.sql
    ├── 09_top_10_products.sql
    └── 10_monthly_product_revenue.sql
```

---

## Summary

This project demonstrates the ability to:

* Clean and validate transactional data
* Define business-relevant metrics
* Perform structured SQL analysis
* Translate raw data into meaningful insights

