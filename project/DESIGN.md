# Design Document

By DINTYALA NAGA VENKATA PRAVALLIKA

Video overview: <https://youtu.be/p-xVUsMNBvE>

## Scope
This database is designed to facilitate the process of storing, managing, and retrieving song information. As such, included in the database's scope is:

* Artists, including their names and genres
* Albums, including their titles, release dates, and associated artists
* Songs, including their titles, durations, and associated albums
* Playlists, including their names and associated users
* Users, including their usernames
* Playlist-Song relationships, including the songs that are part of each playlist
* Song queries, including the ability to retrieve songs by artist, album, playlist, or user

Out of scope are elements like:

* Audio files: The database does not store the actual audio files of the songs, only their metadata.
* Song ratings or reviews: The database does not include user ratings or reviews of songs.
* Artist biographies or discographies: The database only stores basic information about artists, such as their names and genres.
* Playlist descriptions or images: The database only stores the names of playlists and their associated users, not additional descriptive information or images.

## Functional Requirements

This database will support:

* CRUD operations for lyrics, artists, and albums
* Associating lyrics with artists and albums
* Searching and filtering lyrics
* Tracking lyric versions and updates
* User authentication and authorization
Note: This iteration does not include user-generated content, rating/reviewing lyrics, or advanced analytics
## Representation
Entities are captured in SQLite tables with the following schema.

### Entities


Artists:
The Artists entity represents a musician or band that has created music.

* "artist_id" (INTEGER, PRIMARY KEY, AUTOINCREMENT): A unique identification number assigned to each artist.
* "name" (TEXT, NOT NULL): The artist's name.
* "genre" (TEXT): The artist's genre of music.

Albums:
The Albums entity represents a collection of songs released by an artist.

* "album_id" (INTEGER, PRIMARY KEY, AUTOINCREMENT): A unique identification number assigned to each album.
* "title" (TEXT, NOT NULL): The album's title.
* "release_date" (TEXT): The album's release date.
* "artist_id" (INTEGER, FOREIGN KEY): The ID of the artist who released the album.

Songs:
The Songs entity represents a single track of music.

* "song_id" (INTEGER, PRIMARY KEY, AUTOINCREMENT): A unique identification number assigned to each song.
* "title" (TEXT, NOT NULL): The song's title.
* "duration" (TEXT): The song's duration.
* "album_id" (INTEGER, FOREIGN KEY): The ID of the album that the song belongs to.

Playlists:
The Playlists entity represents a curated list of songs.

* "playlist_id" (INTEGER, PRIMARY KEY, AUTOINCREMENT): A unique identification number assigned to each playlist.
* "name" (TEXT, NOT NULL): The playlist's name.
* "description" (TEXT): The playlist's description.

Playlist-Songs:
The Playlist-Songs entity represents the many-to-many relationship between playlists and songs.

* "playlist_id" (INTEGER, PRIMARY KEY, FOREIGN KEY): The ID of the playlist.
* "song_id" (INTEGER, PRIMARY KEY, FOREIGN KEY): The ID of the song.

Users:
The Users entity represents an individual who uses the music platform.

* "user_id" (INTEGER, PRIMARY KEY, AUTOINCREMENT): A unique identification number assigned to each user.
* "username" (TEXT, NOT NULL): The user's username.
* "email" (TEXT, NOT NULL, UNIQUE): The user's email address.

User-Playlists:
The User-Playlists entity represents the many-to-many relationship between users and playlists.

* "user_id" (INTEGER, PRIMARY KEY, FOREIGN KEY): The ID of the user.
* "playlist_id'" (INTEGER, PRIMARY KEY, FOREIGN KEY): The ID of the playlist.


### Relationships

The below entity relationship diagram describes the relationships among the entities in the database

![ER Diagram](diagram.png)
As detailed by the diagram:

The Lyric Library Database is designed to efficiently manage and organize music-related data, including information about artists, albums, songs, playlists, and users. The relationships between these entities are structured to support complex queries and ensure that users can easily access and manage their music preferences. Below is a detailed description of how the entities and their relationships are represented in the database:

* Artists and Albums:
An artist can produce 0 to many albums. The database allows for the possibility that an artist has not yet released any albums or that they have multiple albums in their discography.
Each album is associated with exactly one artist, ensuring that every album in the database is clearly linked to the musician or band that created it.

* Albums and Songs:
An album can contain 0 to many songs. This setup allows for the flexibility of having albums that may not yet have any songs recorded or that contain multiple tracks.
A song is linked to exactly one album, ensuring that each track is part of a specific collection of music.

* Playlists and Songs:
A playlist can include 0 to many songs. This means a playlist can be empty, with no songs added, or it can feature multiple tracks that the user has curated.
Each song can be part of 0 to many playlists. This enables the same song to appear in multiple playlists, reflecting different users' preferences or themes.

* Users and Playlists:
A user can create 0 to many playlists. This relationship allows users to have no playlists (if they haven't created any) or to curate multiple playlists as they explore different music.
Each playlist is associated with exactly one user, ensuring that every playlist has a clear owner.

* Users and Playlists (User-Playlists Relationship):
The relationship between users and playlists is managed by the user_playlists table, which supports the many-to-many association. This table ensures that users can be linked to multiple playlists, and a playlist can have multiple contributors if desired.



## Optimizations

The Lyric Library database has been optimized to enhance performance and ensure efficient data retrieval. The following optimizations were applied:

* Indexes:
Primary Keys: Each table in the database has a primary key defined, which automatically creates an index. For example:
artist_id in the artists table.
album_id in the albums table.
song_id in the songs table.
playlist_id in the playlists table.
user_id in the users table.
playlist_id and song_id in the playlist_songs table (composite key).
user_id and playlist_id in the user_playlists table (composite key).
These indexes ensure that lookups based on primary keys are efficient, which is particularly important for JOIN operations, such as when retrieving songs by a specific artist or finding all playlists created by a user

* Foreign Key Constraints:
Foreign Keys: Foreign key constraints were applied to maintain referential integrity between tables. For instance:
The artist_id in the albums table references artist_id in the artists table.
The album_id in the songs table references album_id in the albums table.
The playlist_id and song_id in the playlist_songs table reference playlist_id in the playlists table and song_id in the songs table, respectively.
The user_id and playlist_id in the user_playlists table reference user_id in the users table and playlist_id in the playlists table, respectively.
These constraints not only ensure data integrity but also optimize JOIN operations, as the database engine can leverage these constraints to optimize query execution.

* Efficient Queries:
The provided SQL queries have been designed to minimize redundant data retrieval and optimize the use of indexes:
Subqueries: The use of subqueries in commands such as finding all songs by a specific artist or all songs in a specific album allows the database to narrow down the result set before performing more complex operations.
JOINs: Efficient use of JOINs in queries, such as finding all songs in a specific playlist, ensures that the database retrieves only the necessary data by linking tables based on indexed foreign keys.
Data Insertion: The data insertion queries ensure that new data is efficiently added to the database, with primary keys and foreign keys properly managed to maintain performance during subsequent queries.

* Normalization:
The database design follows normalization principles, ensuring that data redundancy is minimized and that each piece of information is stored only once. This reduces the amount of storage required and improves the performance of data retrieval operations

* Views:
Views are created to simplify data retrieval and provide a more intuitive interface for querying the database. The artist_songs, playlist_songs_view, and user_playlists_view views provide a convenient way to retrieve specific data without having to write complex queries.


## Limitations
The database design has the following limitations:

* No information on user preferences: The database does not store information about which songs or albums users like.
* No information on playlist creation date: The database does not store information about when a playlist was created.
* No information on song genre: The database does not store information about the genre of a song, making it difficult to search for specific types of
  music.
* No information on album artist: The database does not store information about the artist who created an album.
* No information on user roles: The database does not store information about user roles or permissions.
* No information on user listening history: The database does not store information about which songs or albums users have listened to.
* No information on song popularity: The database does not store information about song popularity or how many times songs have been listened to.
* No support for collaborations: The database does not support the ability for users to collaborate on playlists.
* No support for private playlists: The database does not support the ability for users to create private playlists
