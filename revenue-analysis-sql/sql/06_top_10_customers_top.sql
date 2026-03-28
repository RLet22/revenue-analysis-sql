/*
Purpose: Identify the top 10 customers by gross revenue using TOP.
Definition:
- Excludes cancelled invoices
- Excludes negative quantities
- Excludes NULL CustomerID values
*/

SELECT TOP 10
    CustomerID,
    SUM(Quantity * UnitPrice) AS customer_revenue
FROM revenue_project
WHERE InvoiceNo NOT LIKE 'C%'
  AND Quantity > 0
  AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY customer_revenue DESC, CustomerID;