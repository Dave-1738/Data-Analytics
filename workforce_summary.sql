-- Import data/workforce.csv into SQLite as workforce.
SELECT department,
       COUNT(*) AS records,
       SUM(CASE WHEN exit_date IS NULL OR exit_date > '2025-12-31' THEN 1 ELSE 0 END) AS active_headcount,
       SUM(CASE WHEN exit_date IS NOT NULL AND exit_date <= '2025-12-31' THEN 1 ELSE 0 END) AS exits_in_sample,
       ROUND(AVG(annual_salary), 2) AS average_salary
FROM workforce
GROUP BY department
ORDER BY active_headcount DESC;
