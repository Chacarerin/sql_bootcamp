create table empresa (
	rut varchar(10) primary key,
	nombre varchar(120) not null,
	direccion varchar(120),
	telefono varchar(15),
	correo varchar(80),
	web varchar(50)
);

create table cliente (
	rut varchar(10) primary key,
	nombre varchar(100) not null,
	correo varchar(40),
	direccion varchar(120),
	celular varchar(10) not null
);

create table herramienta (
	IdHerramienta numeric(12) primary key,
	nombre varchar(120) not null,
	precioDia numeric(12) not null
);

create table arriendo (
	folio numeric(12) primary key,
	fecha date,
	dias numeric(5),
	valordia numeric(12),
	garantia varchar(30),
	herramienta_IdHerramienta numeric(12) not null,
	cliente_rut varchar (10) not null,
	constraint arriendo_herramienta_fk foreign key (herramienta_IdHerramienta) references herramienta(IdHerramienta),
	constraint arriendo_cliente_fk foreign key (cliente_rut) references cliente(rut)
);