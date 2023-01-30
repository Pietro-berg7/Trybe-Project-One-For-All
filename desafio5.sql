SELECT music_column AS cancao, COUNT(music_id) AS reproducoes
FROM  SpotifyClone.history_table
INNER JOIN SpotifyClone.music_table ON SpotifyClone.music_table.music_id = SpotifyClone.history_table.history_column
GROUP BY music_column
ORDER BY reproducoes DESC, music_column LIMIT 2;