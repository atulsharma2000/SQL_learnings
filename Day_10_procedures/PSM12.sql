DROP PROCEDURE if exists sp_empCategory;

DELIMITER $$
CREATE PROCEDURE sp_empCategory(IN p_empno int)

BEGIN
    DECLARE salary DECIMAL(8,2);
    DECLARE category varchar(20);

    Select sal into salary from emp where empno = p_empno;

    -- if (salary<1500) then
    -- select "POOR" as Status;
    -- end if;
    -- if (salary >= 1500 and salary <=2500) then
    -- select "Middle" as Satus;
    -- end if;
    -- if (salary > 2500) then
    -- select "Rich" as Status;
    -- end if;

    CASE
        when (salary<1500) then set category = "POOR";
        when (salary >= 1500 and salary <=2500) then set category = "MIDDLE";
        ELSE set category = "RICK";
    END CASE;

    Select concat ("The Employee belongs to category - ",category) as msg;

END;

$$
DELIMITER ;