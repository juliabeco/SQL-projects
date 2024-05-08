
/* FAMOUS PEOPLE PROJECT
Create tables about famous people and what they do here */
USE mydatabase;
SHOW TABLES;

/*CREATE FAMOUS TABLE*/
CREATE TABLE famous (
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(255), 
country VARCHAR(255), 
birthyear INT);

/*INSERT VALUES ON FAMOUS TABLE*/
INSERT INTO famous (name, country, birthyear) VALUES ('JENNY','EEUU', 1999);
INSERT INTO famous (name, country, birthyear) VALUES ('TOM','EEUU', 1995);
INSERT INTO famous (name, country, birthyear) VALUES ('LADY GAGA','EEUU', 1995);
INSERT INTO famous (name, country, birthyear) VALUES  ('MARGOT ROBBIE', 'AUTRALIA', 1988);
INSERT INTO famous (name, country, birthyear) VALUES  ('TAYLOR SWIFT', 'EEUU', 1989);
INSERT INTO famous (name, country, birthyear) VALUES  ('ROBBIE WILLIAMS', 'UK', 1976);
INSERT INTO famous (name, country, birthyear) VALUES  ('LANA DEL REY', 'EEUU', 1985);
INSERT INTO famous (name, country, birthyear) VALUES  ('RUPI KAUR', 'CANADA', 1998);


/*CREATE MOVIES TABLE*/
CREATE TABLE movies (
id INT PRIMARY KEY AUTO_INCREMENT, 
id_famous INTEGER NOT NULL , 
title VARCHAR(255));

/*INSERT VALUES ON MOVIES TABLE*/
INSERT INTO movies (id_famous , title) VALUES (4, 'BARBIE');
INSERT INTO movies (id_famous , title) VALUES (4, 'THE JOCKER');
INSERT INTO movies (id_famous , title) VALUES (3, 'A STAR IS BORN');
INSERT INTO movies (id_famous , title) VALUES (1, 'FOREST GUMP');
INSERT INTO movies (id_famous , title) VALUES (2, 'FOREST GUMP');
INSERT INTO movies (id_famous , title) VALUES (6, 'RW:THE DOCUMENTARY');

/*CREATE SONGS TABLE*/
create table songs (
id INT PRIMARY KEY AUTO_INCREMENT, 
id_famous INTEGER NOT NULL, 
song VARCHAR(255));

/*INSERT VALUES ON SONGS TABLE*/
INSERT INTO songs (id_famous, song)  VALUES (6, 'SHE IS THE ONE');
INSERT INTO songs (id_famous, song)  VALUES (5, 'WILDEST DREAMS');
INSERT INTO songs (id_famous, song)  VALUES (5, 'SHAKE IT OFF');
INSERT INTO songs (id_famous, song)  VALUES (7, 'SUMMERTIME SADNESS');
INSERT INTO songs (id_famous, song)  VALUES (7, 'THE CHEMTRAILS OF...');
INSERT INTO songs (id_famous, song)  VALUES (3, 'ROMANCE');

/*CREATE BOOKS TABLE*/
create table books (
id INT PRIMARY KEY AUTO_INCREMENT,
 id_famous INTEGER NOT NULL,
 title TEXT);
 
 /*INSERT VALUES ON BOOKS TABLE*/
INSERT INTO books (id_famous, title) VALUES (7,'VIOLET BEND BACKWARD OVER THE ...');
INSERT INTO books (id_famous, title) VALUES (8,'WAYS TO USE YOUR MOUTH');


/*DESCRIBIR BASES*/
SELECT * FROM FAMOUS;
SELECT * FROM movies;
SELECT * FROM songs;
SELECT * FROM books;

/*LISTAR DIFERENTES FAMOSOS O SUS PRODUCCIONES USANDO WILDCARDS Y LIKE*/
/*DEVUELVE TODA LA ROW DE LA TABLA famous SI EL NOMBRE CONTIENE EL PATRON "bb" */
SELECT * FROM famous
WHERE name LIKE '%bb%';

/*DEVUELVE TODA LA ROW DE LA TABLA famous SI EL NOMBRE TERMINA CON EL PATRON "ur" */
SELECT * FROM famous
WHERE name LIKE '%ur';

/*DEVUELVE TODA LA ROW DE LA TABLA famous SI EL NOMBRE TIENE 3 CARACTERES, NO SE INDICA CUAL ES EL PRIMERO Y TERMINA CON EL PATRON "om" */
/*NO ES SENSIBLE A LAS MAYUSCULAS*/
SELECT * FROM famous
WHERE name LIKE '_om';

/*DEVUELVE TODA LA ROW DE LA TABLA famous SI EL NOMBRE EMPIEZA CON J */
SELECT * FROM famous
WHERE name LIKE 'J%';

