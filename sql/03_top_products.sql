-- ============================================
-- ECOMMERCE SALES ANALYSIS
-- TOP PRODUCTS ANALYSIS
-- ============================================

-- Top 10 products by revenue

SELECT
    v2ProductName AS product_name,
    ROUND(SUM(productRevenue) / 1000000, 2) AS total_revenue
FROM `data-to-insights.ecommerce.all_sessions`
WHERE productRevenue IS NOT NULL
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;