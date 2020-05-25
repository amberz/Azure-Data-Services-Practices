# Oracle Database migrate to Azure

This guidance give you reference for decision tree of Oracle database migration, migration path to virtual machine, or Azure managed database, such as: PostgreSQL, SQL Database, Managed Instance etc.


Whether Oracle database is certified and supported on Microsoft Azure?

Oracle and Microsoft published [Oracle database is certified and supported on Microsoft Azure](https://www.oracle.com/cloud/azure-interconnect-faq.html)


## Migration Decision Tree

Since application restriction(i.e. applicaiton only support Oracle database) or technologies preference, there are some otpions for Oracle database migrate to Azure, refer below migration decision tree:

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Images/OracleMigrationDecisionTree.png" />&nbsp;

## Migration paths

Oracle database would migrate to Azure Virtual Machine, Azure Database for PostgreSQL, Azure Managed Instance/Azure SQL Database, or leverage IntercCross-cloud connectivity( Interconnect) to access Oracle Cloud Infrastructure(OCI).

### Lift/shift to Azure VMs


Azure provides Oracle database images with Bring-Your-Own-License, allows to migrate Oracle Database to Azure Virtual Machines.

#### License
When using Hyper-Threading Technology enabled Azure virtual Machines, Oracle database count two vCPUs as equivalent to one Oracle Processor license. Refer [Licensing Oracle Software in the Cloud Computing Environment](http://www.oracle.com/us/corporate/pricing/cloud-licensing-070579.pdf) for details. 


#### Installation
To install Oracle DB to Azure Virtual Machine, refer [Oracle VM images and their deployment on Microsoft Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/oracle-vm-solutions) to gain step-by-step installation guidance.  

#### Backup stragety
For Oracle database backup stragety, besices Oracle Recovery Manager (RMAN) to back up the database with full backup, differential back, Azure backup provide VM snapshot as VM backup. Rfer [Backup strategy for Oracle database](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/oracle-backup-recovery)


#### Business continuity and disaster recovery
For business continuity and disaster recovery capacity, allow to deploy Oracle Data Guard with Fast-Start Failover (FSFO) for database availability, Oracle Data Guard Far Sync for zero data loss protection, Golden gate for multi-master or active-active mode on Azure availability set or availability zone depends on SLA requirements. Refer below docs about:
[How to install and deploy data guard on Azure virtual machines](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-oracle-dataguard)
[How to install and deploy golden gate on Azure virtul machines](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-oracle-golden-gate)
[Refer architecutre for data guard on Azure virtual machines](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/oracle-reference-architecture)


Oracle Real Application Cluster (RAC) alone cannot be used in Azure, leveraging FlashGrid SkyCluster can host RAC on Azure. 

For Oracle RAC in Azure with FlashGrid SkyCluster, refer [Oracle RAC in Azure with FlashGrid SkyCluster](https://www.flashgrid.io/oracle-rac-in-azure/) as reference architecture, [SkyCluster for Oracle RAC](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/flashgrid-inc.flashgrid-skycluster) to get Azure SkyCluster for Oracle RAC image. 


### Refactor

If prefer managed service on Azure, Azure offer Azure database migration service to allow Oracle database easyly migrate Azure database for PostgreSQL. 

#### Prerequisites
* Azure Subscritpion, refer [How to create Azure subscription](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/create-subscription) to create a new subscritpion if doesn't exist. 
* Provision Azure Data Migration Service(DMS), refer [Create DMS using Azure portal](https://docs.microsoft.com/en-us/azure/dms/quickstart-create-data-migration-service-portal) about how to create DMS.

#### Why migrate to PostgreSQL
* Azure database for PostgreSQL provide built-in business continuity and disaster recovery capacibity. Refer [PostgreSQL read replica](https://docs.microsoft.com/en-us/azure/postgresql/concepts-read-replicas)

* Azure provide Azure Data Migration Service allow easily to convert Oracle objects and migrate online data to Azure database for PostgreSQL.  


#### Migration guidance 
For step-by-step migration, refer [Migrate Oracle database to Azure Database for PostgreSQL](https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Oracle%20Database%20migrate%20to%20ProstgreSQL.md)


### Rearchitect

If comfortable to manage MSSQL, Azure managed instance(MI) is a good options given it's Microsoft 1st party relational database on Azure. 

#### Why migrate to Azure MI
* Azure Managed Instance provide built-in [business continuity and disaster recovery capability](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-business-continuity), [Enterprise security](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-security-overview) and stability. 

* Microsoft provide SQL Server Migration Assistant allow Oracle database convert objects and migrate data to MI for free.

To download the SSMA for Oracle,refer to downlad the latest version [Microsoft SQL Server Migration Assistant for Oracle](https://aka.ms/ssmafororacle)

#### Migration guidance 
For whole project migration, refer [Oracle Database migrate to Azure Managed Instance](https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Oracle%20Database%20migrate%20to%20SQL%20DB%20or%20MI.md)



### Cross-cloud connectivity

To support multi-cloud experience, Microsoft and Oracle provide direct interconnection between Azure and Oracle Cloud Infrastructure (OCI) through ExpressRoute and FastConnect.It allows applications hosted on Azure and Oracle database hosted on Oracle Cloud Infrastructure (OCI) with low latency, high throughput by connecting an ExpressRoute circuit in Microsoft Azure with a FastConnect circuit in OCI. 

#### Certify applications

[Oracle will certify applications to run in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-azure-oci-networking)

#### How to configure
For more information about how to configure cross-cloud connectivity from Azure to OCI, see [Set up a direct interconnection between Azure and Oracle Cloud Infrastructure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-azure-oci-networking).




