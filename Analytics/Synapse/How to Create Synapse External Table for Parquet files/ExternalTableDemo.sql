--Create Master Key on Azure Synapse

CREATE MASTER KEY

-- Create Azure storage credential
CREATE DATABASE SCOPED CREDENTIAL ADLSGen2Cred
WITH IDENTITY = 'myadlsgen20306', 
Secret = '*****************';
GO

-- Query storage crediential
select * from sys.database_scoped_credentials 

--Create External Data Source
CREATE EXTERNAL DATA SOURCE ADLSGen2ExternalDataSource
WITH (
    TYPE = HADOOP,
    LOCATION='abfss://adfcontainer@myadlsgen20306.dfs.core.windows.net', -- Please note the abfss endpoint for when your account has secure transfer enabled
    CREDENTIAL = ADLSGen2Cred
);

--Create External Parquet File format
CREATE EXTERNAL FILE FORMAT MyParquetformat
WITH (  
    FORMAT_TYPE = PARQUET  
     );  

--Create External Table
CREATE EXTERNAL TABLE [ExternaltblParquet1](
   col1 VARCHAR(1000), 
   val1 VARCHAR(1000)
)
WITH
(
    LOCATION='/MyParquettest.parquet'
,   DATA_SOURCE = ADLSGen2ExternalDataSource
,   FILE_FORMAT = MyParquetformat
)

--Query Parquet flat file
select * from [ExternaltblParquet1] 

