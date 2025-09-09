-- Insertar proveedores
INSERT INTO proveedores (nombre, direccion, telefono, email) VALUES
('TechSupply', 'Calle 123 #45-67', '3001234567', 'info@techsupply.com'),
('OfficeWorld', 'Carrera 89 #12-34', '3009876543', 'ventas@officeworld.com'),
('GlobalParts', 'Avenida 45 #78-90', '3005551234', 'contacto@globalparts.com');

-- Insertar productos
INSERT INTO productos (nombre, descripcion, precio, cantidad_inventario, id_proveedor) VALUES
('Laptop HP', 'Laptop HP Core i5 8GB RAM', 2500000, 10, 1),
('Mouse Inalámbrico', 'Mouse óptico inalámbrico', 45000, 25, 2),
('Teclado Mecánico', 'Teclado mecánico retroiluminado', 180000, 15, 1),
('Monitor 24"', 'Monitor LED 24 pulgadas', 800000, 8, 3),
('Impresora', 'Impresora multifuncional', 350000, 5, 2);

-- Insertar transacciones
INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor) VALUES
('compra', '2024-01-15', 10, 1, 1),
('venta', '2024-01-20', 2, 1, NULL),
('compra', '2024-01-18', 25, 2, 2),
('venta', '2024-01-25', 5, 2, NULL),
('compra', '2024-02-01', 15, 3, 1),
('venta', '2024-02-05', 3, 3, NULL);
