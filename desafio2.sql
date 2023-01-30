SELECT COUNT(DISTINCT music_id) AS cancoes, COUNT(DISTINCT artist_id) AS artistas, COUNT(DISTINCT album_id) AS albuns
FROM SpotifyClone.music_table
INNER JOIN SpotifyClone.artist_table
INNER JOIN SpotifyClone.album_table;