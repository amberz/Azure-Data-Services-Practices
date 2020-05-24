# Oracle Database migrate to Azure Database for PostgreSQL

## Migration Process
The migration guide will includes existing Oracla Database environment assessment, Oracle schema and objects conversion to SQL, and data migration. For whole migraiton process, refer below migration process:
<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Images/OratoSQLMigrationProcess.png" />&nbsp;


## Migration tools

Oracle Assessment script:
[Assessment Calculator Template](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/Customer%20Assessment%20CalculatorTemplate2.xlsx), 
[Oracle PL\SQL](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/Oracle_PreSSMA_Pre_v12.sql) 

Oracle schema and data migration:
[Microsoft Data Migration Service](https://docs.microsoft.com/en-us/azure/dms/tutorial-oracle-azure-postgresql-online)


## Assessment


### Assessment Oracle environment
Oracle_PreSSMA Script( provided by Data Migration Jumpstart Team) can run on Oracle Database to evalute how many tables, stored procedures, views, packages etc. in existing Oracle environment, it will give a assessment if the existing Oracle Database is very complex. 

The assessment principles as below table:
<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Images/AssessmentTable.png" />&nbsp;

Download the [Assessment Calculator Template](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/Customer%20Assessment%20CalculatorTemplate2.xlsx) and run [Oracle PL\SQL](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/Oracle_PreSSMA_Pre_v12.sql) in existing Oracle database. 

For how to run the both tools, see [Assessment guide](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/OraclePre-SSMA%20Query%20Guidance.pptx)


### Assessment migration complexity 

Ora2Pg allow to run below command to get migration complexity assessment. 
`ora2pg -t SHOW_REPORT --estimate_cost`
The output of the schema assessment as below:
<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Images/OracletoPGMigrationLevel.png" />&nbsp;

## Objects Comparision
[Oracle functions vs PostgreSQL functions](https://wiki.postgresql.org/wiki/Oracle_Functions#Character_Functions_Returning_Character_Values)