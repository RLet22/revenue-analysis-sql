/*
Purpose: Provide a high-level summary of key revenue metrics.

Metrics:
- Gross Revenue (completed product sales only)
- Net Revenue (includes returns)
- Total Orders (distinct completed invoices)
- Average Order Value (gross revenue / total orders)
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
), 
net_revenue AS(
    SELECT
        SUM(Quantity * Unitprice) AS net_revenue
    FROM revenue_project
)
    SELECT
        CAST(gross_revenue AS DECIMAL(18,2)) AS gross_revenue_usd,
        CAST(net_revenue AS DECIMAL(18,2)) AS net_revenue_usd,
        total_orders,
        CAST(gross_revenue * 1.0 / NULLIF(total_orders, 0) AS DECIMAL (10,2)) AS average_order_value
    FROM gross_revenue, total_orders, net_revenue;