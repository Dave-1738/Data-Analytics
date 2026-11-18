-- Import data/inventory_monthly.csv into SQLite as inventory_monthly.
SELECT sku,
       SUM(units_sold) AS annual_units,
       ROUND(SUM(units_sold * unit_cost), 2) AS annual_demand_value,
       MAX(month) AS latest_month
FROM inventory_monthly
GROUP BY sku
ORDER BY annual_demand_value DESC;
