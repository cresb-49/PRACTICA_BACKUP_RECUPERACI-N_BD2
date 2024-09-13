-- Crear un nuevo usuario llamado 'admin_db2' con una contraseña segura, si no existe
CREATE USER IF NOT EXISTS 'admin_db2'@'localhost' IDENTIFIED BY '201931012';

-- Otorgar todos los permisos sobre la base de datos schema_17_1
GRANT ALL PRIVILEGES ON schema_17_1.* TO 'admin_db2'@'localhost';

-- Otorgar todos los permisos sobre la base de datos schema_17_2
GRANT ALL PRIVILEGES ON schema_17_2.* TO 'admin_db2'@'localhost';

-- Otorgar todos los permisos sobre la base de datos schema_17_3
GRANT ALL PRIVILEGES ON schema_17_3.* TO 'admin_db2'@'localhost';

-- Aplicar los cambios
FLUSH PRIVILEGES;


-- Creación de los esquemas si no existen
CREATE DATABASE IF NOT EXISTS schema_17_1;
CREATE DATABASE IF NOT EXISTS schema_17_2;
CREATE DATABASE IF NOT EXISTS schema_17_3;

-- Uso del primer esquema
USE schema_17_1;

-- Creación de las 5 tablas para el esquema 1, si no existen
CREATE TABLE IF NOT EXISTS tabla1_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    cantidad INT
);

CREATE TABLE IF NOT EXISTS tabla2_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    fecha DATE,
    activo BOOLEAN,
    comentario VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tabla3_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    valor DECIMAL(10, 2),
    fecha TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tabla4_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50),
    descripcion TEXT,
    stock INT,
    ultima_actualizacion DATETIME
);

CREATE TABLE IF NOT EXISTS tabla5_17_1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(50),
    total DECIMAL(10, 2),
    descuento DECIMAL(5, 2)
);

-- Uso del segundo esquema
USE schema_17_2;

-- Tabla 1: Información de empleados
CREATE TABLE IF NOT EXISTS empleados_17_2 (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100),
    puesto VARCHAR(50),
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);

-- Tabla 2: Proyectos asignados a los empleados
CREATE TABLE IF NOT EXISTS proyectos_17_2 (
    proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proyecto VARCHAR(100),
    empleado_responsable INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estatus TEXT
);

-- Tabla 3: Ventas realizadas por empleados
CREATE TABLE IF NOT EXISTS ventas_17_2 (
    venta_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    monto_venta DECIMAL(10, 2),
    fecha_venta DATE,
    cliente VARCHAR(100)
);

-- Tabla 4: Inventario de productos
CREATE TABLE IF NOT EXISTS inventario_productos_17_2 (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(250),
    cantidad_stock INT,
    precio_unitario DECIMAL(10, 2),
    proveedor VARCHAR(100)
);

-- Tabla 5: Compras realizadas por la empresa
CREATE TABLE IF NOT EXISTS compras_17_2 (
    compra_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    cantidad_comprada INT,
    fecha_compra DATE,
    costo_total DECIMAL(10, 2)
);

-- Uso del tercer esquema
USE schema_17_3;

-- Tabla 1: Información sobre clientes
CREATE TABLE IF NOT EXISTS clientes_17_3 (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100)
);

-- Tabla 2: Facturas emitidas a los clientes
CREATE TABLE IF NOT EXISTS facturas_17_3 (
    factura_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_factura DATE,
    total_factura DECIMAL(10, 2),
    estado_factura VARCHAR(50)
);

-- Tabla 3: Detalles de productos en las facturas
CREATE TABLE IF NOT EXISTS detalles_factura_17_3 (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT,
    factura_id INT,
    producto VARCHAR(250),
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2)
);

-- Tabla 4: Información de pagos realizados
CREATE TABLE IF NOT EXISTS pagos_17_3 (
    pago_id INT PRIMARY KEY AUTO_INCREMENT,
    factura_id INT,
    fecha_pago DATE,
    metodo_pago VARCHAR(50),
    monto_pago DECIMAL(10, 2)
);

-- Tabla 5: Proveedores de productos
CREATE TABLE IF NOT EXISTS proveedores_17_3 (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(100),
    contacto_proveedor VARCHAR(100),
    telefono_proveedor VARCHAR(20),
    direccion_proveedor VARCHAR(255)
);
