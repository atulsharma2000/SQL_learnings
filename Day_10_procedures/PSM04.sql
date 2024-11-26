DROP PROCEDURE if exists sp_circlearea2;

DELIMITER $$
CREATE PROCEDURE sp_circlearea2()
BEGIN

    DECLARE radius INT DEFAULT 7;     
    DECLARE Area DOUBLE;
    DECLARE msg VARCHAR(50);

    SET Area = radius*radius*3.14;
    -- SET msg = concat("Area of Circle = ",area);
    Select concat("Area of Circle = ",area) into msg;

    Insert into result values(radius,msg);

END;
$$
DELIMITER ;