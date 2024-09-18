create table departamentos (
    id serial primary key,
    nombre varchar(100),
    ubicacion varchar(100)
);

create table empleados (
    id serial primary key,
    nombre varchar(100),
    puesto varchar(100),
    salario numeric(10, 2),
    fecha_contratacion date,
    departamento_id integer, 
	constraint fk_departamento foreign key (departamento_id) 
		references departamentos(id)
);