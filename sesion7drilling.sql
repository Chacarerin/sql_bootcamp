create table empresa (
    rut varchar(10) primary key,
    nombre varchar(120),
    direccion varchar(120),
    telefono varchar(15),
    correo varchar(80),
    web varchar(50)
);

create table cliente (
    rut varchar(10) primary key,
    nombre varchar(120),
    correo varchar(80),
    direccion varchar(120),
    celular varchar(15)
);

create table herramienta (
    idherramienta integer primary key,
    nombre varchar(120),
    preciodia integer
);

create table arriendo (
    folio integer primary key,
    fecha date,
    dias integer,
    valordia integer,
    garantia varchar(30),
    herramienta_idherramienta integer,
    cliente_rut varchar(10),
    constraint arriendo_herramienta_fk foreign key (herramienta_idherramienta) references herramienta (idherramienta),
    constraint arriendo_cliente_fk foreign key (cliente_rut) references cliente (rut)
);

begin;

#insertar datos:

-- Insertar datos en la tabla empresa
insert into empresa (rut, nombre, direccion, telefono, correo, web) values
('111111111', 'empresa a', 'calle a 123', '555123456', 'contacto@empresaa.com', 'www.empresaa.com'),
('222222222', 'empresa b', 'calle b 456', '555987654', 'ventas@empresab.com', 'www.empresab.com'),
('333333333', 'empresa c', 'calle c 789', '555654321', 'info@empresac.com', 'www.empresac.com'),
('444444444', 'empresa d', 'calle d 101', '555321654', 'ventas@empresad.com', 'www.empresad.com'),
('555555555', 'empresa e', 'calle e 202', '555456789', 'contacto@empresae.com', 'www.empresae.com');

-- Insertar datos en la tabla cliente
insert into cliente (rut, nombre, correo, direccion, celular) values
('111111111', 'juan pérez', 'juanperez@example.com', 'calle 1', '987654321'),
('222222222', 'maría gonzález', 'mariagonzalez@example.com', 'calle 2', '987654322'),
('333333333', 'luis martínez', 'luismartinez@example.com', 'calle 3', '987654323'),
('444444444', 'ana rodríguez', 'anarodriguez@example.com', 'calle 4', '987654324'),
('555555555', 'carlos lópez', 'carloslopez@example.com', 'calle 5', '987654325');

-- Insertar datos en la tabla herramienta
insert into herramienta (idherramienta, nombre, preciodia) values
(1, 'taladro', 15000),
(2, 'martillo', 8000),
(3, 'destornillador', 5000),
(4, 'sierra eléctrica', 20000),
(5, 'compresor', 25000);

-- Insertar datos en la tabla arriendo
insert into arriendo (folio, fecha, dias, valordia, garantia, herramienta_idherramienta, cliente_rut) values
(1, '2024-01-15', 5, 15000, 's/n', 1, '333333333'),
(2, '2024-02-10', 3, 8000, 's/n', 2, '222222222'),
(3, '2024-03-05', 2, 5000, 's/n', 3, '333333333'),
(4, '2024-04-20', 7, 20000, 's/n', 4, '444444444'),
(5, '2024-05-18', 4, 25000, 's/n', 5, '555555555');

#1

select nombre, rut
from cliente
where rut not in (select cliente_rut from arriendo);

#2

select a.folio, a.fecha, a.dias, a.valordia, c.nombre as nombrecliente, c.rut as rutcliente
from arriendo a
join cliente c on a.cliente_rut = c.rut;

#3

select c.nombre as nombrecliente, c.rut as rutcliente, count(a.folio) as cantidad_arriendos,
       case
           when count(a.folio) between 0 and 1 then 'bajo'
           when count(a.folio) between 2 and 3 then 'medio'
           when count(a.folio) >= 3 then 'alto'
       end as clasificacion
from cliente c
left join arriendo a on c.rut = a.cliente_rut
group by c.nombre, c.rut;

#4

select c.nombre as nombrecliente, c.rut as rutcliente, h.nombre as herramientamasarrendada
from cliente c
join arriendo a on c.rut = a.cliente_rut
join herramienta h on a.herramienta_idherramienta = h.idherramienta
where a.herramienta_idherramienta = (
    select herramienta_idherramienta
    from arriendo
    group by herramienta_idherramienta
    order by count(*) desc
    limit 1
);

commit;
