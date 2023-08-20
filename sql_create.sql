create table if not exists genre (
	genre_id serial primary key,
	name varchar(100) not null unique
);
create table if not exists executor (
	exec_id serial primary key,
	name varchar(100) not null
);
create table if not exists genre_executor (
    genre integer references genre(genre_id),
    exec integer references executor(exec_id),
    constraint genre_executor_pk primary key (genre, exec)
);
create table if not exists album (
	album_id serial primary key,
	name varchar(100) not null,
	date integer not null
);
create table if not exists executor_album (
    exec integer references executor(exec_id),
    album integer references album(album_id),
    constraint executor_album_pk primary key (exec, album)
);
create table if not exists track (
	track_id serial primary key,
	name varchar(100) not null unique,
	duration integer not null,
	album_id integer references album(album_id)
);
create table if not exists compilation (
    comp_id serial primary key,
    name varchar(100) not null unique,
    date integer not null
);
create table if not exists compilation_track (
    comp integer references compilation(comp_id),
    track integer references track(track_id),
    constraint compilation_track_pk primary key (comp, track)
);