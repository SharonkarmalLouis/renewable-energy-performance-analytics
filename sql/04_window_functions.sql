-- Site Performance Ranking
SELECT
    site_id,
    ROUND(SUM(energy_mwh),2) AS actual_generation,
    ROUND(SUM(expected_energy_mwh),2) AS expected_generation,
    ROUND(
        (SUM(energy_mwh) / SUM(expected_energy_mwh)) * 100,
        2
    ) AS performance_percent,
    RANK() OVER (
        ORDER BY
            (SUM(energy_mwh) / SUM(expected_energy_mwh)) DESC
    ) AS performance_rank
FROM `renewable-energy-analytics.renewable_energy.energy_generation`
GROUP BY site_id
ORDER BY performance_rank;
