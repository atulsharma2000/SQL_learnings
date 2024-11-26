DROP PROCEDURE if exists sp_square;
DELIMITER $$
CREATE PROCEDURE sp_square(IN p_no INT,OUT p_res INT)
BEGIN
    SET p_res = p_no * p_no;
END;
$$
DELIMITER ;


-- in second parameter we have to pass sql parameter
-- call sp_square()