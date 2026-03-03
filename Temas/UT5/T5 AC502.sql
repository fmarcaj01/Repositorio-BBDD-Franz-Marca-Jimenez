-- 1. Agrupación básica
SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating;

-- 2. Agrupación con JOIN
SELECT c.name AS categoria, COUNT(fc.film_id) AS cantidad_peliculas
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;

-- 3. Múltiples columnas 
SELECT store_id, active, COUNT(*) AS cantidad_clientes
FROM customer
GROUP BY store_id, active;

-- 4. Alegación con LEFT JOIN
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS total_peliculas
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name;

-- 5. RollUP
SELECT s.store_id, p.staff_id, SUM(p.amount) AS total_ingresos
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id, p.staff_id WITH ROLLUP;