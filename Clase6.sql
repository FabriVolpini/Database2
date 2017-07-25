-- 1

SELECT first_name, last_name
FROM actor a1
WHERE last_name IN (SELECT last_name
					FROM actor a2
					WHERE a1.last_name = a2.last_name AND a1.actor_id <> a2.actor_id)
ORDER BY last_name;


-- 2
SELECT actor_id
FROM actor a1
WHERE actor_id IN (SELECT actor_id
				   FROM film_actor a2
				   WHERE a1.actor_id <> a2.actor_id);

-- 3

SELECT c.customer_id, c.first_name, c.last_name
FROM rental r1, customer c
WHERE NOT EXISTS (SELECT *
				  FROM rental r2
				  WHERE r1.customer_id = r2.customer_id
				  AND r1.rental_id <> r2.rental_id);

-- 4

SELECT c.customer_id, c.first_name, c.last_name
FROM rental r1, customer c
WHERE EXISTS (SELECT *
				  FROM rental r2
				  WHERE r1.customer_id = r2.customer_id
				  AND r1.rental_id <> r2.rental_id);

-- Ejercicio 5

SELECT first_name, last_name, title
FROM actor
JOIN film
ON title LIKE '%BETRAYED REAR%' OR title LIKE '%CATCH AMISTAD%'

-- Ejercicio 6

SELECT actor_id,	

SELECT first_name, last_name, title
FROM actor
JOIN film
ON title LIKE '%BETRAYED REAR%' AND NOT title LIKE '%CATCH AMISTAD%'

-- Ejercio 7

SELECT first_name, last_name, title
FROM actor
JOIN film
ON title LIKE '%BETRAYED REAR%' AND title LIKE '%CATCH AMISTAD%'

-- Ejercicio 8

SELECT DISTINCT first_name, last_name
FROM actor
JOIN film
ON NOT title LIKE '%BETRAYED REAR%' AND NOT title LIKE '%CATCH AMISTAD%'