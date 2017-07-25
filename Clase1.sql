CREATE TABLE contacts (
	contact_id INT(11) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	first_name VARCHAR(25),
	birthday DATE
	-- CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
	);


 /*
 CREATE TABLE contacts
     ( contact_id INT(11) NOT NULL AUTO_INCREMENT,
     last_name VARCHAR(30) NOT NULL,
     first_name VARCHAR(25),
     birthday DATE,
     CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
 );
 */


ALTER TABLE contacts
	ADD CONSTRAINT contacts_pk
	PRIMARY KEY (last_name, first_name);


/*Add Primary Keys

ALTER TABLE table_name
  ADD CONSTRAINT [ constraint_name ]
    PRIMARY KEY [ USING BTREE | HASH ] (column1, column2, ... column_n)
*/


ALTER TABLE contacts
	ADD email varchar(40) NOT NULL
		AFTER last_name;


/*Add column

ALTER TABLE table_name
	ADD new_column_name column_definition
		[ FIRST | AFTER column_name ];

--------------------------------------------------

ALTER TABLE contacts
  ADD last_name varchar(40) NOT NULL
    AFTER contact_id;
*/


/*Modify column definition (datatype)

ALTER TABLE table_name
  MODIFY column_name column_definition
    [ FIRST | AFTER column_name ];

-----------------------------------------------

ALTER TABLE contacts
  MODIFY last_name varchar(50) NULL;
*/


/*Drop column

ALTER TABLE table_name
  DROP COLUMN column_name;
*/


ALTER TABLE contacts
	CHANGE COLUMN birthday birth
	DATE NOT NULL;


/*Rename column

ALTER TABLE table_name
  CHANGE COLUMN old_name new_name
    column_definition
    [ FIRST | AFTER column_name ]

---------------------------------------

ALTER TABLE contacts
  CHANGE COLUMN contact_type ctype
    varchar(20) NOT NULL;
*/


/*Rename table

ALTER TABLE table_name
  RENAME TO new_table_name;

------------------------------------

ALTER TABLE contacts
  RENAME TO people;
*/


CREATE TABLE products (
	product_name VARCHAR(50) NOT NULL,
	location VARCHAR(50) NOT NULL,
	category VARCHAR(25),
	CONSTRAINT products_pk PRIMARY KEY (product_name, location)
	);


/*Add Foreign Key

ALTER TABLE contacts
  ADD
[CONSTRAINT [symbol]] FOREIGN KEY
    [index_name] (index_col_name, ...)
    REFERENCES tbl_name (index_col_name,...)
    [ON DELETE reference_option]
    [ON UPDATE reference_option]

--reference_option:
--    RESTRICT | CASCADE | SET NULL | NO ACTION | SET DEFAULT
*/


CREATE TABLE inventory (
	inventory_id INT PRIMARY KEY,
	product_name VARCHAR(50) NOT NULL,
	location VARCHAR(50) NOT NULL,
	quantity INT,
	min_level INT,
	max_level INT
	);

ALTER TABLE inventory ADD
	CONSTRAINT fk_inventory_products
		FOREIGN KEY (product_name, location)
		REFERENCES products (product_name, location);



INSERT INTO test.products
(product_name, location, category)
VALUES('', '', '');

INSERT INTO test.inventory
(inventory_id, product_name, location, quantity, min_level, max_level)
VALUES(42, 'eia', 'alla', 0, 0, 0);

/* DROP TABLE contacts CASCADE;
SELECT * FROM contacts;
*/
