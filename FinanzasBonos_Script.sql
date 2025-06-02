CREATE DATABASE FinanzasBonos;
GO

USE FinanzasBonos;
GO

-- Tabla: Usuario
CREATE TABLE Usuario (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    clave_acceso VARCHAR(255) NOT NULL,
    rol VARCHAR(20) NOT NULL
);

-- Tabla: MétodoAmortizacion
CREATE TABLE MetodoAmortizacion (
    id_metodo INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
);

-- Tabla: PlazoGracia
CREATE TABLE PlazoGracia (
    id_plazo INT IDENTITY(1,1) PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL,
    duracion_mes INT NOT NULL
);

-- Tabla: Moneda
CREATE TABLE Moneda (
    id_moneda INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    simbolo VARCHAR(3) NOT NULL
);

-- Tabla: TasaInteres
CREATE TABLE TasaInteres (
    id_tasa INT IDENTITY(1,1) PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL,
    valor DECIMAL(5, 2) NOT NULL,
    capitalizacion VARCHAR(20) NULL
);

-- Tabla: Bono
CREATE TABLE Bono (
    id_bono INT IDENTITY(1,1) PRIMARY KEY,
    valor_nominal DECIMAL(15, 2) NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    id_metodo_amortizacion INT NOT NULL,
    id_moneda INT NOT NULL,
    id_tasa_interes INT NOT NULL,
    id_plazo INT NULL,
    FOREIGN KEY (id_metodo_amortizacion) REFERENCES MetodoAmortizacion(id_metodo),
    FOREIGN KEY (id_moneda) REFERENCES Moneda(id_moneda),
    FOREIGN KEY (id_tasa_interes) REFERENCES TasaInteres(id_tasa),
    FOREIGN KEY (id_plazo) REFERENCES PlazoGracia(id_plazo)
);

-- Tabla: FlujoCaja
CREATE TABLE FlujoCaja (
    id_flujo INT IDENTITY(1,1) PRIMARY KEY,
    periodo INT NOT NULL,
    monto_pago DECIMAL(15, 2) NOT NULL,
    fecha_pago DATE NOT NULL,
    id_bono INT NOT NULL,
    FOREIGN KEY (id_bono) REFERENCES Bono(id_bono)
);

-- Tabla: Valoracion
CREATE TABLE Valoracion (
    id_valoracion INT IDENTITY(1,1) PRIMARY KEY,
    tcea DECIMAL(10, 6) NOT NULL,
    trea DECIMAL(10, 6) NOT NULL,
    convexidad DECIMAL(10, 6) NOT NULL,
    duracion DECIMAL(10, 6) NOT NULL,
    duracion_modificada DECIMAL(10, 6) NOT NULL,
    precio_mercado DECIMAL(15, 2) NOT NULL,
    id_usuario INT NOT NULL,
    id_bono INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_bono) REFERENCES Bono(id_bono)
);
