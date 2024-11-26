DROP PROCEDURE if exists sp_circlearea;

DELIMITER $$
CREATE PROCEDURE sp_circlearea()
BEGIN

    DECLARE radius INT DEFAULT 7;
    select radius,radius*radius*3.14 as Area;


END;
$$
DELIMITER ;