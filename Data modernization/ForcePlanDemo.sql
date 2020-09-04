--Plan regression happens when the SQL Server Query Optimizer compiles a new Execution Plan for a query that performs (much) worse than the previous Execution Plan for that same query.

-- Query 1 in connection 1
DBCC FREEPROCCACHE
EXEC sp_executesql
@stmt = N'SELECT
  p.name,
  tha.TransactionDate,
  tha.TransactionType,
  tha.Quantity,
  tha.ActualCost
FROM Production.TransactionHistoryArchive tha
JOIN Production.Product p
ON tha.ProductID = p.ProductID
WHERE p.ProductID = @productID', 
@params = N'@productID INT',
@productID = 461

-- Query 2 in connection 2
DBCC FREEPROCCACHE
EXEC sp_executesql
@stmt = N'SELECT
  p.name,
  tha.TransactionDate,
  tha.TransactionType,
  tha.Quantity,
  tha.ActualCost
FROM Production.TransactionHistoryArchive tha
JOIN Production.Product p
ON tha.ProductID = p.ProductID
WHERE p.ProductID = @productID', 
@params = N'@productID INT',
@productID = 712 


-- get XML plan
SET SHOWPLAN_XML ON
DBCC FREEPROCCACHE
EXEC sp_executesql
@stmt = N'SELECT
  p.name,
  tha.TransactionDate,
  tha.TransactionType,
  tha.Quantity,
  tha.ActualCost
FROM Production.TransactionHistoryArchive tha
JOIN Production.Product p
ON tha.ProductID = p.ProductID
WHERE p.ProductID = @productID', 
@params = N'@productID INT',
@productID = 461

SET SHOWPLAN_XML OFF
--select * from sys.dm_exec_text_query_plan


--created forceplan SP
EXEC sp_create_plan_guide
@name = N'ForcePlan',
@stmt = N'SELECT
 p.name,
 tha.TransactionDate,
 tha.TransactionType,
 tha.Quantity,
 tha.ActualCost
FROM Production.TransactionHistoryArchive tha
JOIN Production.Product p
ON tha.ProductID = p.ProductID
WHERE p.ProductID = @productID', 
@type = N'SQL',
@module_or_batch = NULL,
@params = N'@productID INT',
@hints = '<ShowPlanXML xmlns="http://schemas.microsoft.com/sqlserver/2004/07/showplan" Version="1.547" Build="15.0.2000.1929"><BatchSequence><Batch><Statements><StmtSimple StatementText="DBCC FREEPROCCACHE" StatementId="1" StatementCompId="1" StatementType="DBCC" RetrievedFromCache="false"></StmtSimple><StmtSimple StatementText="&#xd;&#xa;EXEC sp_executesql&#xd;&#xa;@stmt = N&apos;SELECT&#xd;&#xa;  p.name,&#xd;&#xa;  tha.TransactionDate,&#xd;&#xa;  tha.TransactionType,&#xd;&#xa;  tha.Quantity,&#xd;&#xa;  tha.ActualCost&#xd;&#xa;FROM Production.TransactionHistoryArchive tha&#xd;&#xa;JOIN Production.Product p&#xd;&#xa;ON tha.ProductID = p.ProductID&#xd;&#xa;WHERE p.ProductID = @productID&apos;, &#xd;&#xa;@params = N&apos;@productID INT&apos;,&#xd;&#xa;@productID = 461" StatementId="2" StatementCompId="2" StatementType="EXECUTE PROC" RetrievedFromCache="false"></StmtSimple></Statements></Batch></BatchSequence></ShowPlanXML>'