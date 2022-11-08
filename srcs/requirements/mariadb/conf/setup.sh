#!/bin/bash
if [ "$(ls -A /var/lib/mysql/${DBNAME})" ]; then
    echo "Database already set up"
else    
    mkdir /var/run/mysqld 
    touch /var/run/mysqld/mysqld.sock
    chown -R mysql /var/run/mysqld
    service mysql start
    mysql -u root -e  "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; flush privileges;"
    mysql -u root -e "grant all privileges on *.* to '${USER}'@'%' IDENTIFIED BY '${PASSWORD}'; flush privileges;"
    mysql < /wp_databases.sql -u ${USER} -p${PASSWORD} ${DB_NAME}
    mysqladmin -u root -pPASSWORD shutdown
#service mysql stop
fi
mysqld_safe
