-- ============================================
-- ECOMMERCE SALES ANALYSIS
-- REVENUE BY CITY
-- ============================================

-- Top 10 cities by total revenue

SELECT
    city,
    ROUND(SUM(totalTransactionRevenue) / 1000000, 2) AS total_revenue
FROM `data-to-insights.ecommerce.all_sessions`
WHERE totalTransactionRevenue IS NOT NULL
    AND city IS NOT NULL
    AND city != '(not set)'
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 10;