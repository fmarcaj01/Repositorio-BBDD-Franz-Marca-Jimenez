-- 1 Inserción Ignorando Errores
UPDATE productos 
SET precio = 12.50 
WHERE nombre = 'Ratón Óptico X1';

-- 2 Actualizar al Insertar
UPDATE productos 
SET precio = precio * 1.05 
WHERE precio < 50;

-- 3 Inserción con Sintaxis
update proveedores p 
set nombre ='GlobalTech SA', ciudad='Tarragona'
where nombre='InforGlobal'
-- 4
UPDATE clientes 
SET saldo = saldo * 1.10 
WHERE saldo > 100;

-- 5 
UPDATE productos 
SET precio = precio * 1.15 
WHERE id_proveedor = (
    SELECT id 
    FROM proveedores 
    WHERE nombre = 'ElectroComponentes'
);