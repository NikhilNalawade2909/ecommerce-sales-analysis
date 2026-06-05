-- ============================================
-- ECOMMERCE SALES ANALYSIS
-- CART ABANDONMENT ANALYSIS
-- ============================================

SELECT
    fullVisitorId,
    COUNT(*) AS sessions
FROM `data-to-insights.ecommerce.all_sessions`
WHERE productsAddedToCart IS NOT NULL
    AND productsAddedToCart > 0
    AND (transactions IS NULL OR transactions = 0)
GROUP BY fullVisitorId
ORDER BY sessions DESC
LIMIT 50;