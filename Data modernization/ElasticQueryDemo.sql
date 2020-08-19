--create 1st database
create database Orders 

--create [OrderInformation] table in 1st database customers for elastic query
CREATE TABLE [dbo].[OrderInformation](
    [OrderID] [int] NOT NULL,
    [CustomerID] [int] NOT NULL
    )
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (123, 1)
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (149, 2)
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (857, 2)
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (321, 1)
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (564, 8)

--create 2nd database
create database Customers

--create [CustomerInformation] table in 2nd database customers for elastic query
CREATE TABLE [dbo].[CustomerInformation](
    [CustomerID] [int] NOT NULL,
    [CustomerName] [varchar](50) NULL,
    [Company] [varchar](50) NULL
    CONSTRAINT [CustID] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
)
INSERT INTO [dbo].[CustomerInformation] ([CustomerID], [CustomerName], [Company]) VALUES (1, 'Jack', 'ABC')
INSERT INTO [dbo].[CustomerInformation] ([CustomerID], [CustomerName], [Company]) VALUES (2, 'Steve', 'XYZ')
INSERT INTO [dbo].[CustomerInformation] ([CustomerID], [CustomerName], [Company]) VALUES (3, 'Lylla', 'MNO')

--NOTE CONNECT TO ORDERS database

-- query existing database master key and credential
select * from sys.symmetric_keys
select * from sys.database_scoped_credentials
-- if existing, drop
--drop master key 
--drop DATABASE SCOPED CREDENTIAL ElasticDBQueryCred1

--The "username" and "password" should be the username and password used to log in into the Customers database. 
--Authentication using Azure Active Directory with elastic queries is not currently supported.
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '*****';
CREATE DATABASE SCOPED CREDENTIAL ElasticDBQueryCred
WITH IDENTITY = 'Amber',
SECRET = '*****';

-- create external data source
CREATE EXTERNAL DATA SOURCE MyElasticDBQueryDataSrc WITH
    (TYPE = RDBMS,
    LOCATION = 'sqlserver0114.database.windows.net',
    DATABASE_NAME = 'Customers',
    CREDENTIAL = ElasticDBQueryCred,
) ;

--create external table for elastic query
CREATE EXTERNAL TABLE [dbo].[CustomerInformation]
( [CustomerID] [int] NOT NULL,
    [CustomerName] [varchar](50) NOT NULL,
    [Company] [varchar](50) NOT NULL)
WITH
( DATA_SOURCE = MyElasticDBQueryDataSrc)

--cross database to query external tables
SELECT OrderInformation.CustomerID, OrderInformation.OrderId, CustomerInformation.CustomerName, CustomerInformation.Company
FROM OrderInformation
INNER JOIN CustomerInformation
ON CustomerInformation.CustomerID = OrderInformation.CustomerID

--MS docs
--https://docs.microsoft.com/en-us/azure/azure-sql/database/elastic-query-getting-started-vertical