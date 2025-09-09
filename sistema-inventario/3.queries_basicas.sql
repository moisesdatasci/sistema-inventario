-- Todos los productos disponibles
SELECT * FROM productos WHERE cantidad_inventario > 0;

-- Proveedores que suministran productos específicos
SELECT DISTINCT p.nombre AS proveedor, prod.nombre AS producto
FROM proveedores p
JOIN productos prod ON p.id_proveedor = prod.id_proveedor;

-- Transacciones en fecha específica
SELECT * FROM transacciones WHERE fecha = '2024-01-20';

-- Total de productos vendidos
SELECT COUNT(*) as total_ventas, SUM(cantidad) as cantidad_total
FROM transacciones WHERE tipo = 'venta';

-- Valor total de compras
SELECT SUM(t.cantidad * p.precio) as valor_total_compras
FROM transacciones t
JOIN productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'compra';