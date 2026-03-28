/*
Purpose: Calculate net revenue.
Definition:
- Includes all rows, including returns and cancellations
- CAST for readability
*/

SELECT
    CAST(SUM(Quantity * UnitPrice) AS DECIMAL(18,2)) AS net_revenue
FROM revenue_project;