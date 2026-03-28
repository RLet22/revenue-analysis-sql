/*
Purpose: Calculate monthly gross revenue from sellable products only.
Definition:
- Excludes cancelled invoices
- Excludes negative quantities
- Excludes non-product transaction codes:
  POST, DOT, M
- Month bucket is the first day of each month
*/

WITH monthly_product_revenue AS(
	SELECT
		DATEFROMPARTS(YEAR(invoiceDate), MONTH(InvoiceDate), 1) AS revenue_month,
		SUM(Quantity * UnitPrice) AS revenue
	FROM revenue_project
	WHERE InvoiceNo NOT LIKE 'C%' 
		AND Quantity > 0
	GROUP BY DATEFROMPARTS(YEAR(invoiceDate), MONTH(InvoiceDate), 1)
)
	SELECT
		revenue_month,
		CAST(revenue AS DECIMAL(18,2)) as revenue
	FROM monthly_product_revenue
	ORDER BY revenue_month;