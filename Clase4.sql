SELECT f1.title, f2.title, f1.`length`
FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id <> f2.film_id


