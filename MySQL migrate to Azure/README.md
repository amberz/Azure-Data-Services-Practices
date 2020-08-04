# MySQL migrate to Azure

This guide provide practices how to migrate MySQL to Azure

## Migration tools

MySQL discover script:
[MySQL_PreDiscovery](Scripts/MySQL_PreDiscovery.sql)

Data migration:
[Azure Data Migration Service](https://docs.microsoft.com/en-us/azure/dms/tutorial-rds-mysql-server-azure-db-for-mysql-online)


## Discovery existing MySQL environment

MySQL_PreDiscovery Script can run on Oracle Database to evaluate how many tables, stored procedures, views etc. in existing MySQL environment, it will give a assessment if the existing Database is very complex. 


## Objects conversion and Data migration

