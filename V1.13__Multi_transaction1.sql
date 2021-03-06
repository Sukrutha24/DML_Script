-- 1. start a new transaction
START TRANSACTION;
 
-- 2. create DB
CREATE DATABASE SampleCICD123;

-- 3 .Cretete table

 CREATE TABLE SampleCICD123.CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);
 
-- 3. insert a new order for customer 145
INSERT INTO SampleCICD123.CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );

INSERT INTO SampleCICD123.CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );

INSERT INTO SampleCICD123.CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );

INSERT INTO SampleCICD123.CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 );

INSERT INTO SampleCICD123.CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );

INSERT INTO SampleCICD123.CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'Komal', 22, 'MP', 4500.00 );
 -- crete backup table 
create table SampleCICD123.CUSTOMERS_backup like SampleCICD123.CUSTOMERS;
  -- insert data from backup table from existing table
insert into SampleCICD123.CUSTOMERS_backup select * from SampleCICD123.CUSTOMERS;
 --  delete data from old table records
DELETE FROM SampleCICD123.CUSTOMERS WHERE ID = 6;
  -- update existing table records
UPDATE SampleCICD123.CUSTOMERS SET ADDRESS = 'Pune' WHERE ID = 5;
      -- 5. commit changes   
-- rollback 
COMMIT;
