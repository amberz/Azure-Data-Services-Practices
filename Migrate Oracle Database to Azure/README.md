# Oracle Database to Azure SQL Database/Managed Instance scenario

This template give you reference for decision tree, migration path from schema conversion, data conversion from Oracle Database.

## Migration paths

Oracle database would migrate to Azure Virtual Machine, Azure Database for PostgreSQL, Azure SQL Database, Azure Managed Instance, or leverage IntercCross-cloud connectivity( Interconnect) to access OCI.

### Rehost

Migrate Oracle Database to Azure Virtual Machine, for more information about how to install Oracle database on Azure Virtual Machine, see [Oracle VM images and their deployment on Microsoft Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/oracle-vm-solutions).


For BCDR requirement, refer [Implement Oracle Data Guard on an Azure Linux virtual machine](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-oracle-dataguard), and [Implement Oracle Golden Gate on an Azure Linux VM](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-oracle-golden-gate) 


### Refactor

Migrate to Azure Database for PostgreSQL, Azure Data Migration Service can provide Oracle schemas and data migration, for more information, [Tutorial: Migrate Oracle to Azure Database for PostgreSQL online using DMS (Preview)](https://docs.microsoft.com/en-us/azure/dms/tutorial-oracle-azure-postgresql-online)

### Rearchitect

Migrate to Azure SQL Database or Azure Managed Instance, SQL Server Migration Assistant for Oracle can provide Oracle schema and objects conversion and data migration to Azure SQL Database/Managed Instance. 

To download the SSMA for Oracle,refer to downlad the latest version [What's New in SSMA for Oracle (OracleToSQL)](https://docs.microsoft.com/en-us/sql/ssma/oracle/what-s-new-in-ssma-for-oracle-oracletosql?view=sql-server-ver15) 


### Cross-cloud connectivity

Using cross-cloud connectivity (Interconnect), the applications hosted on Azure can access Oracle database on Oracle Cloud Infrastructure (OCI) with low latency, high throughput by connecting an ExpressRoute circuit in Microsoft Azure with a FastConnect circuit in OCI. 

For more information about how to configure cross-cloud connectivity from Azure to OCI, see [Set up a direct interconnection between Azure and Oracle Cloud Infrastructure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-azure-oci-networking).

## Migration Decision Tree

Refer below migration decision tree:

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Images/OracleMigrationDecisionTree.jpg" />&nbsp;

Above decision tree comes from Microsoft Cloud Adoption Framework 

