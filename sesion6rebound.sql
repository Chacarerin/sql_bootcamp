-- Creación de tablas
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
    celular varchar(12),
    alta char(1),
    constraint cliente_fk foreign key (rut) references empresa (rut)
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
    frecuenciamantenimiento integer,
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

insert into empresa (rut, nombre, direccion, telefono, correo, web) values
('123456789', 'autoventas s.a.', 'av. libertador 123', '55512341', 'con@auventas.com', 'http://www.autoventas.com'),
('234567890', 'motoventa ltda.', 'calle falsa 456', '55556787', 'info@motoventa.com', 'http://www.motoventa.com'),
('345678901', 'carros rápidos', 'paseo colón 789', '55587657', 'ventas@carapidos.com', 'http://www.carrosrapidos.com'),
('456789012', 'autos y más', 'av. rivadavia 101', '55541432', 'atencion@auymas.com', 'http://www.autosymas.com'),
('567890123', 'vehículos premium', 'calle corrientes 202', '55145345', 'con@vepremium.com', 'http://www.vehiculospremium.com'),
('678901234', 'automotores del norte', 'av. santa fe 303', '13555654', 'info@aunorte.com', 'http://www.automotoresnorte.com'),
('789012345', 'moviliza s.a.', 'calle 9 de julio 404', '46555789', 'ventas@moviliza.com', 'http://www.moviliza.com'),
('890123456', 'automax', 'av. belgrano 505', '99555098', 'cont@automax.com', 'http://www.automax.com'),
('901234567', 'movicar ltda.', 'calle tucumán 606', '99555678', 'info@movicar.com', 'http://www.movicar.com'),
('012345678', 'car dealer', 'av. córdoba 707', '99555987', 'ventas@cardealer.com', 'http://www.cardealer.com');

insert into tipovehiculo values 
(1, 'automovil'),
(2, 'bicicleta'),
(3, 'motocicleta'),
(4, 'ciclomotor');

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

insert into vehiculo (idvehiculo, patente, marca, modelo, color, precio, frecuenciamantenimiento, marca_idmarca, tipovehiculo_idtipovehiculo) values
(1, 'abc123', 'toyota', 'corolla', 'blanco', 15000, 2, 1, 1),
(2, 'def456', 'ford', 'focus', 'negro', 18000, 3, 2, 1),
(3, 'ghi789', 'chevrolet', 'cruze', 'rojo', 17000, 1, 3, 1),
(4, 'jkl012', 'honda', 'civic', 'azul', 20000, 2, 4, 1),
(5, 'mno345', 'nissan', 'sentra', 'gris', 16000, 2, 5, 1),
(6, 'pqr678', 'hyundai', 'elantra', 'blanco', 17500, 3, 6, 1),
(7, 'stu901', 'volkswagen', 'golf', 'verde', 19000, 1, 7, 1),
(8, 'vwx234', 'kia', 'sportage', 'negro', 21000, 1, 8, 1),
(9, 'yza567', 'mazda', '3', 'rojo', 18500, 2, 9, 1),
(10, 'bcd890', 'subaru', 'impreza', 'azul', 19500, 1, 10, 1);

insert into cliente (nombre, correo, direccion, rut, celular, alta) values
('juan pérez', 'juan@example.com', 'libertador 123', '123456789', '987654321', 't'),
('maría gonzález', 'maria@example.com', 'falsa 456', '234567890', '876543210', 't'),
('luis martínez', 'luis@example.com', 'colón 789', '345678901', '765432109', 't'),
('ana rodríguez', 'ana@example.com', 'rivadavia 101', '456789012', '654321098', 't'),
('carlos lópez', 'carlos@example.com', 'corrientes 202', '567890123', '543210987', 't'),
('laura fernández', 'laura@example.com', 'santa fe 303', '678901234', '432109876', 't'),
('miguel sánchez', 'miguel@example.com', '9 de julio 404', '789012345', '321098765', 't'),
('sofia morales', 'sofia@example.com', 'belgrano 505', '890123456', '210987654', 't'),
('jorge gómez', 'jorge@example.com', 'tucumán 606', '901234567', '109876543', 't'),
('silvia torres', 'silvia@example.com', 'córdoba 707', '012345678', '098765432', 't');

insert into venta (cliente_rut, vehiculo_idvehiculo, fecha, monto, folio) values
('123456789', 1, '2024-01-15', 15000, 1),
('234567890', 2, '2024-02-20', 18000, 2),
('345678901', 3, '2024-03-10', 17000, 3),
('456789012', 4, '2024-04-25', 20000, 4),
('567890123', 5, '2024-05-30', 16000, 5),
('678901234', 6, '2024-06-05', 17500, 6),
('789012345', 7, '2024-07-12', 19000, 7),
('890123456', 8, '2024-08-18', 21000, 8),
('901234567', 9, '2024-09-25', 18500, 9),
('012345678', 10, '2024-10-02', 19500, 10);

insert into mantencion (idmantencion, trabajosrealizados, fecha, venta_folio) values
(1, 'cambio de aceite', '2024-01-20', 1),
(2, 'revisión de frenos', '2024-02-28', 2),
(3, 'reemplazo de neumáticos', '2024-03-15', 3),
(4, 'cambio de bujías', '2024-04-30', 4),
(5, 'limpieza de inyectores', '2024-05-10', 5),
(6, 'ajuste de frenos', '2024-06-20', 6),
(7, 'revisión de suspensión', '2024-07-15', 7),
(8, 'alineación y balanceo', '2024-08-25', 8),
(9, 'revisión general', '2024-09-10', 9);

#1

select v.idvehiculo, v.patente, v.marca, v.modelo, v.color
from vehiculo v
left join venta ve on v.idvehiculo = ve.vehiculo_idvehiculo
where ve.vehiculo_idvehiculo is null;

#2

select ve.folio, ve.fecha as fechaventa, ve.monto as montoventa,
       c.nombre as nombrecliente, c.rut as rutcliente,
       v.patente, m.nombre as nombremarca, v.modelo
from venta ve
join cliente c on ve.cliente_rut = c.rut
join vehiculo v on ve.vehiculo_idvehiculo = v.idvehiculo
join marca m on v.marca_idmarca = m.idmarca
where ve.fecha between '2020-01-01' and '2020-01-31';

#3

select extract(month from ve.fecha) as mes, m.nombre as marca, sum(ve.monto) as total_ventas
from venta ve
join vehiculo v on ve.vehiculo_idvehiculo = v.idvehiculo
join marca m on v.marca_idmarca = m.idmarca
where extract(year from ve.fecha) = 2020
group by extract(month from ve.fecha), m.nombre
order by mes, marca;

#4

select rut, nombre
from cliente
union
select rut, nombre
from empresa;
