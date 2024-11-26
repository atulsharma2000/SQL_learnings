DROP PROCEDURE if exists sp_rectanglearea;
DELIMITER $$
CREATE PROCEDURE sp_rectanglearea(p_length INT,  IN p_breadth INT)  
                -- IN means user will input the value
BEGIN
    DECLARE area double;
    DECLARE msg varchar(20);
    SET area = p_length*p_breadth;
    SELECT p_length,p_breadth,area;
    SELECT concat(p_length,",",p_breadth) into msg;

    insert into result values(area,msg);
END;
$$
DELIMITER ;


-- source
-- call sp_rectanglearea(5,3);
