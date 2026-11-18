-- Import data/sales.csv into SQLite as sales.
WITH line_metrics AS (
    SELECT *, units_sold * unit_price AS revenue,
              units_sold * unit_cost AS cogs
    FROM sales
)
SELECT category,
       SUM(revenue) AS revenue,
       SUM(revenue - cogs) AS gross_profit,
       ROUND(1.0 * SUM(revenue - cogs) / NULLIF(SUM(revenue), 0), 4) AS gross_margin
FROM line_metrics
GROUP BY category
ORDER BY gross_profit DESC;
