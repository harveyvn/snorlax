SET timezone = 'Europe/Zurich';

DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS covers;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS event_locations;
DROP TABLE IF EXISTS event_covers;
DROP TABLE IF EXISTS event_artists;
DROP TABLE IF EXISTS event_songs;

CREATE TABLE IF NOT EXISTS locations (
	id serial PRIMARY KEY,
	name VARCHAR (255) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS covers (
	id serial PRIMARY KEY,
	url VARCHAR (500) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS songs (
	id serial PRIMARY KEY,
	title VARCHAR (250) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS artists (
	id serial PRIMARY KEY,
	name VARCHAR (250) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS events (
	id serial PRIMARY KEY,
	title VARCHAR (250) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS event_locations (
	event_id INTEGER REFERENCES events (id) ON UPDATE CASCADE ON DELETE CASCADE,
	location_id INTEGER REFERENCES locations (id) ON UPDATE CASCADE,
	date TIMESTAMPTZ,
	CONSTRAINT event_locations_pkey PRIMARY KEY (event_id, location_id)
);
CREATE TABLE IF NOT EXISTS event_covers (
	event_id INTEGER REFERENCES events (id) ON UPDATE CASCADE ON DELETE CASCADE,
	cover_id INTEGER REFERENCES covers (id) ON UPDATE CASCADE,
	CONSTRAINT event_covers_pkey PRIMARY KEY (event_id, cover_id)
);
CREATE TABLE IF NOT EXISTS event_artists (
	event_id INTEGER REFERENCES events (id) ON UPDATE CASCADE ON DELETE CASCADE,
	artist_id INTEGER REFERENCES artists (id) ON UPDATE CASCADE,
	CONSTRAINT event_artists_pkey PRIMARY KEY (event_id, artist_id)
);
CREATE TABLE IF NOT EXISTS event_songs (
	event_id INTEGER REFERENCES events (id) ON UPDATE CASCADE ON DELETE CASCADE,
	song_id INTEGER REFERENCES songs (id) ON UPDATE CASCADE,
	CONSTRAINT event_songs_pkey PRIMARY KEY (event_id, song_id)
);