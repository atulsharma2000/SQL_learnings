DROP PROCEDURE if exists sp_evensum;

DELIMITER $$
CREATE PROCEDURE sp_evensum(IN p_low int, IN p_high int)
BEGIN
    DECLARE sum int;
    set sum=0;

    while p_high >= p_low DO
    if(p_low % 2 = 0) then
        set sum = sum + p_low;
    end if;
    set p_low = p_low + 1;
    
    END WHILE;

    SELECT sum;
    insert into result values(1000,sum);
END;
$$
DELIMITER ;