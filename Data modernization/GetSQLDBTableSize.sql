--get SQL DB table size

SELECT 
    t.NAME AS TableName,
    s.Name AS SchemaName,
    p.rows,
    SUM(a.total_pages) * 8 AS TotalSpaceKB, 
    CAST(ROUND(((SUM(a.total_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS TotalSpaceMB,
    SUM(a.used_pages) * 8 AS UsedSpaceKB, 
    CAST(ROUND(((SUM(a.used_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB, 
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB,
    CAST(ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS UnusedSpaceMB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
GROUP BY 
    t.Name, s.Name, p.Rows
ORDER BY 
    TotalSpaceMB DESC, t.Name

-- get temp table size
SELECT TBL.name AS ObjName 
      ,STAT.row_count AS StatRowCount 
      ,STAT.used_page_count * 8 AS UsedSizeKB 
      ,STAT.reserved_page_count * 8 AS RevervedSizeKB 
FROM tempdb.sys.partitions AS PART 
     INNER JOIN tempdb.sys.dm_db_partition_stats AS STAT 
         ON PART.partition_id = STAT.partition_id 
            AND PART.partition_number = STAT.partition_number 
     INNER JOIN tempdb.sys.tables AS TBL 
         ON STAT.object_id = TBL.object_id 
ORDER BY TBL.name;

