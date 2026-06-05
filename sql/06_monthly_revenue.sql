-- ============================================
-- ECOMMERCE SALES ANALYSIS
-- MONTHLY REVENUE TREND
-- ============================================

SELECT
    FORMAT_DATE(
        '%Y-%m',
        PARSE_DATE('%Y%m%d', date)
    ) AS month,
    
    ROUND(
        SUM(totalTransactionRevenue) / 1000000,
        2
    ) AS revenue

FROM `data-to-insights.ecommerce.all_sessions`

WHERE totalTransactionRevenue IS NOT NULL

GROUP BY month

ORDER BY month;