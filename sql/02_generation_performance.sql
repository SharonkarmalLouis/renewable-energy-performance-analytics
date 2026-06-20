-- Total Energy Generation by Site
SELECT
    site_id,
    ROUND(SUM(energy_mwh), 2) AS total_energy_generated_mwh,
    ROUND(AVG(availability_percent), 2) AS avg_availability
FROM `renewable-energy-analytics.renewable_energy.energy_generation`
GROUP BY site_id
ORDER BY total_energy_generated_mwh DESC;

-- Actual vs Expected Generation Performance
SELECT
    site_id,
    ROUND(SUM(energy_mwh),2) AS actual_generation,
    ROUND(SUM(expected_energy_mwh),2) AS expected_generation,
    ROUND(
        (SUM(energy_mwh) / SUM(expected_energy_mwh)) * 100,
        2
    ) AS performance_percent
FROM `renewable-energy-analytics.renewable_energy.energy_generation`
GROUP BY site_id
ORDER BY performance_percent DESC;

-- Query 3: Asset Performance Ranking
SELECT
    asset_id,
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
GROUP BY asset_id
ORDER BY performance_rank;

-- Query 4: Top 10 Performing Assets
SELECT
    asset_id,
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
GROUP BY asset_id
ORDER BY performance_rank
LIMIT 10;


