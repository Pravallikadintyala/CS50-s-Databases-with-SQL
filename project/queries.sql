-- Find all songs by a specific artist using the artist_songs view
-- Replace 'Artist Name' with the desired artist name
SELECT *
FROM artist_songs
WHERE artist_name = 'Artist Name';

-- Find all songs in a specific album
-- Replace 'Album Title' with the desired album title
SELECT *
FROM songs
WHERE album_id = (
    SELECT album_id
    FROM albums
    WHERE title = 'Album Title'
);

-- Find all songs in a specific playlist using the playlist_songs_view
-- Replace 'Playlist Name' with the desired playlist name
SELECT *
FROM playlist_songs_view
WHERE playlist_name = 'Playlist Name';

-- Find all playlists created by a specific user using the user_playlists_view
-- Replace 'Username' with the desired username
SELECT *
FROM user_playlists_view
WHERE username = 'Username';

-- Add a new artist
INSERT INTO artists (name, genre)
VALUES ('New Artist', 'Pop');

-- Add a new album
-- Replace 1 with the artist_id of the associated artist
INSERT INTO albums (title, release_date, artist_id)
VALUES ('New Album', '2024-08-07', 1);

-- Add a new song
-- Replace 1 with the album_id of the associated album
INSERT INTO songs (title, duration, album_id)
VALUES ('New Song', '00:03:45', 1);

-- Create a new playlist
-- Note: Removed user_id as it does not exist in the playlists table
INSERT INTO playlists (name, description)
VALUES ('New Playlist', 'Description here');

-- Add a song to a playlist
-- Replace 1 with the playlist_id and song_id of the associated playlist and song
INSERT INTO playlist_songs (playlist_id, song_id)
VALUES (1, 1);

-- Update an existing song
-- Replace 1 with the song_id of the song to update
UPDATE songs
SET title = 'Updated Song Title'
WHERE song_id = 1;

-- Delete a song from a playlist
-- Replace 1 with the playlist_id and song_id of the associated playlist and song
DELETE FROM playlist_songs
WHERE playlist_id = 1 AND song_id = 1;

-- Delete an entire playlist
-- This will also delete associated entries in the playlist_songs table due to foreign key constraints
DELETE FROM playlists
WHERE playlist_id = 1;
