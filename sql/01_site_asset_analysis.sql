-- Site and Asset Summary
SELECT
    s.site_name,
    s.technology,
    COUNT(a.asset_id) AS total_assets,
    ROUND(SUM(a.capacity_mw),2) AS total_capacity_mw
FROM `renewable-energy-analytics.renewable_energy.Sites` s
LEFT JOIN `renewable-energy-analytics.renewable_energy.assets` a
    ON s.site_id = a.site_id
GROUP BY
    s.site_name,
    s.technology
ORDER BY total_capacity_mw DESC;
