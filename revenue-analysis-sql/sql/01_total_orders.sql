/*
Purpose: Calculate total completed orders.
Definition:
- An order is a distinct InvoiceNo
- Excludes cancelled invoices "C"
*/

SELECT
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM revenue_project
WHERE InvoiceNo NOT LIKE 'C%';