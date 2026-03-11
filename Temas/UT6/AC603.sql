-- 1
UPDATE productos 
SET activo = FALSE 
WHERE nombre = 'Webcam HD' 
  AND proveedor_id IN (
      SELECT id 
      FROM proveedores 
      WHERE ciudad = 'Tarragona'
  );

-- 2 
UPDATE proveedores 
SET activo = FALSE 
WHERE nombre = 'ElectroComponentes';