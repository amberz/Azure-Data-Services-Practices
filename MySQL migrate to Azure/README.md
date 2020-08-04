# MySQL migrate to Azure

This guide provide practices how to migrate MySQL to Azure


## Migration Decision Tree

If MySQL engine is InnoDB or Memory, use Azure Database for MySQL 
Supported
•	InnoDB
•	MEMORY

If need to use MyISAM, BLACKHOLE, ARCHIVE AND FEDERATED engine, consider to use Azure Virtual Machine hosting MySQL server. 
•	MyISAM
•	BLACKHOLE
•	ARCHIVE
•	FEDERATED



## Migration tools

MySQL discover script:
[MySQL_PreDiscovery](Scripts/MySQL_PreDiscovery.sql)

Data migration:
[Azure Data Migration Service](https://docs.microsoft.com/en-us/azure/dms/tutorial-rds-mysql-server-azure-db-for-mysql-online)


## Discovery existing MySQL environment

MySQL_PreDiscovery Script can run on MySQL Database to evaluate how many tables, stored procedures, views etc. in existing MySQL environment, it will give a assessment if the existing Database is very complex. 


## Objects conversion and Data migration
After discovery and assessment, create MySQL schema on Azure database for MySQL.

