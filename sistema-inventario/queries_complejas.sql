-- Total de ventas del mes anterior
SELECT p.nombre, SUM(t.cantidad) as cantidad_vendida, 
       SUM(t.cantidad * p.precio) as valor_total
FROM productos p
JOIN transacciones t ON p.id_producto = t.id_producto
WHERE t.tipo = 'venta' 
  AND t.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY p.id_producto, p.nombre;

-- JOIN para información relacionada
SELECT p.nombre as producto, pr.nombre as proveedor, 
       t.tipo, t.fecha, t.cantidad
FROM productos p
INNER JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor
LEFT JOIN transacciones t ON p.id_producto = t.id_producto
ORDER BY p.nombre;

-- Productos no vendidos en período determinado
SELECT p.nombre, p.cantidad_inventario
FROM productos p
WHERE p.id_producto NOT IN (
    SELECT DISTINCT t.id_producto
    FROM transacciones t
    WHERE t.tipo = 'venta' 
      AND t.fecha >= '2024-01-01'
);
