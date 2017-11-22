/*
VIEWS
-----------
A VIEW is not a physical table, but rather, it is in essence a virtual table created by a query joining one or more tables.


Create VIEW
---------------
Syntax
The syntax for the CREATE VIEW statement in MySQL is:

CREATE [OR REPLACE] VIEW view_name AS
  SELECT columns
  FROM tables
  [WHERE conditions];


OR REPLACE
----------
Optional. If you do not specify this clause and the VIEW already exists, the CREATE VIEW statement will return an error.


view_name
---------
The name of the VIEW that you wish to create in MySQL.


WHERE conditions
------------------
Optional. The conditions that must be met for the records to be included in the VIEW.

Example
Here is an example of how to use the CREATE VIEW statement to create a view in MySQL:
*/
CREATE VIEW hardware_suppliers AS
  SELECT supplier_id, supplier_name
  FROM suppliers
  WHERE category_type = 'Hardware';

-- This CREATE VIEW example would create a virtual table based on the result set of the SELECT statement. You can now query the MySQL VIEW as follows:

SELECT *
FROM hardware_suppliers;



/*
Update VIEW
-----------
You can modify the definition of a VIEW in MySQL without dropping it by using the ALTER VIEW statement.

Syntax
The syntax for the ALTER VIEW statement in MySQL is:

ALTER VIEW view_name AS
  SELECT columns
  FROM table
  WHERE conditions;

Example
Here is an example of how you would use the ALTER VIEW statement in MySQL:
*/
ALTER VIEW hardware_suppliers AS
  SELECT supplier_id, supplier_name, address, city
  FROM suppliers
  WHERE category_type = 'Hardware';
/*

This ALTER VIEW example in MySQL would update the definition of the VIEW called hardware_suppliers without dropping it. 
In this example, we are adding the address and city columns to the VIEW.


Drop VIEW
---------
Once a VIEW has been created in MySQL, you can drop it with the DROP VIEW statement.

Syntax
The syntax for the DROP VIEW statement in MySQL is:

DROP VIEW [IF EXISTS] view_name;
view_name


The name of the view that you wish to drop.

IF EXISTS

Optional. If you do not specify this clause and the VIEW does not exist, the DROP VIEW statement will return an error.

Example
Here is an example of how to use the DROP VIEW statement in MySQL:
*/
DROP VIEW hardware_suppliers;

-- This DROP VIEW example would drop/delete the MySQL VIEW called hardware_suppliers.



------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXERCISES


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

/*
	5_Analyze view actor_info, explain the entire query and specially how the sub query works.
		 Be very specific, take some time and decompose each part and give an explanation for each. 
	6_Materialized views, write a description, why they are used, alternatives, DBMS were they exist, etc. 
 */

-- 5

SELECT * FROM actor_info;


-- 6

-- A materialized view is a replica of a target master from a single point in time. 
-- The master can be either a master table at a master site or a master materialized view at a materialized view site. 
-- Whereas in multimaster replication tables are continuously updated by other master sites, materialized views are updated from one or more masters through individual batch updates,
-- known as a refreshes, from a single master site or master materialized view site

-- Why Use Materialized Views?
--   + Ease Network Loads
--   + Create a Mass Deployment Environment
--   + Enable Data Subsetting
--   + Enable Disconnected Computing