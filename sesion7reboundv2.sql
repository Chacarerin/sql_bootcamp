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
    celular varchar(15),
    alta char(1),
    constraint cliente_fk_empresa foreign key (rut) references empresa (rut)
);

create table tipovehiculo (
    idtipovehiculo integer primary key,
    nombre varchar(120)
);

create table marca (
    idmarca integer primary key,
    nombre varchar(120)
);

create table vehiculo (
    idvehiculo integer primary key,
    patente varchar(10),
    marca varchar(20),
    modelo varchar(20),
    color varchar(15),
    precio integer,
    frecuenciamantencion integer,
    marca_idmarca integer,
    tipovehiculo_idtipovehiculo integer,
    constraint vehiculo_tipovehiculo_fk foreign key (tipovehiculo_idtipovehiculo) references tipovehiculo (idtipovehiculo),
    constraint vehiculo_marca_fk foreign key (marca_idmarca) references marca (idmarca)
);

create table venta (
    folio integer primary key,
    fecha date,
    monto integer,
    vehiculo_idvehiculo integer,
    cliente_rut varchar(10),
    constraint venta_cliente_fk foreign key (cliente_rut) references cliente (rut),
    constraint venta_vehiculo_fk foreign key (vehiculo_idvehiculo) references vehiculo (idvehiculo)
);

create table mantencion (
    idmantencion integer primary key,
    fecha date,
    trabajosrealizados varchar(1000),
    venta_folio integer,
    constraint mantencion_venta_fk foreign key (venta_folio) references venta (folio)
);

#Datos para las tablas:

begin;
-- Inserción de datos en la tabla empresa
insert into empresa (rut, nombre, direccion, telefono, correo, web) values
('111111111', 'empresa juan pérez', 'calle 1, santiago', '555123456', 'contacto@empresa.com', 'www.empresa.com'),
('222222222', 'empresa maría gonzález', 'calle 2, concepción', '555987654', 'ventas@empresa.com', 'www.empresa.com'),
('333333333', 'empresa luis martínez', 'calle 3, valparaíso', '555456789', 'info@empresa.com', 'www.empresa.com'),
('444444444', 'empresa ana rodríguez', 'calle 4, viña del mar', '555654987', 'ventas@empresa.com', 'www.empresa.com'),
('555555555', 'empresa carlos lópez', 'calle 5, concepción', '555321654', 'ventas@empresa.com', 'www.empresa.com'),
('666666666', 'empresa laura fernández', 'calle 6, antofagasta', '555789456', 'ventas@empresa.com', 'www.empresa.com'),
('777777777', 'empresa miguel torres', 'calle 7, iquique', '555456123', 'ventas@empresa.com', 'www.empresa.com'),
('888888888', 'empresa sofía morales', 'calle 8, la serena', '555654321', 'info@empresa.com', 'www.empresa.com'),
('999999999', 'empresa jorge gómez', 'calle 9, santiago', '555987321', 'ventas@empresa.com', 'www.empresa.com'),
('000000000', 'empresa silvia torres', 'calle 10, punta arenas', '555321987', 'ventas@empresa.com', 'www.empresa.com');

-- Inserción de datos en la tabla cliente
insert into cliente (rut, nombre, correo, direccion, celular, alta) values
('111111111', 'juan pérez', 'juanperez@example.com', 'av. libertad 101, santiago', '999111111', 'S'),
('222222222', 'maría gonzález', 'mariagonzalez@example.com', 'calle principal 102, concepción', '999222222', 'S'),
('333333333', 'luis martínez', 'luismartinez@example.com', 'calle 3, valparaíso', '999333333', 'S'),
('444444444', 'ana rodríguez', 'anarodriguez@example.com', 'calle la marina 404, viña del mar', '999444444', 'S'),
('555555555', 'carlos lópez', 'carloslopez@example.com', 'calle principal 505, concepción', '999555555', 'S'),
('666666666', 'laura fernández', 'laurafernandez@example.com', 'calle 6, antofagasta', '999666666', 'S'),
('777777777', 'miguel torres', 'migueltorres@example.com', 'calle 7, iquique', '999777777', 'S'),
('888888888', 'sofía morales', 'sofiamorales@example.com', 'calle central 808, la serena', '999888888', 'S'),
('999999999', 'jorge gómez', 'jorgegomez@example.com', 'av. kennedy 909, santiago', '999999999', 'S'),
('000000000', 'silvia torres', 'silviatorres@example.com', 'calle 10, punta arenas', '999000000', 'S');

