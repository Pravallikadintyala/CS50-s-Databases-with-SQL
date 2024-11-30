-- Represent artists in the database
CREATE TABLE "artists" (
    "artist_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "genre" TEXT
);

-- Represent albums in the database
CREATE TABLE "albums" (
    "album_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "release_date" TEXT,
    "artist_id" INTEGER,
    FOREIGN KEY("artist_id") REFERENCES "artists"("artist_id")
);

-- Represent songs in the database
CREATE TABLE "songs" (
    "song_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "duration" TEXT,
    "album_id" INTEGER,
    FOREIGN KEY("album_id") REFERENCES "albums"("album_id")
);

-- Represent playlists in the database
CREATE TABLE "playlists" (
    "playlist_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT
);

-- Represent the many-to-many relationship between songs and playlists
CREATE TABLE "playlist_songs" (
    "playlist_id" INTEGER,
    "song_id" INTEGER,
    PRIMARY KEY("playlist_id", "song_id"),
    FOREIGN KEY("playlist_id") REFERENCES "playlists"("playlist_id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("song_id")
);

-- Represent users in the database
CREATE TABLE "users" (
    "user_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE
);

-- Represent the many-to-many relationship between users and playlists
CREATE TABLE "user_playlists" (
    "user_id" INTEGER,
    "playlist_id" INTEGER,
    PRIMARY KEY("user_id", "playlist_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("user_id"),
    FOREIGN KEY("playlist_id") REFERENCES "playlists"("playlist_id")
);

-- Indexes for improving query performance
CREATE INDEX idx_artist_name ON artists(name);
CREATE INDEX idx_album_title ON albums(title);
CREATE INDEX idx_song_title ON songs(title);
CREATE INDEX idx_playlist_name ON playlists(name);
CREATE INDEX idx_user_username ON users(username);

-- Views for simplified data retrieval

-- View to find all songs by a specific artist
CREATE VIEW artist_songs AS
SELECT songs.song_id, songs.title, songs.duration, albums.title AS album_title, artists.name AS artist_name
FROM songs
JOIN albums ON songs.album_id = albums.album_id
JOIN artists ON albums.artist_id = artists.artist_id;

-- View to list all songs in a specific playlist
CREATE VIEW playlist_songs_view AS
SELECT playlists.name AS playlist_name, songs.title AS song_title, songs.duration
FROM playlists
JOIN playlist_songs ON playlists.playlist_id = playlist_songs.playlist_id
JOIN songs ON playlist_songs.song_id = songs.song_id;

-- View to list all playlists created by a specific user
CREATE VIEW user_playlists_view AS
SELECT users.username, playlists.name AS playlist_name, playlists.description
FROM users
JOIN user_playlists ON users.user_id = user_playlists.user_id
JOIN playlists ON user_playlists.playlist_id = playlists.playlist_id;
