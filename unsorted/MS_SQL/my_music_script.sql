--database script for db music from uml diagram

CREATE DATABASE music;

GO

USE music;

GO

CREATE SCHEMA production;

GO

CREATE TABLE production.album
(
	album_id INT PRIMARY KEY IDENTITY(1,1),
	album_name VARCHAR(50) NOT NULL,
	album_release DATE NOT NULL,
	album_genre VARCHAR(50) --DEFAULT '' CHECK(album_genre IN ('modern','ancient','')) NOT NULL
);

CREATE TABLE production.song
(
	song_id INT PRIMARY KEY IDENTITY(1,1),
	song_name VARCHAR(50) NOT NULL,
	song_length_sec INT NOT NULL,
	song_album_id INT, --song_album_id INT FOREIGN KEY REFERENCES ()
	FOREIGN KEY (song_album_id) REFERENCES production.album(album_id)
);

CREATE TABLE production.artist
(
	artist_id INT PRIMARY KEY IDENTITY(1,1),
	artist_name VARCHAR(50) NOT NULL
);
CREATE TABLE production.aa
(
	aa_album_id INT NOT NULL, -- don't set identity(1,1) b/c already exists in other tables. this is a reference table 
	aa_artist_id INT NOT NULL,
	--PRIMARY KEY (aa_album_id, aa_artist_id),
	FOREIGN KEY(aa_album_id) REFERENCES production.album(album_id),
	FOREIGN KEY(aa_artist_id) REFERENCES production.artist(artist_id),
	UNIQUE(aa_album_id, aa_artist_id)
);

INSERT INTO production.artist(artist_name) 
	VALUES('hello');
INSERT INTO production.album(album_name, album_genre)
	VALUES('world','modern');
INSERT INTO production.album(album_name, album_genre)
	VALUES('world','modern');

SELECT * FROM production.song;
SELECT * FROM production.album;
SELECT * FROM production.artist;
SELECT * FROM production.aa;