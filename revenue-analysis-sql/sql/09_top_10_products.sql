/*
Purpose: Identify the top 10 products by gross revenue.
Definition:
- Excludes cancelled invoices
- Excludes negative quantities
- Excludes non-product transaction codes:
  POST, DOT, M
*/

WITH product_revenue AS (
    SELECT
        StockCode,
        SUM(Quantity * UnitPrice) AS product_revenue
    FROM revenue_project
    WHERE InvoiceNo NOT LIKE 'C%' 
        AND Quantity > 0 
        AND StockCode NOT IN ('POST', 'DOT', 'M')
    GROUP BY StockCode
)
    SELECT TOP 10
        StockCode,
        product_revenue
    FROM product_revenue
    ORDER BY product_revenue DESC;