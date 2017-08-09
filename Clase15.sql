-- 1
	/* Create a view named list_of_customers, it should contain the following columns:
	 * 		customer id
	 * 		customer full name, 
	 * 		address	
	 * 		zip code
	 * 		phone 
	 * 		city
	 * 		country
	 * 		status (when active column is 1 show it as 'active', otherwise is 'inactive') 
	 * 		store id
	 */

CREATE VIEW list_of_customers AS
SELECT customer_id, 
	CONCAT_WS(" ", first_name, last_name) 
	AS customer_full_name, address, postal_code, phone, city, country, 
CASE WHEN active = 1 THEN "Active" ELSE "Inactive" END AS status, store_id
FROM customer
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id);

SELECT * FROM list_of_customers;



-- 2
	/* Create a view named film_details, it should contain the following columns:
	 * 		film id,  title, description,  category,  price,  length,  rating, actors  
	 * 	-as a string of all the actors separated by comma.
	 * Hint use GROUP_CONCAT
 	 */

CREATE VIEW film_details AS
SELECT film_id, title, description, category.name, rental_rate, `length`, film.rating,
		GROUP_CONCAT(CONCAT_WS(" ", first_name, last_name) SEPARATOR ',') AS actors
FROM film
	INNER JOIN film_actor USING(film_id)
	INNER JOIN actor USING(actor_id)
	INNER JOIN film_category USING(film_id)
	INNER JOIN category USING(category_id)
GROUP BY film_id,name;

SELECT * FROM film_details;



-- 3
	/*Create view sales_by_film_category, it should return 'category' and 'total_rental' columns.
 	*/

CREATE VIEW sales_by_film_category AS
SELECT name, SUM(amount)
FROM category
	INNER JOIN film_category USING(category_id)
	INNER JOIN film USING(film_id)
	INNER JOIN inventory USING(film_id)
	INNER JOIN rental USING(inventory_id)
	INNER JOIN payment USING(rental_id)
GROUP BY name;
		
SELECT * FROM sales_by_film_category;



-- 4
	/* Create a view called actor_information where it should return, actor id, first name, last
	 * 	name and the amount of films he/she acted on.
	 */

CREATE VIEW actor_information AS
SELECT actor_id, first_name, last_name, SUM(amount)
FROM actor
INNER JOIN film_actor USING(actor_id)
INNER JOIN film USING(film_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN payment USING(rental_id)
GROUP BY 1,2,3;

SELECT * FROM actor_information;