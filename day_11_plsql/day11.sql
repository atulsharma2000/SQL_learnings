CREATE table accounts(
    accno INT PRIMARY KEY,
    balance DOUBLE,
    acc_type varchar(10)
);


INSERT INTO accounts values(1001,7000,"Savings");
INSERT INTO accounts values(1002,14000,"Current");
INSERT INTO accounts values(1003,21000,"Savings");
INSERT INTO accounts values(1004,28000,"Current");



CREATE TABLE transactions(
    txid INT PRIMARY KEY AUTO_INCREMENT,
    accno INT,
    amount DOUBLE,
    tx_type char(10)
);  

-- =========================================================




CREATE TABLE transactions(
    txid INT PRIMARY KEY AUTO_INCREMENT,
    accno INT,
    amount DOUBLE,
    tx_type char(10),
    status char(10)
);  

