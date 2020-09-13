    # Switch root permission
    sudo su -
	# Update the package lists:
    sudo apt-get update
	# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
    sudo apt-get -y install postgresql

For install Postgresql to Red Hat base Linux, Debian base Linux, SUSE Linux, refer [Install and configure PostgreSQL on Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/postgresql-install)