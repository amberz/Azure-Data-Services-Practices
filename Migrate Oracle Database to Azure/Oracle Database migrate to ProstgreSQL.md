# Oracle Database migrate to Azure Database for PostgreSQL

## Migration Process
The migration guide will includes existing Oracla Database environment assessment, Oracle schema and objects conversion to SQL, and data migration. For whole migraiton process, refer below migration process:
<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Images/OracleMigrationProcesstoSQL&PG.png" />&nbsp;


## Migration tools

Oracle Assessment script:
[Assessment Calculator Template](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/Customer%20Assessment%20CalculatorTemplate2.xlsx), 
[Oracle PL\SQL](https://github.com/microsoft/DataMigrationTeam/blob/master/Oracle%20Inventory%20Script%20Artifacts/Oracle%20Inventory%20Script%20Artifacts/Oracle_PreSSMA_Pre_v12.sql) 


Oracle schema conversition:
[Ora2PG](http://ora2pg.darold.net)
Oracle data online migration:
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


## Oracle Objects conversion and Data migration

Convert Oracle table, stored procedures, packages and other database objects to Postgres compatible by using ora2pg, then starting a migration pipeline in Azure Database Migration Service.

### Convert Oracle objects 
[How to install ora2pg on Windows/Linux](https://github.com/microsoft/DataMigrationTeam/blob/master/Whitepapers/Steps%20to%20Install%20ora2pg%20on%20Windows%20and%20Linux.pdf)
[How to convert Oracle schema to PostgreSQL using Ora2PG](https://github.com/Microsoft/DataMigrationTeam/blob/master/Whitepapers/Oracle%20to%20Azure%20PostgreSQL%20Migration%20Cookbook.pdf). 


### Online migrate data

DMS provide online migration to reduce downtime window, refer [How to online migrate Oracle data](https://docs.microsoft.com/en-us/azure/dms/tutorial-oracle-azure-postgresql-online#create-a-dms-instance) for online data migration. 



### Workaround list

Below is workaround list when migrating Oracle database to PostgreSQL:
<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Images/OracletoPGWorkaroundList.png" />&nbsp;

Refer [Oracle migrate to PostgreSQL workaround list](https://github.com/Microsoft/DataMigrationTeam/blob/master/Whitepapers/Oracle%20to%20Azure%20Database%20for%20PostgreSQL%20Migration%20Workarounds.pdf) to get detailed scripts. 

