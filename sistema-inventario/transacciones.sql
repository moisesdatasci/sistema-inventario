-- Transacción para registrar una compra
BEGIN;
    -- Registrar la transacción
    INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor) 
    VALUES ('compra', CURDATE(), 5, 4, 3);
    
    -- Actualizar inventario
    UPDATE productos 
    SET cantidad_inventario = cantidad_inventario + 5 
    WHERE id_producto = 4;
COMMIT;

-- Ejemplo de ROLLBACK en caso de error
BEGIN;
    INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor) 
    VALUES ('venta', CURDATE(), 100, 1, NULL);
    
    -- Si no hay suficiente inventario, hacer rollback
    UPDATE productos 
    SET cantidad_inventario = cantidad_inventario - 100 
    WHERE id_producto = 1 AND cantidad_inventario >= 100;
    
    -- Si la actualización no afectó ninguna fila, hacer rollback
    -- ROLLBACK;
COMMIT;
