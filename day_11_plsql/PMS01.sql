DROP TRIGGER if exists update_balance;
DELIMITER $$

CREATE TRIGGER update_balance
AFTER INSERT on transactions
FOR EACH ROW

BEGIN
    IF NEW.tx_type = 'Deposit' then
        UPDATE accounts SET balance = balance + NEW.amount where accno = NEW.accno;
    ELSE
        update accounts SET balance = balance - NEW.amount where accno = NEW.accno;
    END IF;
END;
$$
DELIMITER ;