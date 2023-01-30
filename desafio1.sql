DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS SpotifyClone.plan_table(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_column VARCHAR(20) NOT NULL,
  plan_value DOUBLE NOT NULL
);

CREATE TABLE IF NOT EXISTS SpotifyClone.artist_table(
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_column VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS SpotifyClone.user_table(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	user_column VARCHAR(200) NOT NULL,
  user_age INT NOT NULL,
  plan_id INT NOT NULL,
  signature_date DATE NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES plan_table(plan_id)
);

CREATE TABLE IF NOT EXISTS SpotifyClone.following_table(
	user_id INT,
  following_column INT,
  FOREIGN KEY (user_id) REFERENCES user_table(user_id),
  FOREIGN KEY (following_column) REFERENCES artist_table(artist_id),
  PRIMARY KEY (user_id, following_column)
);

CREATE TABLE IF NOT EXISTS SpotifyClone.album_table(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_column VARCHAR(100) NOT NULL,
  artist INT NOT NULL,
  album_date INT NOT NULL,
  FOREIGN KEY (artist) REFERENCES artist_table(artist_id)
);

CREATE TABLE IF NOT EXISTS SpotifyClone.music_table(
	music_id INT PRIMARY KEY AUTO_INCREMENT,
  music_column VARCHAR(200),
  music_album INT NOT NULL,
  music_duration INT NOT NULL,
  FOREIGN KEY (music_album) REFERENCES album_table(album_id)
);

CREATE TABLE IF NOT EXISTS SpotifyClone.history_table(
	user_id INT,
  history_column INT,
  history_date DATETIME NOT NULL,
  FOREIGN KEY (history_column) REFERENCES music_table(music_id),
  FOREIGN KEY (user_id) REFERENCES user_table(user_id),
  PRIMARY KEY (user_id, history_column)
);

INSERT INTO SpotifyClone.plan_table(plan_column, plan_value)
VALUES
  ('gratuito', '0.00'),
  ('familiar', '7.99'),
  ('universitário', '5.99'),
  ('pessoal', '6.99');

INSERT INTO SpotifyClone.artist_table(artist_column)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.user_table(user_column, user_age, plan_id, signature_date)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46, 2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19, 3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander', 85, 4, '2019-06-05'),
  ('Judith Butler', 45, 4, '2020-05-13'),
  ('jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.following_table(user_id, following_column)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO SpotifyClone.album_table(album_column, artist, album_date)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO SpotifyClone.music_table(music_column, music_album, music_duration)
VALUES
  ('BREAK MY SOUL', 1, 279),
  ('VIRGO’S GROOVE', 1, 369),
  ('ALIEN SUPERSTAR', 1, 116),
  ('Don’t Stop Me Now', 1, 203),
  ('Under Pressure', 3, 152),
  ('Como Nossos Pais', 4, 105),
  ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
  ('Samba em Paris', 6, 267),
  ('The Bard’s Song', 7, 244),
  ('Feeling Good', 8, 100);

INSERT INTO SpotifyClone.history_table(user_id, history_column, history_date)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');