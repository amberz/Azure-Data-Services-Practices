-- get query_hash
SELECT Txt.query_text_id, Txt.query_sql_text, Pl.plan_id, Qry.*  
FROM sys.query_store_plan AS Pl  
JOIN sys.query_store_query AS Qry  
    ON Pl.query_id = Qry.query_id  
JOIN sys.query_store_query_text AS Txt  
    ON Qry.query_text_id = Txt.query_text_id 
and is_clouddb_internal_query=0
order by last_execution_time desc;

-- using query_hash to get plan_handle
select * from sys.dm_exec_query_stats
where query_hash =0xD4FA47AE35195F89

--using query_hash to get T-SQL text
-- pass sql_handle to sys.dm_exec_sql_text
SELECT * FROM sys.dm_exec_sql_text(0x06000800A8859C279022009C2D02000001000000000000000000000000000000000000000000000000000000) -- modify this value with your actual sql_handle

--get query id and plan id to force plan 
--sp_query_store_force_plan [ @query_id = ] query_id , [ @plan_id = ] plan_id [;]  
EXEC sp_query_store_force_plan 885, 81

select * from sys.dm_exec_query_stats
where query_hash = query_plan_hash AND query_hash =0xCEE1AD014CCD4D8D