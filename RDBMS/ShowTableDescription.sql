SELECT 
    OBJECT_SCHEMA_NAME(t.object_id) as SchemaName, 
    t.name AS TableName, 
    ex.value AS Description 
FROM 
    sys.tables AS t,
    sys.extended_properties AS ex 
WHERE 
    ex.major_id = t.object_id 
    AND ex.minor_id = 0 
    AND ex.name = 'MS_Description' 
    AND ex.value IS NOT NULL