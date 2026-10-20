
-- Query 1: Monthly Net Revenue
-- Calculate net revenue for each month, including cancellations.

SELECT
    strftime('%Y-%m', InvoiceDate) AS Month,
    SUM(Revenue) AS NetRevenue
FROM transactions
GROUP BY strftime('%Y-%m', InvoiceDate)
ORDER BY Month ASC;


-- Query 2: Month-over-Month Revenue Growth
-- Compare each month's net revenue with the previous month.
-- Note: December 2011 contains only nine days of data.

WITH monthly_revenue AS (
    SELECT
        strftime('%Y-%m', InvoiceDate) AS Month,
        SUM(Revenue) AS NetRevenue
    FROM transactions
    GROUP BY strftime('%Y-%m', InvoiceDate)
),
revenue_with_previous AS (
    SELECT
        Month,
        NetRevenue,
        LAG(NetRevenue) OVER (ORDER BY Month) AS PreviousRevenue
    FROM monthly_revenue
)

SELECT
    Month,
    ROUND(NetRevenue, 2) AS NetRevenue,
    ROUND(PreviousRevenue, 2) AS PreviousRevenue,
    ROUND(
        ((NetRevenue - PreviousRevenue) / NULLIF(PreviousRevenue, 0)) * 100,
        2
    ) AS GrowthPct
FROM revenue_with_previous
ORDER BY Month ASC;
