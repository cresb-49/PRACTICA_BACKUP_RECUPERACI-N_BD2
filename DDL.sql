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

-- Tabla 1: Información de empleados
CREATE TABLE empleados_17_2 (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100),
    puesto VARCHAR(50),
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);

-- Tabla 2: Proyectos asignados a los empleados
CREATE TABLE proyectos_17_2 (
    proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proyecto VARCHAR(100),
    empleado_responsable INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estatus TEXT
);

-- Tabla 3: Ventas realizadas por empleados
CREATE TABLE ventas_17_2 (
    venta_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    monto_venta DECIMAL(10, 2),
    fecha_venta DATE,
    cliente VARCHAR(100)
);

-- Tabla 4: Inventario de productos
CREATE TABLE inventario_productos_17_2 (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(250),
    cantidad_stock INT,
    precio_unitario DECIMAL(10, 2),
    proveedor VARCHAR(100)
);

-- Tabla 5: Compras realizadas por la empresa
CREATE TABLE compras_17_2 (
    compra_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    cantidad_comprada INT,
    fecha_compra DATE,
    costo_total DECIMAL(10, 2)
);

USE schema_17_3;

-- Tabla 1: Información sobre clientes
CREATE TABLE clientes_17_3 (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100)
);

-- Tabla 2: Facturas emitidas a los clientes
CREATE TABLE facturas_17_3 (
    factura_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_factura DATE,
    total_factura DECIMAL(10, 2),
    estado_factura VARCHAR(50)
);

-- Tabla 3: Detalles de productos en las facturas
CREATE TABLE detalles_factura_17_3 (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT,
    factura_id INT,
    producto VARCHAR(250),
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2)
);

-- Tabla 4: Información de pagos realizados
CREATE TABLE pagos_17_3 (
    pago_id INT PRIMARY KEY AUTO_INCREMENT,
    factura_id INT,
    fecha_pago DATE,
    metodo_pago VARCHAR(50),
    monto_pago DECIMAL(10, 2)
);

-- Tabla 5: Proveedores de productos
CREATE TABLE proveedores_17_3 (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(100),
    contacto_proveedor VARCHAR(100),
    telefono_proveedor VARCHAR(20),
    direccion_proveedor VARCHAR(255)
);
