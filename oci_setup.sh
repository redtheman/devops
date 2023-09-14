# This is a tutorial on setting up OCI for php, sql developer and related tools on a linux box. For the purpose of this tutorial,
# this was run on an ec2 instance running almalinux- 8.8

# First is to download the basic, sql plus, tools, developer  packages 
# I got the links from https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html
wget https://download.oracle.com/otn_software/linux/instantclient/1920000/oracle-instantclient19.20-basic-19.20.0.0.0-1.x86_64.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/1920000/oracle-instantclient19.20-sqlplus-19.20.0.0.0-1.x86_64.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/1920000/oracle-instantclient19.20-tools-19.20.0.0.0-1.x86_64.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/1920000/oracle-instantclient19.20-devel-19.20.0.0.0-1.x86_64.rpm

# We shall use the yum package manager to install the packages
sudo yum install oracle-instantclient19.20-basic-19.20.0.0.0-1.x86_64.rpm -y
sudo yum install oracle-instantclient19.20-sqlplus-19.20.0.0.0-1.x86_64.rpm -y
sudo yum install oracle-instantclient19.20-tools-19.20.0.0.0-1.x86_64.rpm -y
sudo yum install oracle-instantclient19.20-devel-19.20.0.0.0-1.x86_64.rpm -y

# then we add the bin folder to the PATH
export PATH=/usr/lib/oracle/19.20/client64/bin:$PATH

