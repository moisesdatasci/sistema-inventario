-- Actualizar inventario después de una venta
UPDATE productos 
SET cantidad_inventario = cantidad_inventario - 2 
WHERE id_producto = 1;

-- Actualizar inventario después de una compra
UPDATE productos 
SET cantidad_inventario = cantidad_inventario + 10 
WHERE id_producto = 1;

-- Eliminar producto (con verificación de integridad referencial)
DELETE FROM transacciones WHERE id_producto = 5;
DELETE FROM productos WHERE id_producto = 5;