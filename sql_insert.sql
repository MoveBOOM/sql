INSERT INTO genre(name)
	VALUES('Jazz'), ('Rap'), ('Rnb'), ('Pop'), ('Rock');

INSERT INTO executor(name)
	VALUES('Frank Sinatra'),('Louis Armstrong'),
		('Баста'),('Eminem'),('AC/DC'),
		('Linkin Park'),('Justin Timberlake'),
		('Chris Brouwn');

INSERT INTO genre_executor(genre, exec)
	VALUES(11,17), (11,18),
		(12,19), (12,20),
		(13,24), (14,23),
		(15,21), (15,22),
		(13,23), (14,19);

INSERT INTO album(name, date)
	VALUES('My Way',1969), ('What a Wonderful World',1967),
		('Баста 40',2020), ('Music To Be Murdered By - Side B',2020),
		('Back in Black',1980), ('Living Things',2012),
		('Man of the Woods',2018), ('Indigo',2019);

INSERT INTO executor_album(exec, album)
	values(17,9), (18,10), (19,11), (20,12),
		(21,13), (22,14), (23,15), (24,16);

INSERT INTO track(name, duration, album_id)
	values('Watch What Happens', 141, 9), ('My Way', 277, 9),
		('What a Wonderful World', 140, 10), ('Hello Brother', 212, 10),
		('+100500', 348, 11), ('Любовь и страх', 320, 11),
		('Killer', 195, 12), ('No Regrets', 201, 12),
		('Back in Black', 256, 13), ('Rock and Rol Ain"t Noise Pollution', 256, 13),
		('Burn it Down', 230, 14), ('Powerless', 225, 14),
		('Supplies', 226, 15), ('Say Something', 279, 15),
		('No Guidance', 261, 16), ('Dear God', 243, 16),
		('Белый кит', 320, 11), ('Gnat', 225, 12);

INSERT INTO compilation(name, date)
	values('Сборник1', 1970), ('Сборник2', 2014),
		('Сборник3', 2018), ('Сборник4', 2019),
		('Сборник5', 2019), ('Сборник6', 2020),
		('Сборник7', 2020), ('Сборник8', 2020);

INSERT INTO compilation_track(comp, track)
	values(9,37), (9,39), (10,38), (10,40), (11,45), (11,47), (12,46), (12,48),
		(13,49), (13,51), (14,50), (14,52), (15,41), (15,43), (16,42), (16,44);