/*********************************
Returns Table Column Descriptions
*********************************/
Select 
   s.[name] AS SchemaName
  ,t.[name] AS TableName
  ,c.[name] AS ColumnName
  ,d.[value] AS Desription
From sys.schemas AS s
Inner Join sys.sysobjects AS t /* Tables*/
   On t.[uid] = s.[schema_id]
Inner Join sys.syscolumns AS c
   On c.id = t.id
Inner Join sys.extended_properties AS d /*Column Description*/
   On d.major_id = t.id
  And d.minor_id = c.colid
Where d.[name] = 'MS_Description'