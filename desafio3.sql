SELECT user_column AS usuario, COUNT(music_column) AS qt_de_musicas_ouvidas, ROUND(SUM(music_duration)/60, 2) AS total_minutos
FROM SpotifyClone.user_table
INNER JOIN SpotifyClone.history_table ON SpotifyClone.user_table.user_id = SpotifyClone.history_table.user_id
INNER JOIN SpotifyClone.music_table ON SpotifyClone.music_table.music_id = SpotifyClone.history_table.history_column
GROUP BY user_column
ORDER BY user_column;