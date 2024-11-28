DROP table if exists transactions;

Create table transactions (accid INT, txdate DATETIME, amount DOUBLE);

INSERT INTO transactions VALUES
(1,'2000-01-01',1000),
(1,'2000-01-02',2000),
(1,'2000-01-03',-500),
(1,'2000-01-04',-300),
(1,'2000-01-05',4000),
(1,'2000-01-06',-2000),
(1,'2000-01-07',-200),
(2,'2000-01-02',3000),
(2,'2000-01-04',2000),
(2,'2000-01-06',-1000),
(3,'2000-01-01',2000),
(3,'2000-01-03',-1000),
(3,'2000-01-05',500);

select * from transactions;