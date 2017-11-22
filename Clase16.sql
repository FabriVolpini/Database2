/*SQL Constraints
------------------
Constraints are the rules enforced on data columns on a table. These are used to limit the type of data that can go into a table. 
This ensures the accuracy and reliability of the data in the database.
Constraints can either be column level or table level. 
Column level constraints are applied only to one column whereas, table level constraints are applied to the entire table.


NOT NULL Constraint − Ensures that a column cannot have NULL value.
By default, a column can hold NULL values. 
If you do not want a column to have a NULL value, then you need to define such a constraint on this column specifying that NULL is now not allowed for that
column.
A NULL is not the same as no data, rather, it represents unknown data.

Example
For example, the following SQL query creates a new table called CUSTOMERS and adds five columns, three of which, are ID NAME and AGE, In this we specify not
to accept NULLs −
*/
CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);
/*
If CUSTOMERS table has already been created, then to add a NOT NULL constraint to the SALARY column, you would write a query like the one that is shown in
the following code block.
*/
ALTER TABLE CUSTOMERS
   MODIFY SALARY  DECIMAL (18, 2) NOT NULL;
/*


DEFAULT Constraint − Provides a default value for a column when none is specified.
The DEFAULT constraint provides a default value to a column when the INSERT INTO statement does not provide a specific value.

Example
For example, the following SQL creates a new table called CUSTOMERS and adds five columns. 
Here, the SALARY column is set to 5000.00 by default, so in case the INSERT INTO statement does not provide a value for this column, then by default this
column would be set to 5000.00.
*/
CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2) DEFAULT 5000.00,       
   PRIMARY KEY (ID)
);
/*
If the CUSTOMERS table has already been created, then to add a DEFAULT constraint to the SALARY column, you would write a query like the one which is
 shown in the code block below.
*/
ALTER TABLE CUSTOMERS
MODIFY SALARY  DECIMAL (18, 2) DEFAULT 5000.00; 
/*

Drop Default Constraint
To drop a DEFAULT constraint, use the following SQL query.

ALTER TABLE CUSTOMERS
   ALTER COLUMN SALARY DROP DEFAULT;



UNIQUE Constraint − Ensures that all values in a column are different.
The UNIQUE Constraint prevents two records from having identical values in a column.
In the CUSTOMERS table, for example, you might want to prevent two or more people from having an identical age.

Example
For example, the following SQL query creates a new table called CUSTOMERS and adds five columns. 
Here, the AGE column is set to UNIQUE, so that you cannot have two records with the same age.
*/
CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL UNIQUE,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);
/*

If the CUSTOMERS table has already been created, then to add a UNIQUE constraint to the AGE column. 
You would write a statement like the query that is given in the code block below.
*/
ALTER TABLE CUSTOMERS
   MODIFY AGE INT NOT NULL UNIQUE;
