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
    WHERE name ~* '\mмой\M' OR name ~* '\mmy\M';

SELECT g.name, count(ge.exec) FROM genre g
   JOIN genre_executor ge ON g.genre_id = ge.genre
   GROUP BY g.name;

SELECT COUNT(*) AS track_count FROM track t
    JOIN album ON t.album_id = album.album_id
    WHERE album.date BETWEEN 2019 AND 2020;

SELECT a.name, AVG(t.duration) FROM album a
	JOIN track t ON a.album_id = t.album_id
	GROUP BY a.name;

SELECT DISTINCT name FROM executor
WHERE name NOT IN (
	SELECT executor.name FROM executor
	JOIN executor_album ON executor.exec_id = executor_album.album
	JOIN album ON album.album_id = executor_album.album
	WHERE date == 2020);

SELECT c.name FROM compilation c
   JOIN compilation_track ct ON c.comp_id = ct.comp
   JOIN track t ON t.track_id = ct.track
   JOIN album a ON a.album_id = t.album_id
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
	JOIN track t ON t.album_id = a.album_id
	WHERE duration = (SELECT MIN(duration) FROM track);

SELECT a.name , count(t.track_id) FROM album a
    JOIN track t ON a.album_id = t.album_id
    GROUP BY a.name
    HAVING count(t.track_id) in (
    	SELECT count(t.track_id) FROM album a
    	JOIN track t ON a.album_id = t.album_id
        GROUP BY a.name
        ORDER BY count(t.track_id)
        LIMIT 1);