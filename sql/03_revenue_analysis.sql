-- Query 1: Estimated Revenue by Site
SELECT
    eg.site_id,
    ROUND(SUM(eg.energy_mwh), 2) AS total_generation_mwh,
    ROUND(AVG(mp.market_price_per_mwh), 2) AS avg_market_price,
    ROUND(
        SUM(eg.energy_mwh * mp.market_price_per_mwh),
        2
    ) AS estimated_revenue
FROM `renewable-energy-analytics.renewable_energy.energy_generation` eg
JOIN `renewable-energy-analytics.renewable_energy.market_prices` mp
    ON eg.generation_date = mp.price_date
GROUP BY eg.site_id
ORDER BY estimated_revenue DESC;

-- Query 2: Site Revenue Ranking

SELECT
    eg.site_id,
    ROUND(
        SUM(eg.energy_mwh * mp.market_price_per_mwh),
        2
    ) AS estimated_revenue,
    RANK() OVER (
        ORDER BY
            SUM(eg.energy_mwh * mp.market_price_per_mwh) DESC
    ) AS revenue_rank
FROM `renewable-energy-analytics.renewable_energy.energy_generation` eg
JOIN `renewable-energy-analytics.renewable_energy.market_prices` mp
    ON eg.generation_date = mp.price_date
GROUP BY eg.site_id
ORDER BY revenue_rank;
