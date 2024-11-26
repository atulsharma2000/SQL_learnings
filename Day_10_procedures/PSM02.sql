DROP PROCEDURE if exists sp_hello2;

DELIMITER $$

CREATE PROCEDURE sp_hello2()
BEGIN

insert into result values(1,'Hello world');

END;
$$
DELIMITER ;