-- Inserción de datos en la tabla tipovehiculo
insert into tipovehiculo (idtipovehiculo, nombre) values
(1, 'automóvil'),
(2, 'camioneta'),
(3, 'moto'),
(4, 'bicicleta'),
(5, 'suv'),
(6, 'camión'),
(7, 'bus'),
(8, 'tractor'),
(9, 'cuatriciclo'),
(10, 'furgoneta');

-- Inserción de datos en la tabla marca
insert into marca (idmarca, nombre) values
(1, 'toyota'),
(2, 'ford'),
(3, 'chevrolet'),
(4, 'honda'),
(5, 'nissan'),
(6, 'hyundai'),
(7, 'volkswagen'),
(8, 'kia'),
(9, 'mazda'),
(10, 'subaru');

-- Inserción de datos en la tabla vehiculo
insert into vehiculo (idvehiculo, patente, marca, modelo, color, precio, frecuenciamantencion, marca_idmarca, tipovehiculo_idtipovehiculo) values
(1, 'abc123', 'toyota', 'corolla', 'blanco', 15000000, 2, 1, 1),
(2, 'def456', 'ford', 'focus', 'negro', 18000000, 3, 2, 1),
(3, 'ghi789', 'chevrolet', 'cruze', 'rojo', 17000000, 1, 3, 1),
(4, 'jkl012', 'honda', 'civic', 'azul', 20000000, 2, 4, 1),
(5, 'mno345', 'nissan', 'sentra', 'gris', 16000000, 2, 5, 1),
(6, 'pqr678', 'hyundai', 'elantra', 'blanco', 17500000, 3, 6, 1),
(7, 'stu901', 'volkswagen', 'golf', 'verde', 19000000, 1, 7, 1),
(8, 'vwx234', 'kia', 'sportage', 'negro', 21000000, 1, 8, 1),
(9, 'yza567', 'mazda', 'mazda 3', 'rojo', 18500000, 2, 9, 1),
(10, 'bcd890', 'subaru', 'impreza', 'azul', 19500000, 1, 10, 1);

-- Inserción de datos en la tabla venta
insert into venta (folio, fecha, monto, vehiculo_idvehiculo, cliente_rut) values
(1, '2024-01-15', 150000, 1, '111111111'),
(2, '2024-02-20', 1800000, 2, '222222222'),
(3, '2024-03-25', 1700000, 3, '333333333'),
(4, '2024-04-10', 20000000, 4, '444444444'),
(5, '2024-05-05', 160000, 5, '444444444'),
(6, '2024-06-12', 17500000, 6, '777777777'),
(7, '2024-07-18', 1900000, 7, '777777777'),
(8, '2024-08-25', 2100000, 8, '888888888'),
(9, '2024-09-01', 185000, 9, '999999999'),
(10, '2024-10-10', 19500000, 10, '000000000');

-- Inserción de datos en la tabla mantencion
insert into mantencion (idmantencion, fecha, trabajosrealizados, venta_folio) values
(1, '2024-02-01', 'Cambio de aceite', 1),
(2, '2024-03-10', 'Revisión de frenos', 2),
(3, '2024-04-05', 'Cambio de neumáticos', 3),
(4, '2024-05-20', 'Revisión completa', 4),
(5, '2024-06-15', 'Cambio de batería', 5),
(6, '2024-07-30', 'Alineación y balanceo', 6),
(7, '2024-08-10', 'Cambio de bujías', 7),
(8, '2024-09-05', 'Revisión de suspensión', 8),
(9, '2024-10-01', 'Cambio de aceite', 9),
(10, '2024-11-20', 'Revisión de sistema eléctrico', 10);

#1

select nombre, rut
from cliente
where rut not in (select cliente_rut from venta);

#2

select v.folio, v.fecha, v.monto, c.nombre as nombrecliente, c.rut as rutcliente
from venta v
join cliente c on v.cliente_rut = c.rut;

#3

select c.nombre as nombrecliente, c.rut as rutcliente,
       sum(v.monto) as total_ventas_anuales,
       case
           when sum(v.monto) between 0 and 1000000 then 'standar'
           when sum(v.monto) between 1000001 and 3000000 then 'gold'
           when sum(v.monto) > 3000000 then 'premium'
       end as clasificacion
from venta v
join cliente c on v.cliente_rut = c.rut
group by c.nombre, c.rut;

#4

select v.folio, v.fecha, v.monto, m.nombre as marca
from venta v
join vehiculo ve on v.vehiculo_idvehiculo = ve.idvehiculo
join marca m on ve.marca_idmarca = m.idmarca
where ve.marca_idmarca = (
    select ve.marca_idmarca
    from venta v
    join vehiculo ve on v.vehiculo_idvehiculo = ve.idvehiculo
    group by ve.marca_idmarca
    order by count(ve.marca_idmarca) desc
    limit 1
);

commit;

