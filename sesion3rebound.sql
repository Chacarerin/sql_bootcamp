create table empresa (
    rut varchar(10) primary key,
    nombre varchar(120) not null,
    direccion varchar(120),
    telefono varchar(15) not null,
    correo varchar(80),
    web varchar(50)
);

create table cliente (
    rut varchar(10) primary key,
    nombre varchar(120) not null,
    correo varchar(80),
    direccion varchar(120),
    celular varchar(15),
    alta char(1)
);

create table tipovehiculo (
    idtipovehiculo numeric(12) primary key,
    nombre varchar(120)
);

create table marcas (
    idmarca numeric(12) primary key,
    nombre varchar(120) not null
);

create table vehiculo (
    idvehiculo numeric(12) primary key,
    patente varchar(10) not null,
    marca varchar(20),
    modelo varchar(20),
    color varchar(15),
    precio numeric(12),
    frecuenciamantenimiento numeric(5),
    marca_idmarca numeric(12) not null,
    tipovehiculo_idtipovehiculo numeric(12) not null,
    constraint vehiculo_tipovehiculo_fk foreign key (tipovehiculo_idtipovehiculo)
        references tipovehiculo(idtipovehiculo),
    constraint vehiculo_marca_fk foreign key (marca_idmarca)
        references marcas(idmarca)
);

create table venta (
    folio numeric(12) primary key,
    fecha date,
    monto numeric(12),
    vehiculo_idvehiculo numeric(12) not null,
    cliente_rut varchar(10) not null,
    constraint venta_cliente_fk foreign key (cliente_rut)
        references cliente(rut),
    constraint venta_vehiculo_fk foreign key (vehiculo_idvehiculo)
        references vehiculo(idvehiculo)
);

create table mantenimiento (
    idmantenimiento numeric(12) primary key,
    fecha date,
    trabajosrealizados varchar(1000),
    venta_folio numeric(12) not null,
    constraint mantenimiento_venta_fk foreign key (venta_folio)
        references venta(folio)
);