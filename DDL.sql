-- Creación de los esquemas
CREATE DATABASE schema_17_1;
CREATE DATABASE schema_17_2;
CREATE DATABASE schema_17_3;

-- Uso del primer esquema
USE schema_17_1;

-- Creación de las 5 tablas para el esquema 1
CREATE TABLE tabla1_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    cantidad INT
);

CREATE TABLE tabla2_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    fecha DATE,
    activo BOOLEAN,
    comentario VARCHAR(255)
);

CREATE TABLE tabla3_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    valor DECIMAL(10, 2),
    fecha TIMESTAMP
);

CREATE TABLE tabla4_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50),
    descripcion TEXT,
    stock INT,
    ultima_actualizacion DATETIME
);

CREATE TABLE tabla5_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(50),
    total DECIMAL(10, 2),
    descuento DECIMAL(5, 2)
);

-- Repetimos para los otros dos esquemas
USE schema_17_2;

CREATE TABLE tabla1_17_2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    cantidad INT
);

CREATE TABLE tabla2_17_2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    fecha DATE,
    activo BOOLEAN,
    comentario VARCHAR(255)
);

CREATE TABLE tabla3_17_2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    valor DECIMAL(10, 2),
    fecha TIMESTAMP
);

CREATE TABLE tabla4_17_2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50),
    descripcion TEXT,
    stock INT,
    ultima_actualizacion DATETIME
);

CREATE TABLE tabla5_17_2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(50),
    total DECIMAL(10, 2),
    descuento DECIMAL(5, 2)
);

USE schema_17_3;

CREATE TABLE tabla1_17_3 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    cantidad INT
);

CREATE TABLE tabla2_17_3 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    fecha DATE,
    activo BOOLEAN,
    comentario VARCHAR(255)
);

CREATE TABLE tabla3_17_3 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    valor DECIMAL(10, 2),
    fecha TIMESTAMP
);

CREATE TABLE tabla4_17_3 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50),
    descripcion TEXT,
    stock INT,
    ultima_actualizacion DATETIME
);

CREATE TABLE tabla5_17_3 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(50),
    total DECIMAL(10, 2),
    descuento DECIMAL(5, 2)
);
