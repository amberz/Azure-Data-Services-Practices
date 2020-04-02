# Oracle Database migrate to Azure

This guidace give you reference for decision tree of Oracle database migration, migration path to virtual machine, or Azure managed database, such as: PostgreSQL, SQL Database, Managed Instance etc.

## Migration paths

Oracle database would migrate to Azure Virtual Machine, Azure Database for PostgreSQL, Azure SQL Database, Azure Managed Instance, or leverage IntercCross-cloud connectivity( Interconnect) to access OCI.

### Rehost

Oracle Database can migrate to Azure Virtual Machine, and also provide business continuity and disaster recovery capacity. 

Blow is step-by-step guide to install Oracle DB to Azure Virtual Machine:
[Oracle VM images and their deployment on Microsoft Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/oracle-vm-solutions).


For BCDR requirement, the both Oracle Data Guard and Oracle Golden Gate can be configured on Azure as well. 

For step-by-step configuration, refer 
[Implement Oracle Data Guard on an Azure Linux virtual machine](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-oracle-dataguard), and [Implement Oracle Golden Gate on an Azure Linux VM](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-oracle-golden-gate) 


### Refactor

PostgreSQL is another option to allow Oracle users easy to migrate. Firstly, Azure provide PaaS service including built-in BCDR capacibity. Secondly, Azure provide a migration service allow user to easy to migrate Oracle schema and data to Azure database for PostgreSQL.  

For step-by-step migration, refer [Tutorial: Migrate Oracle to Azure Database for PostgreSQL online using DMS (Preview)](https://docs.microsoft.com/en-us/azure/dms/tutorial-oracle-azure-postgresql-online)

### Rearchitect

Azure SQL Database/Managed Instance provide powerful BCDR, security and stability. To migrate to Azure SQL Database or Azure Managed Instance, SQL Server Migration Assistant for Oracle can provide Oracle schema and objects conversion and data migration to Azure SQL Database/Managed Instance. 

To download the SSMA for Oracle,refer to downlad the latest version [Microsoft SQL Server Migration Assistant for Oracle](https://aka.ms/ssmafororacle)

For whole project migration, refer [Oracle Database migrate to Azure SQL Database/Managed Instance](https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Oracle%20Database%20migrate%20to%20SQL%20DB%20or%20MI.md)

### Cross-cloud connectivity

Using cross-cloud connectivity (Interconnect), the applications hosted on Azure can access Oracle database on Oracle Cloud Infrastructure (OCI) with low latency, high throughput by connecting an ExpressRoute circuit in Microsoft Azure with a FastConnect circuit in OCI. 

For more information about how to configure cross-cloud connectivity from Azure to OCI, see [Set up a direct interconnection between Azure and Oracle Cloud Infrastructure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-azure-oci-networking).

## Migration Decision Tree

Refer below migration decision tree:

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Images/OracleMigrationDecisionTree.jpg" />&nbsp;

Above decision tree is referred from Microsoft Cloud Adoption Framework 