/*

You can also use the following syntax, which supports naming the constraint in multiple columns as well.

ALTER TABLE CUSTOMERS
   ADD CONSTRAINT myUniqueConstraint UNIQUE(AGE, SALARY);



DROP a UNIQUE Constraint

To drop a UNIQUE constraint, use the following SQL query.

ALTER TABLE CUSTOMERS
   DROP CONSTRAINT myUniqueConstraint;


If you are using MySQL, then you can use the following syntax −

ALTER TABLE CUSTOMERS
   DROP INDEX myUniqueConstraint;



PRIMARY Key − Uniquely identifies each row/record in a database table.

A primary key is a field in a table which uniquely identifies each row/record in a database table. Primary keys must contain unique values. A primary key column cannot have NULL values.

A table can have only one primary key, which may consist of single or multiple fields. When multiple fields are used as a primary key, they are called a composite key.

If a table has a primary key defined on any field(s), then you cannot have two records having the same value of that field(s).

Note − You would use these concepts while creating database tables.


Create Primary Key

Here is the syntax to define the ID attribute as a primary key in a CUSTOMERS table.

CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);


To create a PRIMARY KEY constraint on the "ID" column when the CUSTOMERS table already exists, use the following SQL syntax −

ALTER TABLE CUSTOMER ADD PRIMARY KEY (ID);
NOTE − If you use the ALTER TABLE statement to add a primary key, the primary key column(s) should have already been declared to not contain NULL values (when the table was first created).

For defining a PRIMARY KEY constraint on multiple columns, use the SQL syntax given below.

CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),        
   PRIMARY KEY (ID, NAME)
);


To create a PRIMARY KEY constraint on the "ID" and "NAMES" columns when CUSTOMERS table already exists, use the following SQL syntax.

ALTER TABLE CUSTOMERS 
   ADD CONSTRAINT PK_CUSTID PRIMARY KEY (ID, NAME);



Delete Primary Key

You can clear the primary key constraints from the table with the syntax given below.

ALTER TABLE CUSTOMERS DROP PRIMARY KEY ;



FOREIGN Key − Uniquely identifies a row/record in any of the given database table.

A foreign key is a key used to link two tables together. This is sometimes also called as a referencing key.

A Foreign Key is a column or a combination of columns whose values match a Primary Key in a different table.

The relationship between 2 tables matches the Primary Key in one of the tables with a Foreign Key in the second table.

If a table has a primary key defined on any field(s), then you cannot have two records having the same value of that field(s).


Example

Consider the structure of the following two tables.

CUSTOMERS table

CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);


ORDERS table

CREATE TABLE ORDERS (
   ID          INT        NOT NULL,
   DATE        DATETIME, 
   CUSTOMER_ID INT references CUSTOMERS(ID),
   AMOUNT     double,
   PRIMARY KEY (ID)
);


If the ORDERS table has already been created and the foreign key has not yet been set, the use the syntax for specifying a foreign key by altering a table.

ALTER TABLE ORDERS 
   ADD FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS (ID);



DROP a FOREIGN KEY Constraint

To drop a FOREIGN KEY constraint, use the following SQL syntax.

ALTER TABLE ORDERS
   DROP FOREIGN KEY;



CHECK Constraint − The CHECK constraint ensures that all the values in a column satisfies certain conditions.

-- The CHECK Constraint enables a condition to check the value being entered into a record. If the condition evaluates to false, the record violates the constraint and isn't entered the table.


Example

For example, the following program creates a new table called CUSTOMERS and adds five columns. Here, we add a CHECK with AGE column, so that you cannot have any CUSTOMER who is below 18 years.

CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL CHECK (AGE >= 18),
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);


If the CUSTOMERS table has already been created, then to add a CHECK constraint to AGE column, you would write a statement like the one given below.

ALTER TABLE CUSTOMERS
   MODIFY AGE INT NOT NULL CHECK (AGE >= 18 );


You can also use the following syntax, which supports naming the constraint in multiple columns as well −

ALTER TABLE CUSTOMERS
   ADD CONSTRAINT myCheckConstraint CHECK(AGE >= 18);



DROP a CHECK Constraint

To drop a CHECK constraint, use the following SQL syntax. This syntax does not work with MySQL.

ALTER TABLE CUSTOMERS
   DROP CONSTRAINT myCheckConstraint;









Triggers

A SQL trigger is a set of SQL statements stored in the database catalog. A SQL trigger is executed or fired whenever an event associated with a table occurs e.g., insert, update or delete.

A SQL trigger is a special type of stored procedure. It is special because it is not called directly like a stored procedure. The main difference between a trigger and a stored procedure is that a trigger is called automatically when a data modification event is made against a table whereas a stored procedure must be called explicitly.

It is important to understand SQL trigger’s advantages and disadvantages so that you can use it appropriately. In the following sections, we will discuss the advantages and disadvantages of using SQL triggers.
Advantages of using SQL triggers

    SQL triggers provide an alternative way to check the integrity of data.
    SQL triggers can catch errors in business logic in the database layer.
    SQL triggers provide an alternative way to run scheduled tasks. By using SQL triggers, you don’t have to wait to run the scheduled tasks because the triggers are invoked automatically before or after a change is made to the data in the tables.
    SQL triggers are very useful to audit the changes of data in tables.

Disadvantages of using SQL triggers

    SQL triggers only can provide an extended validation and they cannot replace all the validations. Some simple validations have to be done in the application layer. For example, you can validate user’s inputs in the client side by using JavaScript or in the server side using server-side scripting languages such as JSP, PHP, ASP.NET, Perl, etc.
    SQL triggers are invoked and executed invisible from the client applications, therefore, it is difficult to figure out what happen in the database layer.
    SQL triggers may increase the overhead of the database server.

MySQL triggers

In MySQL, a trigger is a set of SQL statements that is invoked automatically when a change is made to the data on the associated table. A trigger can be defined to be invoked either before or after the data is changed by INSERT, UPDATE or DELETE statement. Before MySQL version 5.7.2, you can to define maximum six triggers for each table.

    BEFORE INSERT – activated before data is inserted into the table.
    AFTER INSERT – activated after data is inserted into the table.
    BEFORE UPDATE – activated before data in the table is updated.
    AFTER UPDATE – activated after data in the table is updated.
    BEFORE DELETE – activated before data is removed from the table.
    AFTER DELETE – activated after data is removed from the table.

However, from MySQL version 5.7.2+, you can define multiple triggers for the same trigger event and action time.

When you use a statement that does not use INSERT, DELETE or UPDATE statement to change data in a table, the triggers associated with the table are not invoked. For example, the TRUNCATE statement removes all data of a table but does not invoke the trigger associated with that table.

There are some statements that use the INSERT statement behind the scenes such as REPLACE statement or LOAD DATA statement. If you use these statements, the corresponding triggers associated with the table are invoked.

You must use a unique name for each trigger associated with a table. However, you can have the same trigger name defined for different tables though it is a good practice.

You should name the triggers using the following naming convention:

(BEFORE | AFTER)_tableName_(INSERT| UPDATE | DELETE)

For example, before_order_update is a trigger invoked before a row in the order table is updated.

The following naming convention is as good as the one above.

tablename_(BEFORE | AFTER)_(INSERT| UPDATE | DELETE)

For example, *order_before_update * is the same as before_update_update trigger above.
MySQL trigger limitations

MySQL triggers cover all features defined in the standard SQL. However, there are some limitations that you should know before using them in your applications.

MySQL triggers cannot:

    Use SHOW, LOAD DATA, LOAD TABLE, BACKUP DATABASE, RESTORE, FLUSH and RETURN statements.
    Use statements that commit or rollback implicitly or explicitly such as COMMIT , ROLLBACK , START TRANSACTION , LOCK/UNLOCK TABLES , ALTER , CREATE , DROP , RENAME , etc.
    Use prepared statements such as PREPARE, EXECUTE, etc.
    Use dynamic SQL statements.

From MySQL version 5.1.4, a trigger can call a stored procedure or stored function, which was a limitation is the previous versions.
MySQL trigger syntax

In order to create a new trigger, you use the CREATE TRIGGER statement. The following illustrates the syntax of the CREATE TRIGGER statement:

CREATE TRIGGER trigger_name trigger_time trigger_event
    ON table_name
    FOR EACH ROW
 BEGIN
 ...
 END;

Let’s examine the syntax above in more detail.

You put the trigger name after the CREATE TRIGGER statement. The trigger name should follow the naming convention [trigger time][table name][trigger event], for example before_employees_update.

Trigger activation time can be BEFORE or AFTER. You must specify the activation time when you define a trigger. You use the BEFORE keyword if you want to process action prior to the change is made on the table and AFTER if you need to process action after the change is made.

The trigger event can be INSERT, UPDATE or DELETE. This event causes the trigger to be invoked. A trigger only can be invoked by one event. To define a trigger that is invoked by multiple events, you have to define multiple triggers, one for each event. A trigger must be associated with a specific table. Without a table trigger would not exist therefore you have to specify the table name after the ON keyword. You place the SQL statements between BEGIN and END block. This is where you define the logic for the trigger.
MySQL trigger example

Let’s start creating a trigger in MySQL to log the changes of the employees table.

CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 

(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),

(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),

(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');

First, create a new table named employees_audit to keep the changes of the employee table. The following statement creates the employee_audit table.

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

Next, create a BEFORE UPDATE trigger that is invoked before a change is made to the employees table.

DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastname = OLD.lastname,
        changedat = NOW(); 
END$$
DELIMITER ;

Inside the body of the trigger, we used the OLD keyword to access employeeNumber and lastname column of the row affected by the trigger.

Notice that in a trigger defined for INSERT, you can use NEW keyword only. You cannot use the OLD keyword. However, in the trigger defined for DELETE, there is no new row so you can use the OLD keyword only. In the UPDATE trigger, OLD refers to the row before it is updated and NEW refers to the row after it is updated.

After that, update the employees table to check whether the trigger is invoked.

UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;

Finally, to check if the trigger was invoked by the UPDATE statement, you can query the employees_audit table using the following query:

SELECT 
    *
FROM
    employees_audit;

it should show data that reflects the trigger was actually invoked.








CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);



DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastname = OLD.lastname,
        changedat = NOW()
END$$
DELIMITER ;


UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;


-- 1
/*
 * Insert a new employee to , but with an null email. Explain what happens. 
 */
    

