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

#Datos para las tablas:

-- Inserción de datos en la tabla empresa
insert into empresa (rut, nombre, direccion, telefono, correo, web) values
('223456789', 'ferretería central', 'calle 1, santiago', '555123456', 'contacto@ferreteria.com', 'www.ferreteria.com'),
('234567890', 'maquinarias del norte', 'av. libertador 200, antofagasta', '555987654', 'ventas@maquinariasnorte.com', 'www.maquinariasnorte.com'),
('345678901', 'herramientas y más', 'calle falsa 123, concepción', '555456789', 'info@herramientasymas.com', 'www.herramientasymas.com'),
('456789012', 'equipos industriales s.a.', 'av. las condes 333, santiago', '555654987', 'ventas@equiposindustriales.com', 'www.equiposindustriales.com'),
('567890123', 'constructoras unidas', 'calle colón 456, valparaíso', '555321654', 'ventas@constructorasunidas.com', 'www.constructorasunidas.com'),
('678901234', 'ferremax ltda.', 'av. vicuña mackenna 789, la serena', '555789456', 'ventas@ferremax.com', 'www.ferremax.com'),
('789012346', 'proyectos y construcción', 'calle rivadavia 987, arica', '555456123', 'ventas@pyc.com', 'www.pyc.com'),
('890123457', 'obras y equipos', 'av. providencia 101, santiago', '555654321', 'info@obrasyequipos.com', 'www.obrasyequipos.com'),
('901234568', 'multiherramientas', 'calle tucumán 303, punta arenas', '555987321', 'ventas@multiherramientas.com', 'www.multiherramientas.com'),
('012345679', 'materiales del sur', 'av. italia 707, temuco', '555321987', 'ventas@materialesdelsur.com', 'www.materialesdelsur.com');

-- Inserción de datos en la tabla cliente
insert into cliente (rut, nombre, correo, direccion, celular) values
('111111111', 'juan pérez', 'juanperez@example.com', 'av. libertador 101, santiago', '999111111'),
('222222222', 'maría gonzález', 'mariagonzalez@example.com', 'calle 2, santiago', '999222222'),
('333333333', 'luis martínez', 'luismartinez@example.com', 'calle 3, valparaíso', '999333333'),
('444444444', 'ana rodríguez', 'anarodriguez@example.com', 'av. la marina 404, viña del mar', '999444444'),
('555555555', 'carlos lópez', 'carloslopez@example.com', 'calle principal 505, concepción', '999555555'),
('666666666', 'laura fernández', 'laurafernandez@example.com', 'calle 6, antofagasta', '999666666'),
('777777777', 'miguel torres', 'migueltorres@example.com', 'av. santa maría 707, iquique', '999777777'),
('888888888', 'sofía morales', 'sofiamorales@example.com', 'calle central 808, la serena', '999888888'),
('999999999', 'jorge gómez', 'jorgegomez@example.com', 'av. kennedy 909, santiago', '999999999'),
('000000000', 'silvia torres', 'silviatorres@example.com', 'calle 10, punta arenas', '999000000');

-- Inserción de datos en la tabla herramienta
insert into herramienta (idherramienta, nombre, preciodia) values
(11, 'taladro', 5000),
(12, 'martillo neumático', 15000),
(13, 'sierra circular', 8000),
(14, 'compresor', 10000),
(15, 'generador eléctrico', 20000),
(16, 'lijadora', 7000),
(17, 'cortadora de césped', 9000),
(18, 'soldadora', 12000),
(19, 'pulidora', 6000),
(20, 'escalera telescópica', 4000);

-- Inserción de datos en la tabla arriendo
insert into arriendo (folio, fecha, dias, valordia, garantia, herramienta_idherramienta, cliente_rut) values
(101, '2024-01-15', 3, 5000, 'sin daños', 11, '111111111'),
(102, '2024-02-20', 5, 15000, 'con daños', 12, '222222222'),
(103, '2024-03-25', 2, 8000, 'sin daños', 13, '333333333'),
(104, '2024-04-10', 4, 10000, 'sin daños', 14, '444444444'),
(105, '2024-05-05', 7, 20000, 'sin daños', 15, '555555555'),
(106, '2024-06-12', 3, 7000, 'sin daños', 16, '666666666'),
(107, '2024-07-18', 2, 9000, 'con daños', 17, '777777777'),
(108, '2024-08-25', 5, 12000, 'sin daños', 18, '888888888'),
(109, '2024-09-01', 1, 6000, 'sin daños', 19, '999999999'),
(110, '2024-10-10', 6, 4000, 'con daños', 20, '000000000');

#1

select a.folio, a.fecha, a.dias, a.valordia, c.nombre as nombrecliente, c.rut as rutcliente
from arriendo a
join cliente c on a.cliente_rut = c.rut;

#2

select c.rut, c.nombre
from cliente c
left join arriendo a on c.rut = a.cliente_rut
where a.cliente_rut is null;

#3

select rut, nombre
from cliente
union
select rut, nombre
from empresa;

#4

select extract(month from a.fecha) as mes, count(*) as cantidad_arriendos
from arriendo a
group by mes
order by mes;