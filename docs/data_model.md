# Data Model

This project uses a star-schema style data model designed for analytics and reporting.

## Fact Tables

### energy_generation
Contains daily asset-level energy production records.

Key metrics:
- energy_mwh
- expected_energy_mwh
- availability_percent
- downtime_hours

### maintenance_events
Contains asset-level maintenance history.

Key metrics:
- downtime_hours
- maintenance_cost

## Dimension Tables

### sites
Contains renewable energy site information.

### assets
Contains individual turbine or solar asset information.

### weather_data
Contains daily weather observations by site.

### market_prices
Contains daily electricity market prices by region.

## Relationships

- sites joins to assets using `site_id`
- sites joins to weather_data using `site_id`
- assets joins to energy_generation using `asset_id`
- assets joins to maintenance_events using `asset_id`
- energy_generation joins to market_prices using `generation_date = price_date`
- sites joins to market_prices using `region`
