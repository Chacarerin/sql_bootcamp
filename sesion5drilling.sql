#listar actores de titanic

select p.pelicula, p.estreno, p.director, r.actor
from peliculas p
join reparto r on p.id = r.id_pelicula
where p.pelicula = 'Titanic';

#Listar los 10 directores más populares, indicando su nombre y cuántas películas aparecen
en el top 100.

select p.director, count(*) as cantidad_peliculas
from peliculas p
group by p.director
order by cantidad_peliculas desc
limit 10;

#Indicar cuántos actores distintos hay.

select count(distinct r.actor) as cantidad_actores_distintos
from reparto r;

#Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos), ordenadas
por título de manera ascendente.

select p.pelicula, p.estreno
from peliculas p
where p.estreno between 1990 and 1999
order by p.pelicula asc;

#Listar los actores de la película más nueva.

select r.actor
from reparto r
join peliculas p on r.id_pelicula = p.id
where p.estreno = (select max(estreno) from peliculas);

#Inserte los datos de una nueva película solo en memoria, y otra película en el disco duro.

select max(id) from peliculas; #resp:100

select setval(pg_get_serial_sequence('peliculas', 'id'), (select max(id) from peliculas) + 1);

begin;
insert into peliculas (pelicula, estreno, director) 
values ('Alien Romulus', 2024, 'Federico Alvarez');

select * from peliculas where pelicula = 'Alien Romulus';

rollback;

begin;
insert into peliculas (pelicula, estreno, director) 
values ('Interstellar', 2014, 'Christopher Nolan');

commit;

select * from peliculas where pelicula = 'Interstellar';

#Actualice 5 directores utilizando ROLLBACK.

begin;

update peliculas
set director = 'Christopher Nolan'
where director = 'Quentin Tarantino';

update peliculas
set director = 'Martin Scorsese'
where director = 'Steven Spielberg';

update peliculas
set director = 'David Fincher'
where director = 'James Cameron';

update peliculas
set director = 'Ridley Scott'
where director = 'Peter Jackson';

update peliculas
set director = 'Stanley Kubrick'
where director = 'Francis Ford Coppola';

select * from peliculas;

rollback;

select * from peliculas;

#Inserte 3 actores a la película “Rambo” utilizando SAVEPOINT

begin;

savepoint insertar_actores;

insert into reparto (id_pelicula, actor)
values ((select id from peliculas where pelicula = 'Rambo'), 'Sylvester Stallone');
insert into reparto (id_pelicula, actor)
values ((select id from peliculas where pelicula = 'Rambo'), 'Richard Crenna');
insert into reparto (id_pelicula, actor)
values ((select id from peliculas where pelicula = 'Rambo'), 'Brian Dennehy');

select * from reparto where id_pelicula = (select id from peliculas where pelicula = 'Rambo');

rollback to insertar_actores;

select * from reparto where id_pelicula = (select id from peliculas where pelicula = 'Rambo');

commit;

#15. Elimina las películas estrenadas el año 2008 solo en memoria.

begin;

delete from reparto
where id_pelicula in (select id from peliculas where estreno = 2008);

delete from peliculas
where estreno = 2008;

select * from peliculas where estreno = 2008;

select * from reparto where id_pelicula in (select id from peliculas where estreno = 2008);

rollback;

#Inserte 2 actores para cada película estrenada el 2001.

begin;

insert into reparto (id_pelicula, actor)
values ((select id from peliculas where pelicula = 'El Señor de los Anillos: La Comunidad del Anillo'), 'Elijah Wood');

insert into reparto (id_pelicula, actor)
values ((select id from peliculas where pelicula = 'El Señor de los Anillos: La Comunidad del Anillo'), 'Ian McKellen');

insert into reparto (id_pelicula, actor)
values ((select id from peliculas where pelicula = 'Harry Potter y la Piedra Filosofal'), 'Daniel Radcliffe');

insert into reparto (id_pelicula, actor)
values ((select id from peliculas where pelicula = 'Harry Potter y la Piedra Filosofal'), 'Emma Watson');

commit;

#Actualice la película “King Kong” por el nombre de “Donkey Kong”, sin efectuar cambios en
disco duro.

begin;

update peliculas
set pelicula = 'Donkey Kong'
where pelicula = 'King Kong';

select * from peliculas where pelicula = 'Donkey Kong';

rollback;

select * from peliculas where pelicula = 'King Kong';
