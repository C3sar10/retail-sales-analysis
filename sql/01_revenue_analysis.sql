-- Revenue Analysis
-- Calculate gross revenue, cancellations, and net revenue
-- for transactions associated with identified customers.

SELECT
    SUM(CASE WHEN Quantity > 0 THEN Revenue ELSE 0 END) AS GrossRevenue,
    SUM(CASE WHEN Quantity < 0 THEN Revenue ELSE 0 END) AS CancellationRevenue,
    SUM(Revenue) AS NetRevenue
FROM transactions;