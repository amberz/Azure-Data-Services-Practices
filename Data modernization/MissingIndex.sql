Select  OBJECT_SCHEMA_NAME(mid.object_id,mid.database_id) AS Schema_Name,
    db_name(mid.database_id) As Database_Name,
    Object_name(mid.object_id,mid.database_id) As Object_Name,
    migs.avg_user_impact, mid.equality_columns,
    mid.inequality_columns, 
    mid.included_columns
From sys.dm_db_missing_index_groups mig
Inner join sys.dm_db_missing_index_group_stats migs 
    on mig.index_group_handle =  migs.group_handle
Inner join sys.dm_db_missing_index_details mid
    on mig.index_handle = mid.index_handle