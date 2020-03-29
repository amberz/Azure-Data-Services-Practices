# Oracle Database to Azure SQL Database/Managed Instance scenario

## Migration Process

The migration will includes existing Oracla Database environment assessment, Oracle schema and objects conversion to SQL, and data migration.

Refer below migration process:

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Images/OracleMigrationDecisionTree.jpg" />&nbsp;

## Assessment



## Migration principal 

## Schema and objects conversion

## Data migration

Migrate to Azure SQL Database or Managed Instance, SQL Server Migration Assistant for Oracle can provide Oracle schema and objects conversion and data migration to Azure SQL Database/Managed Instance. 

To download the SSMA for Oracle,refer to downlad the latest version [What's New in SSMA for Oracle (OracleToSQL)](https://docs.microsoft.com/en-us/sql/ssma/oracle/what-s-new-in-ssma-for-oracle-oracletosql?view=sql-server-ver15) 


### Cross-cloud connectivity(Interconnect)

Using cross-cloud connectivity (Interconnect), the applications hosted on Azure can access Oracle database on Oracle Cloud Infrastructure (OCI) with low latency, high throughput by connecting an ExpressRoute circuit in Microsoft Azure with a FastConnect circuit in OCI. 

For more information about how to configure cross-cloud connectivity from Azure to OCI, see [Set up a direct interconnection between Azure and Oracle Cloud Infrastructure](https://docs.microsoft.com/en-us/azure/virtual-machines/workloads/oracle/configure-azure-oci-networking).

## Migration Decision Tree

Refer below migration decision tree:

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Images/OracleMigrationDecisionTree.jpg" />&nbsp;

Above decision tree comes from Microsoft Cloud Adoption Framework 

