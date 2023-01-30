SELECT user_column AS 'usuario',
IF (YEAR(MAX(history_date)) >= '2021', 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.history_table
INNER JOIN SpotifyClone.user_table
ON SpotifyClone.user_table.user_id = SpotifyClone.history_table.user_id
GROUP BY user_column
ORDER BY user_column;