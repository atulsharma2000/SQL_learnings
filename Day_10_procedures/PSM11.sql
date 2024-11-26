DROP PROCEDURE if exists sp_isPrime;
DELIMITER $$
CREATE PROCEDURE sp_isPrime(IN val int)

BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE status char(15);

    label_prime: LOOP
        
        if val=1 then
            set status = "NOT PRIME";
            LEAVE label_prime;
        end if;

        IF val = i then
            set status = "PRIME";
            LEAVE label_prime;
        end if;

        if (val % i = 0) then
            set status = "NOT PRIME";
            LEAVE label_prime;
        end if;

        set i = i+1;

    END LOOP;
   
    select status;

END;
$$
DELIMITER ;