/*
Purpose: Calculate gross revenue per identified customer.
Definition:
- Excludes cancelled invoices
- Excludes negative quantities
- Excludes NULL CustomerID values
*/

SELECT
    CustomerID,
    CAST(SUM(Quantity * UnitPrice) AS DECIMAL(18,2)) AS customer_revenue
FROM revenue_project
WHERE InvoiceNo NOT LIKE 'C%'
  AND Quantity > 0
  AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY customer_revenue DESC, CustomerID;