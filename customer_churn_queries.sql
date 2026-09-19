-- Customer Churn Analysis
-- SQL Analysis using DuckDB


-- 1. Overall customer and churn summary

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers;


-- 2. Churn by Contract Type

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY Contract
ORDER BY churn_rate_percentage DESC;


-- 3. Churn by Internet Service

SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY InternetService
ORDER BY churn_rate_percentage DESC;


-- 4. Churn by Payment Method

SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_percentage DESC;


-- 5. Churn by Customer Tenure

SELECT
    CASE
        WHEN tenure <= 12 THEN 'New'
        WHEN tenure <= 24 THEN 'Growing'
        WHEN tenure <= 48 THEN 'Established'
        ELSE 'Loyal'
    END AS customer_segment,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY customer_segment
ORDER BY churn_rate_percentage DESC;


-- 6. Churn by Monthly Charge Range

SELECT
    CASE
        WHEN MonthlyCharges <= 30 THEN '$0-30'
        WHEN MonthlyCharges <= 60 THEN '$31-60'
        WHEN MonthlyCharges <= 90 THEN '$61-90'
        ELSE '$91-120'
    END AS monthly_charge_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY monthly_charge_group
ORDER BY churn_rate_percentage DESC;


-- 7. Churn by Tech Support

SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY TechSupport
ORDER BY churn_rate_percentage DESC;


-- 8. Churn by Online Security

SELECT
    OnlineSecurity,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY OnlineSecurity
ORDER BY churn_rate_percentage DESC;