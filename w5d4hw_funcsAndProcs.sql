-- function practice:
-- return the number of user-input rated films
-- holy shit I spent an hour trying to make this work...
-- all because rating isn't varchar type and I didn't 
-- realize that was the problem. 
-- good lord. this should have taken 30 seconds.
-- welp, now I know.
CREATE OR REPLACE FUNCTION count_rated_films(
	this_rating mpaa_rating
)
RETURNS integer AS 
$$
BEGIN 
RETURN count(rating) FROM film WHERE rating = this_rating;
END;
$$
LANGUAGE plpgsql;

SELECT count_rated_films('PG');

-- Procedure practice
-- procedure to update address for a given address id
CREATE OR REPLACE PROCEDURE update_address(
	this_address_id int,
	new_address varchar(50)
)
AS 
$$
BEGIN 
	UPDATE address 
	SET address = new_address
	WHERE address_id = this_address_id;
	COMMIT;
END;
$$
LANGUAGE plpgsql;

CALL update_address(8, '4523 Baloney Street');