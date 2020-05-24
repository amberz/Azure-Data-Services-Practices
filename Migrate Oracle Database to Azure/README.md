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

PostgreSQL is another option to allow Oracle users easy to migrate. Firstly, Azure provide PaaS service including built-in BCDR capacibity. Secondly, Azure provide a migration service allow user to easy to migrate Oracle schema and data to Azure database for PostgreSQL.  

For step-by-step migration, refer [Tutorial: Migrate Oracle to Azure Database for PostgreSQL online using DMS (Preview)](https://docs.microsoft.com/en-us/azure/dms/tutorial-oracle-azure-postgresql-online)

### Rearchitect

Azure SQL Database/Managed Instance provide powerful BCDR, security and stability. To migrate to Azure SQL Database or Azure Managed Instance, SQL Server Migration Assistant for Oracle can provide Oracle schema and objects conversion and data migration to Azure SQL Database/Managed Instance. 

To download the SSMA for Oracle,refer to downlad the latest version [Microsoft SQL Server Migration Assistant for Oracle](https://aka.ms/ssmafororacle)

For whole project migration, refer [Oracle Database migrate to Azure SQL Database/Managed Instance](https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Migrate%20Oracle%20Database%20to%20Azure/Oracle%20Database%20migrate%20to%20SQL%20DB%20or%20MI.md)

### Cross-cloud connectivity

Using cross-cloud connectivity (Interconnect), the applications hosted on Azure can access Oracle database on Oracle Cloud Infrastructure (OCI) with low latency, high throughput by connecting an ExpressRoute circuit in Microsoft Azure with a FastConnect circuit in OCI. 

For more information about how to configure cross-cloud connectivity from Azure to OCI, see [Set up a direct interconnection between Azure and Oracle Cloud Infrastructure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-azure-oci-networking).




