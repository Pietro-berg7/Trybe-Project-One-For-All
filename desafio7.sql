SELECT artist_column AS artista, album_column AS album, COUNT(user_id) AS seguidores
FROM SpotifyClone.artist_table
INNER JOIN SpotifyClone.album_table ON SpotifyClone.album_table.artist = SpotifyClone.artist_table.artist_id
INNER JOIN SpotifyClone.following_table ON SpotifyClone.following_table.following_column = SpotifyClone.artist_table.artist_id
GROUP BY artist_column, album_column
ORDER BY seguidores DESC, artist_column, album_column;