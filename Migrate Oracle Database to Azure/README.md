# Migration practices for Oracle Database to Azure SQL Database/Managed Instance scenario

This template give you reference for decision tree, migration path from schema conversion, data conversion from Oracle Database.

## Migration paths

Oracle database would migrate to Azure VM, PostgreSQL, SQL DB/MI, or leverage IntercCross-cloud connectivity( Interconnect) to access OCI.

### Rehost

Host Oracle Database on Azure VM

For more information about how to install Oracle database on Azure Virtual Machine, see [Oracle VM images and their deployment on Microsoft Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/oracle-vm-solutions).


### Refactor

Migrate to Azure Database for PostgreSQL

### Rearchitect

Migrate to Azure SQL Database or Managed Instance

### Cross-cloud connectivity(Interconnect)

Using cross-cloud connectivity (Interconnect), the applications hosted on Azure can access Oracle database on Oracle Cloud Infrastructure (OCI) with low latency, high throughput by connecting an ExpressRoute circuit in Microsoft Azure with a FastConnect circuit in OCI. 

For more information about how to configure cross-cloud connectivity from Azure to OCI, see [Set up a direct interconnection between Azure and Oracle Cloud Infrastructure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-azure-oci-networking).

## Migration Decision Tree

Refer below migration decision tree:

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Images/OracleMigrationDecisionTree.jpg" />&nbsp;


