SELECT
  FORMAT(MIN(plan_value), 2) AS faturamento_minimo,
  FORMAT(MAX(plan_value), 2) AS faturamento_maximo,
  FORMAT(AVG(plan_value), 2) AS faturamento_medio,
  FORMAT(SUM(plan_value), 2) AS faturamento_total
FROM SpotifyClone.plan_table
INNER JOIN SpotifyClone.user_table
ON SpotifyClone.plan_table.plan_id = SpotifyClone.user_table.plan_id;