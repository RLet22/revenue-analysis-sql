/*
Purpose: Identify the top 10 customers by gross revenue using ROW_NUMBER().
Definition:
- Excludes cancelled invoices
- Excludes negative quantities
- Excludes NULL CustomerID values
*/

WITH customer_revenue AS (
    SELECT
        CustomerID,
        SUM(Quantity * UnitPrice) AS customer_revenue
    FROM revenue_project
    WHERE InvoiceNo NOT LIKE 'C%'
      AND Quantity > 0
      AND CustomerID IS NOT NULL
    GROUP BY CustomerID
),
ranked_customers AS (
    SELECT
        CustomerID,
        customer_revenue,
        ROW_NUMBER() OVER (
            ORDER BY customer_revenue DESC, CustomerID
        ) AS rn
    FROM customer_revenue
)
SELECT
    CustomerID,
    customer_revenue,
    rn
FROM ranked_customers
WHERE rn <= 10
ORDER BY rn;