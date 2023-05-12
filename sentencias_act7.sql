/* Todas las mesas ocupadas 
de un local en concreto, 
así como los clientes que las ocupan */
SELECT m.numero_mesa, m.comensales, c.nombre as 'nombre cliente'
FROM restaurante.cliente as c, restaurante.mesas as m
WHERE m.cliente_id = c.id AND m.ocupada = 0 AND m.locales_id = 7;

/* Todos los locales marcados 
como favorito por un cliente, incluyendo 
la información del local y del cliente. */
SELECT c.nombre, l.nombre, l.nombre_responsable, l.direccion, 
l.telefono, c.telefono, c.email
FROM restaurante.favoritos as f
JOIN restaurante.cliente as c ON c.id = f.cliente_id
JOIN restaurante.locales as l ON l.id = f.locales_id
WHERE c.nombre LIKE '%Maria%';