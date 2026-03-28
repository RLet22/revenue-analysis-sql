/*
Purpose: Calculate average order value (AOV).
Definition:
- AOV = gross revenue / total completed orders
- Gross revenue excludes cancelled invoices and negative quantities
*/

WITH gross_revenue AS(
    SELECT
        SUM(Quantity * Unitprice) AS gross_revenue
    FROM revenue_project
    WHERE InvoiceNo NOT LIKE 'C%' 
        AND Quantity > 0
), 
total_orders AS(
    SELECT
        COUNT(DISTINCT InvoiceNo) AS total_orders
    FROM revenue_project
    WHERE InvoiceNo NOT LIKE 'C%'
)
    SELECT
    CAST(gross_revenue * 1.0 / NULLIF(total_orders, 0) AS DECIMAL (10,2)) AS average_order_value
    FROM gross_revenue, total_orders;

