
-- Query 1: Top 10 Customers by Revenue
-- Identify the highest-spending customers and their order frequency.
-- Only positive-quantity transactions are included.

SELECT
    CustomerID,
    ROUND(SUM(Revenue), 2) AS TotalRevenue,
    COUNT(DISTINCT InvoiceNo) AS OrderCount
FROM transactions
WHERE Quantity > 0
GROUP BY CustomerID
ORDER BY TotalRevenue DESC
LIMIT 10;


-- Query 2: Customer Revenue and Order Summary
-- Combine customer information with positive-sales order metrics.
-- LEFT JOIN preserves customers without positive-quantity orders.

WITH customers AS (
    SELECT
        CustomerID,
        MIN(Country) AS Country
    FROM transactions
    GROUP BY CustomerID
),
customer_orders AS (
    SELECT
        CustomerID,
        SUM(Revenue) AS TotalRevenue,
        COUNT(DISTINCT InvoiceNo) AS OrderCount
    FROM transactions
    WHERE Quantity > 0
    GROUP BY CustomerID
)

SELECT
    c.CustomerID,
    c.Country,
    ROUND(co.TotalRevenue, 2) AS TotalRevenue,
    co.OrderCount
FROM customers AS c
LEFT JOIN customer_orders AS co
    ON c.CustomerID = co.CustomerID
ORDER BY co.TotalRevenue DESC
LIMIT 10;
