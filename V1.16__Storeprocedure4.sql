
-- 1. start a new transaction
START TRANSACTION;

CREATE PROCEDURE SampleCICD123.join_cust_custbackup() 
SELECT * FROM SampleCICD123.customers c inner join SampleCICD123.customers_backup cb
on c.ID=cb.ID;


DELIMITER //
CREATE PROCEDURE SampleCICD123.join_cust_groupbyname(IN cname VARCHAR(255))
 BEGIN
 SELECT * 
 FROM SampleCICD123.customers
 WHERE name = cname;
 END //
DELIMITER ;
-- call store procedure
call SampleCICD123.join_cust_custbackup();

call SampleCICD123.join_cust_groupbyname('Ramesh');
-- rollback 
COMMIT;


