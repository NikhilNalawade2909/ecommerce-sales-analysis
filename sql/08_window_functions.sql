-- ============================================
-- ECOMMERCE SALES ANALYSIS
-- TOP PRODUCT IN EACH COUNTRY
-- USING CTE + WINDOW FUNCTION
-- ============================================

WITH product_sales AS (
    SELECT
        country,
        v2ProductName,
        ROUND(SUM(productRevenue) / 1000000, 2) AS revenue
    FROM `data-to-insights.ecommerce.all_sessions`
    WHERE productRevenue IS NOT NULL
    GROUP BY country, v2ProductName
),

ranked_products AS (
    SELECT
        country,
        v2ProductName,
        revenue,
        RANK() OVER (
            PARTITION BY country
            ORDER BY revenue DESC
        ) AS product_rank
    FROM product_sales
)

SELECT
    country,
    v2ProductName,
    revenue
FROM ranked_products
WHERE product_rank = 1
ORDER BY revenue DESC;