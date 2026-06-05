-- ============================================
-- ECOMMERCE SALES ANALYSIS
-- TRAFFIC CHANNEL ANALYSIS
-- ============================================

SELECT
    channelGrouping,
    COUNT(*) AS sessions,
    SUM(CASE
            WHEN transactions >= 1 THEN 1
            ELSE 0
        END) AS conversions,
    ROUND(
        100 * SUM(CASE
                      WHEN transactions >= 1 THEN 1
                      ELSE 0
                  END) / COUNT(*),
        2
    ) AS conversion_rate
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY channelGrouping
ORDER BY conversion_rate DESC;