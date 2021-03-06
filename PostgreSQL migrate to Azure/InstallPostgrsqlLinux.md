
# Install Postgresql on Centos

### Installation 
    # install postgresql server
    yum install postgresql-server

### Configuration 
    # Create a non-root user and switch to this new user since for security reasons, PostgreSQL uses a non-root user to initialize, start, or shut down the database
    $ useradd postgres
    $ su - postgres

    # Due to policies for Red Hat family distributions, the PostgreSQL installation will not be enabled for automatic start or have the database initialized automatically. To make your database installation complete
    $ postgresql-setup --initdb
    You will got below output
     * Initializing database in '/var/lib/pgsql/data'
     * Initialized, logs are in /var/lib/pgsql/initdb_postgresql.log

    # need root permision to enable and start service
    $ systemctl enable postgresql.service
    Get below output: 
    Created symlink /etc/systemd/system/multi-user.target.wants/postgresql.service → /usr/lib/systemd/system/postgresql.service.
Please refer [Postgresql on Centos](https://www.postgresql.org/download/linux/redhat/)  

### Connect postgresql database engine, create database, table
    $ su - postgres
    get below output
    Last login: Sun Sep 13 19:29:59 UTC 2020 on pts/0
    
    # create a database
    createdb MyPGDB913
    # connect the database
    psql -d MyPGDB913
    output:
    psql (10.6)
    Type "help" for help.

    MyPGDB913=#
    
    # create a table
    CREATE TABLE potluck (name VARCHAR(20),    food VARCHAR(30),    confirmed CHAR(1), signup_date DATE);
    # add data to the table
    INSERT INTO potluck (name, food, confirmed, signup_date) VALUES('John', 'Casserole', 'Y', '2012-04-11');
    # show the data in the table
    select * from potluck;
    
Please refer [Install PostgreSQL on Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/postgresql-install). 


    # pd_dump database 
    pg_dump mydb > db.sql
    # pg_dump table
    pg_dump -h mylocalpghostname -p 5432 -U postgres --table=MyPGTable --schema-only --format=custom postgres 

    # restore a table
    pg_restore -h azuretest.postgres.database.azure.com -p 5432 -U myuser --schema-only --dbname citus

Please refer [PG_dump](https://www.postgresql.org/docs/9.3/app-pgdump.html)
### Use PG_dump to back database

    # login Postgresql database engine
    $ su - postgres
    # use pg_dump to backup database schema to a SQL script

# Install and configure PostgreSQL in conda 
    # create a temp folder to download conda 
    cd /tmp
    curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
    # Install Anaconda
    bash Anaconda3-2019.03-Linux-x86_64.sh

    # active installation
    source ~/.bashrc
    # Test conda installation 
    conda list


    # Create conda environment
    conda create --name myenv
    # update conda 
    conda update -n base -c defaults conda
    # enter the environment
    conda activate myenv


    # install postgresql via conda
    conda install -y -c conda-forge postgresql
    # create a base database locally
    initdb -D mylocal_db
    # start the server modus/instance of postgres
    pg_ctl -D mylocal_db -l logfile start

#  Install Postgresql engine on Ubuntu   

## Installation 
    # Switch root permission
    $ sudo su -
	# Update the package lists:
    $ sudo apt-get update
	# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
    $ sudo apt-get -y install postgresql
    # install postgresql client tools
    $ apt-get -y install postgresql-client
    # Validate installation psql
    $ which psql
    # PostgreSQL version:
    $ psql -V

For install Postgresql to Red Hat base Linux, Debian base Linux, SUSE Linux, refer [Install PostgreSQL on Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/postgresql-install) and [Install PostgreSQL on Ubuntu](https://www.postgresql.org/download/linux/ubuntu/)

## Configure Postgresql database on Ubuntu

    # Validate if install pg_createcluster
    $ which pg_createcluster

    # create a new PostgreSQL cluster
    $ pg_createcluster -u Amber
Please refer [pg_createcluster](http://manpages.ubuntu.com/manpages/precise/man8/pg_createcluster.8.html)

