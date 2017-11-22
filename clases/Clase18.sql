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