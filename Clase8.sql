-- find the minimun payment of users which last name starts with R

SELECT MIN(amount)
FROM customer, payment
WHERE customer.customer_id = payment.customer_id
AND customer.last_name LIKE 'R%';

SELECT COUNT(*)
FROM inventory
WHERE store_id = 1;

SELECT COUNT(DISTINCT film_id)
FROM inventory
WHERE store_id = 1;

SELECT AVG(length)
FROM film, inventory
WHERE film.film_id = inventory.film_id
AND inventory.store_id = 1;

SELECT AVG(length)
FROM film
WHERE film_id IN (SELECT film_id
				  FROM inventory
				  WHERE store_id = 1);

-- SELECT other_stores.av
-- FROM (SELECT AVG(length) av
	--  FROM film
	  -- WHERE film_id NOT IN)
				  
SELECT str1.av - other_stores.av
FROM (
	  SELECT AVG (length) av
	  FROM film
	  WHERE film_id IN (SELECT film_id
	  					FROM inventory
	  					WHERE store_id = 1)) AS str1,
	 (SELECT AVG (length) av
	  FROM film
	  WHERE film_id NOT IN (SELECT film_id
	  						FROM inventory
	  						WHERE store_id = 1)) AS other_stores

SELECT DISTINCT (
				 SELECT AVG(length) av
				 FROM film
				 WHERE film_id IN (SELECT film_id
				 FROM inventory
				 WHERE store_id = 1)) AS str1,
				 