/*
Purpose: Calculate gross revenue per product.
Definition:
- Excludes cancelled invoices
- Excludes negative quantities
- Excludes non-product transaction codes:
  POST, DOT, M
*/

SELECT
    StockCode,
    CAST(SUM(Quantity * UnitPrice) AS DECIMAL(18,2)) AS product_revenue
FROM revenue_project
WHERE InvoiceNo NOT LIKE 'C%'
  AND Quantity > 0
  AND StockCode NOT IN ('POST', 'DOT', 'M')
GROUP BY StockCode
ORDER BY product_revenue DESC, StockCode;