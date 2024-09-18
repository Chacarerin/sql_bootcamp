CREATE TABLE Empresa (
    RUT VARCHAR(12) PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(150),
    Telefono VARCHAR(15),
    Correo VARCHAR(100),
    Web VARCHAR(100)
);

CREATE TABLE Cliente (
    RUT VARCHAR(12) PRIMARY KEY,
    Nombre VARCHAR(100),
    Correo VARCHAR(100),
    Direccion VARCHAR(150),
    Celular VARCHAR(15),
    Alta DATE
);

CREATE TABLE TipoVehiculo (
    IDTipoVehiculo INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE Marca (
    IDMarca INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE Vehiculo (
    IDVehiculo INT PRIMARY KEY,
    Patente VARCHAR(10),
    Marca INT,
    Modelo VARCHAR(50),
    Color VARCHAR(30),
    Precio DECIMAL(10, 2),
    FrecuenciaMantenimiento INT,
    IDTipoVehiculo INT,
    FOREIGN KEY (Marca) REFERENCES Marca(IDMarca),
    FOREIGN KEY (IDTipoVehiculo) REFERENCES TipoVehiculo(IDTipoVehiculo)
);

CREATE TABLE Venta (
    Folio INT PRIMARY KEY,
    Fecha DATE,
    Monto DECIMAL(10, 2),
    IDVehiculo INT,
    RUTCliente VARCHAR(12),
    FOREIGN KEY (IDVehiculo) REFERENCES Vehiculo(IDVehiculo),
    FOREIGN KEY (RUTCliente) REFERENCES Cliente(RUT)
);

CREATE TABLE Mantencion (
    IDMantencion INT PRIMARY KEY,
    Fecha DATE,
    TrabajosRealizados TEXT,
    IDVehiculo INT,
    FOREIGN KEY (IDVehiculo) REFERENCES Vehiculo(IDVehiculo)
);