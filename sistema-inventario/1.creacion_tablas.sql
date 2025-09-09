-- Crear base de datos
CREATE DATABASE inventario_db;
USE inventario_db;

-- Tabla Proveedores
CREATE TABLE proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

-- Tabla Productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) CHECK (precio > 0),
    cantidad_inventario INT DEFAULT 0 CHECK (cantidad_inventario >= 0),
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- Tabla Transacciones
CREATE TABLE transacciones (
    id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('compra', 'venta') NOT NULL,
    fecha DATE NOT NULL,
    cantidad INT CHECK (cantidad > 0),
    id_producto INT NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);