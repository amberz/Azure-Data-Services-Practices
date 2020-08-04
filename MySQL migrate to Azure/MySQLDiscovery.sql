/*Written by Amber Zhao on Aug 4, 2020*/

/*print MySQL */
SHOW VARIABLES LIKE '%version%';

/*Print MySQL hostname*/
SELECT @@hostname hostname;

/*Print numbers of MySQL table and view */
SELECT 
     table_schema as `Database`, 
     TABLE_TYPE , 
     COUNT(TABLE_TYPE)
FROM information_schema.TABLES 
WHERE Table_schema NOT IN ('mysql', 'sys', 'information_schema', 'performance_schema')
GROUP BY table_schema, TABLE_TYPE;
/*Print name and size of MySQL tables & Views*/
SELECT 
     table_schema as `Database`, 
     table_name AS `Table`, 
     TABLE_TYPE , 
     round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
WHERE Table_schema !="mysql" and Table_schema !="sys" and Table_schema !="information_schema" and Table_schema !="performance_schema"
ORDER BY (data_length + index_length) DESC;


/*Print numbers of MySQL stored procedure and function*/
SELECT 
     ROUTINE_SCHEMA as `Database`, 
     ROUTINE_TYPE, 
     COUNT(ROUTINE_TYPE)
FROM information_schema.routines 
WHERE  ROUTINE_TYPE  IN ('PROCEDURE','FUNCTION')
GROUP BY  ROUTINE_SCHEMA , ROUTINE_TYPE;
/*Print name of MySQL stored procedures and functions*/
SELECT 
    ROUTINE_SCHEMA as `Database`, 
    routine_name,
    ROUTINE_TYPE 
FROM
    information_schema.routines
WHERE
    routine_type in ('PROCEDURE','FUNCTION') and ROUTINE_SCHEMA !='sys';


    