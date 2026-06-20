# Data Dictionary

## sites

| Column | Description |
|----------|-------------|
| site_id | Unique site identifier |
| site_name | Renewable energy site name |
| region | Operating region |
| country | Country location |
| technology | Wind or Solar |
| installed_capacity_mw | Total installed capacity |
| commissioning_date | Site commissioning date |

## assets

| Column | Description |
|----------|-------------|
| asset_id | Unique asset identifier |
| site_id | Related site |
| asset_name | Asset name |
| asset_type | Turbine or Solar Panel Group |
| capacity_mw | Asset capacity |
| manufacturer | Equipment manufacturer |
| status | Operational status |
