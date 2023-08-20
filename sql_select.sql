SELECT name, date FROM album
	WHERE date = 2018;

SELECT name, duration FROM track
	ORDER BY duration DESC
	LIMIT 1;

SELECT name FROM track
	WHERE duration >= 210;

SELECT name FROM compilation
	WHERE date BETWEEN 2018 and 2020;

SELECT name FROM executor
	WHERE name NOT LIKE '% %';

SELECT name FROM track
	WHERE name LIKE '%мой%' OR name LIKE '%my%';

SELECT g.name, count(ge.exec) FROM genre g
   JOIN genre_executor ge ON g.genre_id = ge.genre
   GROUP BY g.name;

SELECT a.name, a.date, count(t.id) FROM album a
   JOIN track t ON a.album_id = t.album
   WHERE a.date BETWEEN 2019 and 2020
   GROUP BY a.name, a.date;

SELECT a.name, AVG(t.duration) FROM album a
	JOIN track t ON a.album_id = t.album
	GROUP BY a.name;

SELECT e.name FROM executor e
   JOIN executor_album ea ON e.exec_id = ea.exec
   JOIN album a ON a.album_id = ea.album
   WHERE a.date < 2020;

SELECT c.name FROM compilation c
   JOIN compilation_track ct ON c.comp_id = ct.comp
   JOIN track t ON t.track_id = ct.track
   JOIN album a ON a.album_id = t.album
   JOIN executor_album ea ON a.album_id = ea.album
   JOIN executor e ON e.exec_id = ea.exec
   WHERE e.name LIKE '%Баста%';

SELECT a.name FROM album a
	JOIN executor_album ea ON a.album_id = ea.album
	JOIN executor e ON e.exec_id = ea.exec
	JOIN genre_executor ge ON ge.exec = e.exec_id
	JOIN genre g ON g.genre_id = ge.genre
	GROUP BY e.name, a.name
    HAVING count(ge.genre) > 1;

SELECT t.name FROM track t
	LEFT JOIN  compilation_track ct ON t.track_id = ct.track
	WHERE ct.track IS null;

SELECT e.name FROM executor e
	JOIN executor_album ea ON e.exec_id = ea.exec
	JOIN album a ON a.album_id = ea.album
	JOIN track t ON t.album = a.album_id
	WHERE duration = (SELECT MIN(duration) FROM track);

SELECT a.name , count(t.track_id) FROM album a
    JOIN track t ON a.album_id = t.album
    GROUP BY a.name
    HAVING count(t.track_id) in (
    	SELECT count(t.track_id) FROM album a
    	JOIN track t ON a.album_id = t.album
        GROUP BY a.name
        ORDER BY count(t.track_id)
        LIMIT 1);