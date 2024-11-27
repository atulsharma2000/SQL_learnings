DROP FUNCTION if exists Title;
DELIMITER $$
CREATE FUNCTION Title(p_ename VARCHAR(40))
RETURN VARCHAR(40)
DETERMINISTIC
BEGIN
    DECLARE ch1 CHAR(1);
    DECLARE ch2 char(40);
    DECLARE result VARCHAR(44);

    SET ch1 = upper(left(p_ename,1));
    SET ch2 = lower(SUBSTRING(p_ename,2));
    SET result = CONCAT(ch1,ch2);
    RETURN result;

END;
$$
DELIMITER ;

