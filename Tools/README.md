# Azure SQL Database
## Azure SQL Database network latency test tool
[Testing Client Latency to SQL Azure](https://azure.microsoft.com/en-us/blog/testing-client-latency-to-sql-azure/)

* Client processing time(milliseconds): The cumulative amount of time that the client spent executing code while the query was executed. Alternatively, is the time between first response packet and last response packet.

* Total execution time(milliseconds): The cumulative amount of time that the client spent processing while the query was executed, including the time that the client spent waiting for replies from the server as well as the time spent executing code.

* Wait time on server replies(milliseconds): amount of network latency. The cumulative amount of time that the client spent while it waited for the server to reply. Alternatively, the time between the last request packet left the client and the very first response packet returned from the server.

* Total execution time = Client processing time + Wait time on server replies