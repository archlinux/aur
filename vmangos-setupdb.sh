#!/bin/bash

IS_UPDATE=1
SCRIPT_DIR=/usr/share/vmangos/sql
DB_NAMES=('realmd' 'mangos' 'characters' 'logs')
DBADDRESS=127.0.0.1
DBPORT=3306
DBUSER=mangos
DBPASSWORD=mangos

main() {
    database_status
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

is_update () {
    for db in ${DB_NAMES[@]}; do
        local output=$(mariadb --skip-column-names --execute "SELECT schema_name FROM schemata WHERE schema_name = '${db}';" information_schema)
        if [[ -z ${output} ]]; then
            IS_UPDATE=0
        fi
    done
}

database_status () {
    until systemctl is-active mariadb > /dev/null; do
        echo -e "MariaDB systemd service not running\nWaiting for database connection..."
        sleep 5
    done
}

setup_user () {
    mariadb  --execute "CREATE USER IF NOT EXISTS '${DBUSER}'@'localhost' IDENTIFIED BY '${DBPASSWORD}';"
    for db in ${DB_NAMES[@]}; do
        mariadb --execute "GRANT ALL PRIVILEGES ON ${db}.* TO '${DBUSER}'@'localhost';"
    done && echo "-- Created a database user and granted it privileges"
    mariadb --execute "FLUSH PRIVILEGES"
    sed --in-place --regexp-extended "s/(.*Database.Info.*\").*;.*;.*;.*;(.*)/\1${DBADDRESS};${DBPORT};${DBUSER};${DBPASSWORD};\2/" /etc/vmangos/mangosd.conf && echo "-- Modified mangosd.conf"
    sed --in-place --regexp-extended "s/(.*DatabaseInfo.*\").*;.*;.*;.*;(.*)/\1${DBADDRESS};${DBPORT};${DBUSER};${DBPASSWORD};\2/" /etc/vmangos/realmd.conf && echo "-- Modified realmd.conf"
}

setup_db () {
    for db in ${DB_NAMES[@]}; do
        mariadb --execute "CREATE DATABASE IF NOT EXISTS ${db}"
        mariadb ${db} < ${SCRIPT_DIR}/build/${db}.sql && echo "-- Filled database ${db} with initial data"
    done
}

update_db () {
    for db in ${DB_NAMES[@]}; do
        mariadb ${db} < ${SCRIPT_DIR}/migrations/${db}_db_updates.sql && echo "-- Applied migrations on ${db}"
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
