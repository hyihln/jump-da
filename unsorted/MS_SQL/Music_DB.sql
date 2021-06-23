CREATE DATABASE Music;
GO

USE DATABASE Music;
GO

CREATE SCHEMA m;
GO

-- CREATE TABLES

CREATE TABLE m.artist
(
    id INT PRIMARY KEY IDENITITY(1,1),
    name VARCHAR(255) NOT NULL,
);

CREATE TABLE m.album
(
    id INT PRIMARY KEY IDENITITY(1,1),
    name VARCHAR(255) NOT NULL,
    released DATE NOT NULL,
    genre VARCHAR(255)
);

CREATE TABLE m.album_artist 
(
    artist_id INT,
    album_id INT,
    PRIMARY KEY(artist_id, album_id),
    FOREIGN KEY(artist_id) REFERENCES artist(id),
    FOREIGN KEY(album_id) REFERENCES album(id)
);


CREATE TABLE m.song
(
    id INT PRIMARY KEY IDENITITY(1,1)
    name VARCHAR(255) NOT NULL,
    length INT,
    album_id INT,
    FOREIGN KEY(album_id) REFERENCES album(id)
);


-- INSERT DATA

INSERT INTO artist(name) VALUES('artist1');

INSERT INTO album(name, released, genre) VALUES('album1', '2020-10-17', 'Pop Rock');

INSERT INTO album_artist(artist_id, album_id) VALUES(1,1);

INSERT INTO song(name, length, ablum_id) VALUES('song1', 189, 1);
INSERT INTO song(name, length, ablum_id) VALUES('song2', 212, 1);