-- El campo email no puede ser nulo y no realiza el insert
 
    
    
-- 2
/*
 * Run the first the query 

  UPDATE employees SET employeeNumber = employeeNumber - 20


What did happen? Explain.Then run this other

  UPDATE employees SET employeeNumber = employeeNumber + 20
 */
    


-- Actualiza la tabla employees y le suma 20 al employeedNumber de cada empleado. 

-- Tira un error diciendo que hay un atributo primario que esta duplicado 
 
    
    
    
    
-- 3
/*
 *  Add a age column to the table employee where and it can only accept values from 16 up to 70 years old
 */
    
ALTER TABLE employees ADD AGE INT;
ALTER TABLE employees
ADD CONSTRAINT myCheckConstraint CHECK(AGE >= 18 AND AGE <=70);

    

    
    
-- 4
/*
 * Describe the referential integrity between tables film, actor and film_actor in sakila db.
 */
-- 5
/*
 * Create a new column called lastUpdate to table employee and use trigger(s) to keep the date-time
 *  updated on inserts and updates operations. Bonus: add a column lastUpdateUser and the respective
 *  trigger(s) to specify who was the last MySQL user that changed the row (assume multiple users,
 *  other than root, can connect to MySQL and change this table).
 */
    


ALTER TABLE employees ADD lastUpdate DATETIME DEFAULT NULL;

DELIMITER $$
CREATE TRIGGER employee_lastUpdate 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastUpdate = NOW(); 
END$$
DELIMITER ;
    
    
    
-- 6
/*
* Find all the triggers in sakila db related to loading film_text table.
*  What do they do? Explain each of them using its source code for the explanation.
*/

-- ins_film inserta un nuevo film_text
-- upd_film hace un update a un film_text ya existente
-- del_film elimina un el film_text

    