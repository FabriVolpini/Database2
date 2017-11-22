/*
 * MySQL Stored Function

A stored function is a special kind stored program that returns a single value. You use stored functions to encapsulate common formulas or business rules that are reusable among SQL statements or stored programs.

Different from a stored procedure, you can use a stored function in SQL statements wherever an expression is used. This helps improve the readability and maintainability of the procedural code.


MySQL stored function syntax

The following illustrates the simplest syntax for creating a new stored function:

CREATE FUNCTION function_name(param1,param2,…)
    RETURNS datatype
   [NOT] DETERMINISTIC
 statements


First, you specify the name of the stored function after  CREATE FUNCTION  clause.

Second, you list all parameters of the stored function inside the parentheses. By default, all parameters are IN parameters. You cannot specify IN , OUT or INOUT modifiers to the parameters.

Third, you must specify the data type of the return value in the RETURNS statement. It can be any valid MySQL data types.

Fourth, for the same input parameters, if the stored function returns the same result, it is considered deterministic and otherwise the stored function is not deterministic. You have to decide whether a stored function is deterministic or not. If you declare it incorrectly, the stored function may produce an unexpected result, or the available optimization is not used which degrades the performance.

Fifth, you write the code in the body of the stored function. It can be a single statement or a compound statement. Inside the body section, you have to specify at least one RETURN statement. The RETURN statement returns a value to the caller. Whenever the RETURN statement is reached, the stored function’s execution is terminated immediately.


MySQL stored function example

Let’s take a look at an example of using stored function. We will use the customers table in the sample database for the demonstration.

The following example is a function that returns the level of a customer based on credit limit. We use the IF statement to decide the credit limit.

DELIMITER $$

CREATE FUNCTION CustomerLevel(p_creditLimit double) RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
    DECLARE lvl varchar(10);

    IF p_creditLimit > 50000 THEN
    SET lvl = 'PLATINUM';
    ELSEIF (p_creditLimit <= 50000 AND p_creditLimit >= 10000) THEN
        SET lvl = 'GOLD';
    ELSEIF p_creditLimit < 10000 THEN
        SET lvl = 'SILVER';
    END IF;

    RETURN (lvl);
END


Now, we can call the CustomerLevel() in an SQL SELECT statement as follows:

SELECT 
    customerName, CustomerLevel(creditLimit)
FROM
    customers
ORDER BY customerName;


We also rewrite the  GetCustomerLevel() stored procedure that we developed in the MySQL IF statement tutorial as follows:

DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  p_customerNumber INT(11),
    OUT p_customerLevel  varchar(10)
)
BEGIN
    DECLARE creditlim DOUBLE;

    SELECT creditlimit INTO creditlim
    FROM customers
    WHERE customerNumber = p_customerNumber;

    SELECT CUSTOMERLEVEL(creditlim) 
    INTO p_customerLevel;

END


As you can see, the  GetCustomerLevel() stored procedure is much more readable when using the  CustomerLevel() stored function.

Notice that a stored function returns a single value only. If you include a SELECT statement without the INTO clause, you will get an error.

In addition, if a stored function contains SQL statements, you should not use it inside other SQL statements; otherwise, the stored function will slow down the speed of the query.
 */


CALL GetOfficeByCountry('USA');

CALL CountOrderByStatus('Shipped',@total);
SELECT @total;

CALL CountOrderByStatus('in process',@total);
SELECT @total AS  total_in_process;



CALL get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed);

SELECT @shipped,@canceled,@resolved,@disputed;

SET @email_list = "";
CALL build_email_list(@email_list);
SELECT @email_list;


SET @customerNo = 112;

SELECT country into @country
FROM customers
WHERE customernumber = @customerNo;

CALL GetCustomerShipping(@customerNo,@shipping);

SELECT @customerNo AS Customer,
       @country    AS Country,
       @shipping   AS Shipping;
       
------------------------------------------------------------------------------

-- 1
	/* Write a function that returns the amount of copies of a film in sakila-db.
	 * Pass either the film id or the film name.
	 */

SELECT 

-- 2
	/* Write a stored procedure that returns a list of customer first and last names separated by ";",
	 *	that live in a certain country. You pass the country it gives you the list of people living there.
	 */

-- 3
	/* Review the function inventory_in_stock *and the procedure *film_in_stock explain the code,
	 *	write usage examples.
	 */