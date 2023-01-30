SELECT artist_column as artista, album_column as album 
FROM SpotifyClone.artist_table
INNER JOIN SpotifyClone.album_table
ON SpotifyClone.artist_table.artist_id = SpotifyClone.album_table.artist
WHERE artist_column = 'Elis Regina'
ORDER BY artist_column;