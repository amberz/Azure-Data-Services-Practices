--create 1st database on on-prem
create database Orders 

--create [OrderInformation] table in 1st database customers for elastic query
use Orders
go
CREATE TABLE [dbo].[OrderInformation](
    [OrderID] [int] NOT NULL,
    [CustomerID] [int] NOT NULL
    )
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (123, 1)
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (149, 2)
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (857, 2)
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (321, 1)
INSERT INTO [dbo].[OrderInformation] ([OrderID], [CustomerID]) VALUES (564, 8)

select * from [OrderInformation]

--create 2nd database on Azure SQL DB
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

select * from [CustomerInformation]


--NOTE CONNECT TO ORDERS database on on-prem

--Create linked server
--https://www.mssqltips.com/sqlservertip/6224/create-a-sql-server-linked-server-to-azure-sql-database/
--Data Source: Azure SQL DB Server name
-- Catalog: Azure SQL DB name

--cross database to query external tables
SELECT OrderInformation.CustomerID, OrderInformation.OrderId, cxinfo.CustomerName, cxinfo.Company
FROM [Orders].dbo.OrderInformation
INNER JOIN [MYSQLDB].[Customers].[dbo].CustomerInformation as cxinfo
ON cxinfo.CustomerID = OrderInformation.CustomerID
