DROP PROCEDURE if exists sp_evenodd;

DELIMITER $$
CREATE PROCEDURE sp_evenodd(IN p_num INT)
BEGIN
    IF p_num % 2 = 0 THEN
        SELECT "its a EVEN Number" as msg;
        insert into result values(p_num,"is even");
    ELSE
        SELECT "its a ODD Number" as msg;
        insert into result values(p_num,"is odd");
    END IF;
END;
$$
DELIMITER ;