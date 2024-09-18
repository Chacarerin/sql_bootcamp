#Crear tabla “editoriales”, con los atributos código y nombre. Definir el código como llave
primaria.

create table editoriales (
    codigo serial primary key,
    nombre varchar(255) not null
);

#Crear tabla “libros”, con los atributos código, título, y codigoeditorial. Definir el código como
llave primaria, y codigoeditorial como llave foránea, referenciando a la tabla editoriales.

create table libros (
    codigo serial primary key,
    titulo varchar(255) not null,
    codigoeditorial int not null,
    foreign key (codigoeditorial) references editoriales (codigo)
);

#llenado de tabla:

insert into editoriales (nombre) 
values 
('anaya'),
('andina'),
('s.m.');

insert into libros (titulo, codigoeditorial) 
values 
('don quijote de la mancha i', 1),
('el principito', 2),
('el príncipe', 3),
('diplomacia', 3),
('don quijote de la mancha ii', 1);

#agregar columnas a libros

alter table libros
add column autor varchar(100),
add column precio int;

#agregar datos

update libros set autor = 'miguel de cervantes', precio = 150 where titulo = 'don quijote de la mancha i';
update libros set autor = 'antoine saintexupery', precio = 120 where titulo = 'el principito';
update libros set autor = 'maquiavelo', precio = 180 where titulo = 'el príncipe';
update libros set autor = 'henry kissinger', precio = 170 where titulo = 'diplomacia';
update libros set autor = 'miguel de cervantes', precio = 140 where titulo = 'don quijote de la mancha ii';

#insertar 2 libros

insert into editoriales (nombre) values ('minotauro');
insert into editoriales (nombre) values ('bantam books');

insert into libros (titulo, autor, codigoeditorial, precio)
values ('el señor de los anillos', 'j.r.r. tolkien', (select codigo from editoriales where nombre = 'minotauro'), 200);

insert into libros (titulo, autor, codigoeditorial, precio)
values ('game of thrones', 'george r.r. martin', (select codigo from editoriales where nombre = 'bantam books'), 250);

#rol lback

begin;

delete from libros
where codigoeditorial = (select codigo from editoriales where nombre = 'anaya');

select * from libros;

rollback;

select * from editoriales;

#savepoin t y rol lback

begin;
savepoint temporal;

update editoriales
set nombre = 'iberlibro'
where nombre = 'andina';

update editoriales
set nombre = 'mountain'
where nombre = 's.m.';

select * from editoriales;

rollback to temporal;

select * from editoriales;




