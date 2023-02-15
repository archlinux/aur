#!/bin/bash

main() {
    database_status
    declare_vars
    is_update
    if [[ ${IS_UPDATE} == 0 ]]; then
        setup_user
        setup_db
    fi
    update_db
    if [[ ${IS_UPDATE} == 0 ]]; then
		print_instructions
	fi
}

declare_vars () {
    IS_UPDATE=1
    SCRIPT_DIR=/usr/share/vmangos/sql
    DB_NAMES=('realmd' 'mangos' 'characters' 'logs')
}

is_update () {
    for db in ${DB_NAMES[@]}; do
        local output=$(mysql --silent --quick --skip-column-names --execute "SELECT schema_name FROM schemata WHERE schema_name = '${db}';" information_schema)
        if [[ -z ${output} ]]; then
            IS_UPDATE=0
        fi
    done
}

database_status () {
    systemctl is-active mariadb > /dev/null || echo "MariaDB systemd service not running"
    until systemctl is-active mariadb > /dev/null; do
        echo -n "Waiting for database connection"
        for i in {1..4}; do
            sleep 0.5
            echo -n "."
        done
        echo -ne "\r\033[K"
    done
}

setup_user () {
    local dbaddress=127.0.0.1
    local dbport=3306
    local dbuser=mangos
    local dbpassword=mangos
    mysql --silent --quick --execute "CREATE USER IF NOT EXISTS '${dbuser}'@'localhost' IDENTIFIED BY '${dbpassword}';"
    for db in ${DB_NAMES[@]}; do
        mysql --silent --quick --execute "GRANT ALL PRIVILEGES ON ${db}.* TO '${dbuser}'@'localhost';"
    done && echo "-- Created a database user and granted it privileges"
    mysql --silent --quick --execute "FLUSH PRIVILEGES"
    sed --in-place --regexp-extended "s/(.+Database.Info.+\").*;.*;.*;.*;(.+)/\1${dbaddress};${dbport};${dbuser};${dbpassword};\2/" /etc/vmangos/mangosd.conf && echo "-- Modified mangosd.conf"
    sed --in-place --regexp-extended "s/(.+DatabaseInfo.+\").*;.*;.*;.*;(.+)/\1${dbaddress};${dbport};${dbuser};${dbpassword};\2/" /etc/vmangos/realmd.conf && echo "-- Modified realmd.conf"
}

setup_db () {
    for db in ${DB_NAMES[@]}; do
        mysql --silent --quick --execute "CREATE DATABASE IF NOT EXISTS ${db}"
        mysql ${db} < ${SCRIPT_DIR}/build/${db}.sql && echo "-- Filled database ${db} with initial data"
    done
}

update_db () {
    for db in ${DB_NAMES[@]}; do
        mysql --silent --quick ${db} < ${SCRIPT_DIR}/migrations/${db}_db_updates.sql && echo "-- Applied migrations on ${db}"
    done
}

print_instructions () {
	cat <<EOF

    Final steps to get your server working are creating a realm and an account.

    To create a realm, in mariadb:
        > USE realmd;
        > INSERT INTO realmlist (name) VALUES ("examplerealm");

    To create an account with admin rights, in terminal (systemd services running):
        $ echo "account create *username* *password*" > /run/vmangos-mangosd.stdin
        $ echo "account set gmlevel *username* 6 > /run/vmangos-mangosd.stdin

EOF
}

main "$@"
