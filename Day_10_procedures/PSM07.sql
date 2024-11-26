drop PROCEDURE if exists sp_square2;

DELIMITER $$

CREATE PROCEDURE sp_square2(INOUT p_val INT)
BEGIN
    SET p_val = p_val * p_val;
END;
$$
DELIMITER ;