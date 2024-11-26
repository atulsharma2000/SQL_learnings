DROP PROCEDURE if exists sp_table;

DELIMITER $$
CREATE PROCEDURE sp_table(IN num int)
BEGIN
    DECLARE i int DEFAULT 1;

    truncate table num_table;

    -- while i<=10 do
    -- insert into num_table values((i*num),concat(num," * ",i));
    -- set i = i+1;    
    -- end while;
    
    repeat
    insert into num_table values((i*num),concat(num," * ",i));
    set i = i+1;
    UNTIL i > 10        -- true hote hi fail hoga
    end repeat;

    select * from num_table;
END;
$$
DELIMITER ;