# Oracle Database to Azure SQL Database/Managed Instance scenario

## Migration Process

The migration will includes existing Oracla Database environment assessment, Oracle schema and objects conversion to SQL, and data migration.

Refer below migration process:
<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Images/OratoSQLMigrationProcess.png" />&nbsp;

## Assessment

Oracle_PreSSMA Script( provided by Data Migration Jumpstart Team) can run on Oracle Database to evalute how many tables, stored procedures, views, packages etc, it will give a assessment if the existing Oracle Database is very complex. 

The assessment principles as below table:
<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Images/AssessmentTable.png" />&nbsp;

Download the [Assessment Calculator Template](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/Customer%20Assessment%20CalculatorTemplate2.xlsx) and run [Oracle PL\SQL](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/Oracle_PreSSMA_Pre_v12.sql) in existing Oracle database. 

For more information, see [Assessment guidance](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/OraclePre-SSMA%20Query%20Guidance.pptx)


## Objects Conversion Principles
Below table describes how SSMA tool convert Oracle objects to SQL objects. 
https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Images/SchemaConversionPrinciples.pdf

For more information, see [Schema conversion](https://docs.microsoft.com/en-us/sql/ssma/mysql/converting-mysql-databases-mysqltosql?view=sql-server-ver15)


## Oracle Objects conversion and Data migration
After installed SSMA, create report to convert Oracle Schema and migrate data to SQL Database or Managed Instance
For step-by-step guide, see [SSMA Migration guide](https://docs.microsoft.com/en-us/sql/ssma/oracle/sql-server-linux-convert-from-oracle?view=sql-server-ver15)
