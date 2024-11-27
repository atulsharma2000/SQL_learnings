    DROP TRIGGER if exists update_balance;

    DELIMITER $$
    CREATE TRIGGER update_balance
    BEFORE INSERT on transactions
    FOR EACH ROW

    BEGIN
        DECLARE curr_bal DOUBLE;

        IF new.tx_type = 'Deposit' then
            update accounts SET balance = balance + NEW.amount where accno = NEW.accno;
            SET NEW.status = "Success";
        ELSE
            Select balance into curr_bal from accounts where accno = NEW.accno;
            IF curr_bal > NEW.amount  then
                update accounts SET balance = balance - NEW.amount where accno = NEW.accno;
                SET NEW.status = "Success";
            ELSE
                SET NEW.status  = 'Fails';
            END IF;
        END if;

    END;
    $$
    DELIMITER ;