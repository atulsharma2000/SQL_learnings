DROP PROCEDURE IF EXISTS sp_hello;

DELIMITER $$
CREATE PROCEDURE sp_hello()
BEGIN       -- these are the curly brackets in sql

    SELECT "HELLO WORLD i am awesome" as msg;

END;
$$
DELIMITER ;