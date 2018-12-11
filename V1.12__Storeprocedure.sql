
-- 1. start a new transaction
START TRANSACTION;

CREATE PROCEDURE SampleCICDDB.join_cust_custbackup() 
SELECT * FROM SampleCICDDB.customers c inner join SampleCICDDB.customers_backup cb
on c.ID=cb.ID;


DELIMITER //
CREATE PROCEDURE SampleCICDDB.join_cust_groupbyname(IN cname VARCHAR(255))
 BEGIN
 SELECT * 
 FROM SampleCICDDB.customers
 WHERE name = cname;
 END //
DELIMITER ;
-- call store procedure
call SampleCICDDB.join_cust_custbackup();

call SampleCICDDB.join_cust_groupbyname('Ramesh');
-- rollback 
COMMIT;


