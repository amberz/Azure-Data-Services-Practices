This is to guide users how to migrate PostgreSQL to Azure. 



# Citus

## Concept

* Type 1: Distributed tables or sharded tables:
		On worker nodes
		spread out to help scaling for performance and parallelization.
		Changing the schema of a distributed table cascades to update all the table's shards across workers.
		Distribution column: Making the right choice is important for performance and functionality.
		From <https://docs.microsoft.com/en-us/azure/postgresql/concepts-hyperscale-nodes> 
* Type 2: reference tables: 
		sit on worker nodes. 
		multiple copies maintained
		A reference table is a type of distributed table whose entire contents are concentrated into a single shard. The shard is replicated on every worker. 
		typically small and are used to store data that's relevant to queries running on any worker node. An example is enumerated values like order statuses or product categories.
		From <https://docs.microsoft.com/en-us/azure/postgresql/concepts-hyperscale-nodes> 
* Type 3: local tables:
		Sit on condidorator node. 
		often used for internal admin tables. 
		A good candidate for local tables would be small administrative tables that don't participate in join queries. An example is a users table for application sign-in and authentication.
		From <https://docs.microsoft.com/en-us/azure/postgresql/concepts-hyperscale-distributed-data> 

Sample code to create distributed tables
```
SELECT create_distributed_table('<TableName>','<ColumnName>');
```