/*DEVUELVE TODA LA ROW DE LA TABLA famous SI EL NOMBRE EMPIEZA CON J K L M*/
SELECT * FROM famous
WHERE (name LIKE 'J%' OR name LIKE 'K%' OR name LIKE 'L%' OR name LIKE 'M%');


/*ACTUALIZAR TABLE DE books*/
UPDATE books
SET title = 'Violets bend Backward over the Grass'
WHERE id_famous = 7;

UPDATE books
SET title = 'Otras formas de usar la boca'
WHERE id_famous = 8;

/*AGREGAR UN ARTISTA A LA TABLA Y LUEGO ELIMINARLO*/
INSERT INTO famous (name, country, birthyear) VALUES  ('WENDY', 'PERU', 2001);

SELECT * FROM FAMOUS;

DELETE FROM  FAMOUS
WHERE name='WENDY' AND id=9;

SELECT * FROM FAMOUS;

/*AGREGAR UNA COLUMNA/VARIABLE NUEVA EN TABLA songs, AGREGAR DATO Y LUEGO ELIMINARLA*/
ALTER TABLE songs
ADD lenght_sec INT;

UPDATE songs
SET lenght_sec = 218
WHERE id = 1;

SELECT * FROM songs;

ALTER TABLE songs
DROP COLUMN lenght_sec;

SELECT * FROM songs;


/*JOINS*/
/*LISTAR SOLAMENTE NOMBRE DE ARTISTA, EL PAIS Y EL TITULO DE LA PELICULA EN LA QUE ACTUA, SI ACTUA EN ALGUNA*/
SELECT famous.name, famous.country, movies.title
       FROM famous
       JOIN movies
       ON famous.id = movies.id_famous;

/*LISTAR SOLAMENTE NOMBRE DE ARTISTA, AÑO DE NACIMIENTO Y TITULO DE CANCION QUE CANTA, SI CANTA ALGUNA*/
SELECT famous.name, famous.birthyear, songs.song
       FROM famous
       JOIN songs
       ON famous.id = songs.id_famous;
       

/*LISTAR TODOS LOS ARTISTAS, CON PAIS, AÑO DE NACIMIENTO Y SI TIENEN LIBRO ESCRITO MOSTRAR TITULO DEL MISMO*/
SELECT famous.name, famous.country, famous.birthyear, books.title
       FROM famous
       LEFT OUTER JOIN books
       ON famous.id = books.id_famous;


/*LISTAR ARTISTA Y PAIS, SOLAMENTE SI TIENE CANCION/ES Y LIBRO PUBLICADO CON SUS CORRESPONDIENTES TITULOS*/
SELECT famous.name, famous.country, songs.song, books.title
       FROM famous
       JOIN songs
       ON famous.id = songs.id_famous
       JOIN books
       ON famous.id = books.id_famous;

/*LISTAR ARTISTA, PAIS, TITULO DE CANCIONES EN MISMA COLUMNA SI TIENE MAS DE UNA Y LO MISMO PARA TITULO DE LIBROS
DEBERIA QUEDAR UNA FILA PARA CADA ARTISTA*/
SELECT famous.name, famous.country,
    (SELECT GROUP_CONCAT(DISTINCT song) FROM songs WHERE songs.id_famous = famous.id) AS songs,
    (SELECT GROUP_CONCAT(DISTINCT title) FROM books WHERE books.id_famous = famous.id) AS titles
FROM famous
HAVING (SELECT COUNT(DISTINCT song) FROM songs WHERE songs.id_famous = famous.id) > 1
    OR (SELECT COUNT(DISTINCT title) FROM books WHERE books.id_famous = famous.id) > 1;


/*LISTAR ARTISTA SI TIENE PELI, CANCION Y LIBRO */
/*NO HAY NADIE EN LA BASE QUE CUMPLA ESTOS 3 REQUISITOS*/
SELECT famous.name, famous.country, movies.title, songs.song, books.title
       FROM famous
       JOIN movies
       ON famous.id = movies.id_famous
       JOIN songs
       ON famous.id = songs.id_famous
       JOIN books
       ON famous.id = books.id_famous;

/*LISTAR TODOS LOS ARTISTAS DE LA PRIMER TABLA FAMOUS Y UNIR LAS OTRAS 3 TABLAS DE PELICULAS, CANCIONES, LIBROS*/
SELECT famous.name, famous.country, movies.title, songs.song, books.title
       FROM famous
       LEFT OUTER JOIN movies
       ON famous.id = movies.id_famous
       LEFT OUTER JOIN songs
       ON famous.id = songs.id_famous
       LEFT OUTER JOIN books
       ON famous.id = books.id_famous;