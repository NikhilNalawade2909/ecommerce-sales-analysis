-- ============================================
-- ECOMMERCE SALES ANALYSIS
-- DATA EXPLORATION
-- ============================================

-- View sample records

SELECT *
FROM `data-to-insights.ecommerce.all_sessions`
LIMIT 10;


-- Check total number of rows

SELECT COUNT(*) AS total_records
FROM `data-to-insights.ecommerce.all_sessions`;


-- View all available columns

SELECT *
FROM `data-to-insights.ecommerce.all_sessions`
LIMIT 1;


-- Count distinct visitors

SELECT COUNT(DISTINCT fullVisitorId) AS unique_visitors
FROM `data-to-insights.ecommerce.all_sessions`;


-- Count distinct products

SELECT COUNT(DISTINCT v2ProductName) AS unique_products
FROM `data-to-insights.ecommerce.all_sessions`;


-- Check available traffic channels

SELECT DISTINCT channelGrouping
FROM `data-to-insights.ecommerce.all_sessions`
ORDER BY channelGrouping;


-- Check available countries

SELECT DISTINCT country
FROM `data-to-insights.ecommerce.all_sessions`
ORDER BY country;


-- Find date range of dataset

SELECT
    MIN(PARSE_DATE('%Y%m%d', date)) AS start_date,
    MAX(PARSE_DATE('%Y%m%d', date)) AS end_date
FROM `data-to-insights.ecommerce.all_sessions`;


-- Check missing revenue values

SELECT
    COUNT(*) AS total_rows,
    COUNT(totalTransactionRevenue) AS rows_with_revenue
FROM `data-to-insights.ecommerce.all_sessions`;