/*Written by Amber Zhao on Aug 4, 2020*/


/*create sample data, table, view, stored procedure, functions*/
/*create database*/
create database mysqldb;
create database mysqldb2

/*create table*/
use mysqldb;
CREATE TABLE tbl_name (col1 int,col2 int);
INSERT INTO tbl_name (col1,col2) VALUES(30,15);

/*create view*/
CREATE VIEW Myviewtest AS SELECT * FROM tbl_name;

/*create stored procedure*/
DELIMITER //

CREATE PROCEDURE GetMytbloutput()
BEGIN
	SELECT * FROM tbl_name;
END //

DELIMITER ;

CALL GetMytbloutput();

/*create functions*/
DELIMITER $$

CREATE FUNCTION MyTestFunction()
RETURNS datatype
SELECT * FROM tbl_name;
BEGIN
END $$

DELIMITER ;


CREATE FUNCTION hello (s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello, ',s,'!');


SELECT
  TABLE_NAME AS `Table`,
  ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024) AS `Size (MB)`
FROM
  information_schema.TABLES
WHERE Table_schema !="mysql"
ORDER BY
  (DATA_LENGTH + INDEX_LENGTH)
DESC;



