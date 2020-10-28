# Citus permission

Citus role is build-in admin account, if need additional role to manage citus database, create a new role from Azure portal, grant corresponding permission for that. 

1. [create a new role](https://docs.microsoft.com/en-us/azure/postgresql/howto-hyperscale-create-users#how-to-modify-privileges-for-user-role)
Permission list as below:
2. Grant permission for the new role
    GRANT SELECT ON mytable TO db_user;

[get granted permission per table or role](http://docs.citusdata.com/en/v9.4/cloud/security.html?highlight=GRANT%20REFRESH%20%20MATERIALIZED%20VIEW%20#users-and-permissions)

[Citus permission list](https://www.postgresql.org/docs/current/sql-grant.html)

	SELECT grantee, privilege_type,* FROM information_schema.role_table_grants
	 WHERE grantee = 'testrole';

    Select * from information_schema.table_privileges WHERE grantee = 'testrole';


For MATERIALIZED VIEW, it needs owner permission
create table
CREATE TABLE github_events
(
    event_id bigint,
    event_type text,
    event_public boolean,
    repo_id bigint,
    payload jsonb,
    repo jsonb,
    actor jsonb,
    org jsonb,
    created_at timestamp
);

create materialized view

CREATE MATERIALIZED VIEW github_events_vw AS 
SELECT date_trunc('hour', created_at) AS hour,
       sum((payload->>'distinct_size')::int) AS num_commits
FROM github_events
WHERE event_type = 'PushEvent'
GROUP BY hour
ORDER BY hour;

using citus role to login and grant owner permission for new role. 
ALTER TABLE github_events_vw owner to testrole;