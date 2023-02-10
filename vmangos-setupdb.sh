#!/bin/bash

database_status () {
    until systemctl is-active mariadb > /dev/null; do
        echo "-- MariaDB systemd service is not running."
        echo "-- Waiting for database connection..."
        sleep 5
    done
}

setup_user () {
    if [[ $(mysql --silent --quick --skip-column-names --execute "SELECT COUNT(*) FROM mysql.user WHERE user = 'mangos';" | grep 0) ]]; then
        mysql --execute "CREATE USER IF NOT EXISTS 'mangos'@'localhost' IDENTIFIED BY 'mangos';" && echo "-- Created database user 'mangos' identified by 'mangos'"
        mysql --execute "GRANT ALL PRIVILEGES ON realmd.* TO 'mangos'@'localhost';" && echo "-- Granted privileges on database 'realmd' to database user 'mangos'"
        mysql --execute "GRANT ALL PRIVILEGES ON mangos.* TO 'mangos'@'localhost';" && echo "-- Granted privileges on database 'mangos' to database user 'mangos'"
        mysql --execute "GRANT ALL PRIVILEGES ON characters.* TO 'mangos'@'localhost';" && echo "-- Granted privileges on database 'characters' to database user 'mangos'"
        mysql --execute "GRANT ALL PRIVILEGES ON logs.* TO 'mangos'@'localhost';" && echo "-- Granted privileges on database 'logs' to database user 'mangos'"
        mysql --execute "FLUSH PRIVILEGES" && echo "-- Activated privileges"
    fi
}

update_db () {
    local dir=/usr/share/vmangos/sql
    local db="${1}"
    local output=$(mysql --silent --quick --skip-column-names --execute "SELECT schema_name FROM schemata WHERE schema_name = '${db}';" information_schema)
    if [[ -z "${output}" ]]; then
        mysql --execute "CREATE DATABASE IF NOT EXISTS ${db}"
        mysql ${db} < ${dir}/build/${db}.sql && echo "-- Filled database ${db} with initial data"
    fi
    mysql ${db} < ${dir}/migrations/${db}_db_updates.sql && echo "-- Applied migrations on ${db}" 
}

database_status

setup_user

update_db "realmd"
update_db "mangos"
update_db "characters"
update_db "logs"
