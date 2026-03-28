/*
Purpose: Calculate gross revenue from completed product sales.
Definition:
- Excludes cancelled invoices "C"
- Excludes negative quantities
*/

SELECT
	SUM(Quantity*UnitPrice) as gross_revenue
	FROM revenue_project
	WHERE InvoiceNo NOT LIKE 'C%' AND Quantity > 0;
