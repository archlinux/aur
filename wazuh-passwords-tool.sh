#!/bin/bash

# Wazuh installer
# Copyright (C) 2015, Wazuh Inc.
#
# This program is a free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public
# License (version 2) as published by the FSF - Free Software
# Foundation.
adminpem="/etc/wazuh-indexer/certs/admin.pem"
adminkey="/etc/wazuh-indexer/certs/admin-key.pem"
readonly logfile="/var/log/wazuh-passwords-tool.log"
debug=">> ${logfile} 2>&1"

# ------------ passwordsMain.sh ------------ 
function getHelp() {

    echo -e ""
    echo -e "NAME"
    echo -e "        $(basename "${0}") - Manage passwords for Wazuh indexer users."
    echo -e ""
    echo -e "SYNOPSIS"
    echo -e "        $(basename "${0}") [OPTIONS]"
    echo -e ""
    echo -e "DESCRIPTION"
    echo -e "        -a,  --change-all"
    echo -e "                Changes all the Wazuh indexer and Wazuh API user passwords and prints them on screen."
    echo -e "                To change API passwords -au|--admin-user and -ap|--admin-password are required."
    echo -e ""
    echo -e "        -A,  --api"
    echo -e "                Change the Wazuh API password."
    echo -e "                Requires -u|--user, and -p|--password, -au|--admin-user and -ap|--admin-password."
    echo -e ""
    echo -e "        -au,  --admin-user <adminUser>"
    echo -e "                Admin user for Wazuh API, Required to change Wazuh API passwords."
    echo -e "                Requires -A|--api."
    echo -e ""
    echo -e "        -ap,  --admin-password <adminPassword>"
    echo -e "                Password for Wazuh API admin user, Required to change Wazuh API passwords."
    echo -e "                Requires -A|--api."
    echo -e ""
    echo -e "        -u,  --user <user>"
    echo -e "                Indicates the name of the user whose password will be changed."
    echo -e "                If no password specified it will generate a random one."
    echo -e ""
    echo -e "        -p,  --password <password>"
    echo -e "                Indicates the new password, must be used with option -u."
    echo -e ""
    echo -e "        -c,  --cert <route-admin-certificate>"
    echo -e "                Indicates route to the admin certificate."
    echo -e ""
    echo -e "        -k,  --certkey <route-admin-certificate-key>"
    echo -e "                Indicates route to the admin certificate key."
    echo -e ""
    echo -e "        -v,  --verbose"
    echo -e "                Shows the complete script execution output."
    echo -e ""
    echo -e "        -f,  --file <wazuh-passwords.txt>"
    echo -e "                Changes the passwords for the ones given in the file."
    echo -e ""
    echo -e "                Wazuh indexer users must have this format:"
    echo -e ""
    echo -e "                    # Description"
    echo -e "                      indexer_username: <user>"
    echo -e "                      indexer_password: <password>"
    echo -e ""
    echo -e "                Wazuh API users must have this format:"
    echo -e ""
    echo -e "                    # Description"
    echo -e "                      api_username: <user>"
    echo -e "                      api_password: <password>"
    echo -e ""
    echo -e "        -gf, --generate-file <wazuh-passwords.txt>"
    echo -e "                Generate password file with random passwords for standard users."
    echo -e ""
    echo -e "        -h,  --help"
    echo -e "                Shows help."
    echo -e ""
    exit 1

}
function main() {

    umask 177

    common_checkRoot

    if [ -n "${1}" ]; then
        while [ -n "${1}" ]
        do
            case "${1}" in
            "-v"|"--verbose")
                verboseenabled=1
                shift 1
                ;;
            "-a"|"--change-all")
                changeall=1
                shift 1
                ;;
            "-A"|"--api")
                api=1
                shift 1
                ;;
            "-au"|"--admin-user")
                if [ -z "${2}" ]; then
                    echo "Argument au|--admin-user needs a second argument"
                    getHelp
                    exit 1
                fi
                adminUser=${2}
                shift 2
                ;;
            "-ap"|"--admin-password")
                if [ -z "${2}" ]; then
                    echo "Argument -ap|--admin-password needs a second argument"
                    getHelp
                    exit 1
                fi
                adminPassword=${2}
                shift 2
                ;;
            "-u"|"--user")
                if [ -z "${2}" ]; then
                    echo "Argument --user needs a second argument"
                    getHelp
                    exit 1
                fi
                nuser=${2}
                shift 2
                ;;
            "-p"|"--password")
                if [ -z "${2}" ]; then
                    echo "Argument --password needs a second argument"
                    getHelp
                    exit 1
                fi
                password=${2}
                shift 2
                ;;
            "-c"|"--cert")
                if [ -z "${2}" ]; then
                    echo "Argument --cert needs a second argument"
                    getHelp
                    exit 1
                fi
                adminpem=${2}
                shift 2
                ;;
            "-k"|"--certkey")
                if [ -z "${2}" ]; then
                    echo "Argument --certkey needs a second argument"
                    getHelp
                    exit 1
                fi
                adminkey=${2}
                shift 2
                ;;
            "-f"|"--file")
                if [ -z "${2}" ]; then
                    echo "Argument --file needs a second argument"
                    getHelp
                    exit 1
                fi
                p_file=${2}
                shift 2
                ;;
            "-gf"|"--generate-file")
                if [ -z "${2}" ]; then
                    echo "Argument --generate-file needs a second argument"
                    getHelp
                    exit 1
                fi
                gen_file=${2}
                shift 2
                ;;
            "-h"|"--help")
                getHelp
                ;;
            *)
                getHelp
            esac
        done

        export JAVA_HOME=/usr/share/wazuh-indexer/jdk/

        if [ -n "${verboseenabled}" ]; then
            debug="2>&1 | tee -a ${logfile}"
        fi

        if [ -n "${gen_file}" ]; then
            passwords_generatePasswordFile
            if [ -z "${p_file}" ] && [ -z "${nuser}" ] && [ -z "${changeall}" ]; then
                exit 0
            fi
        fi

        common_checkSystem
        common_checkInstalled

        if [ -n "${p_file}" ] && [ ! -f "${p_file}" ]; then
            getHelp
        fi

        if [ -n "${nuser}" ] && [ -n "${changeall}" ]; then
            getHelp
        fi

        if [ -n "${password}" ] && [ -n "${changeall}" ]; then
            getHelp
        fi

        if [ -n "${nuser}" ] && [ -n "${p_file}" ]; then
            getHelp
        fi

        if [ -n "${password}" ] && [ -n "${p_file}" ]; then
            getHelp
        fi

        if [ -z "${nuser}" ] && [ -n "${password}" ]; then
            getHelp
        fi

        if [ -z "${nuser}" ] && [ -z "${password}" ] && [ -z "${changeall}" ] && [ -z  "${p_file}" ]; then
            getHelp
        fi

        if [ -n "${adminUser}" ] && [ -n "${adminPassword}" ] && [ -z "${api}" ]; then
            getHelp
        fi

        if [ -n "${nuser}" ]; then
            if [ -n "${adminUser}" ] && [ -n "${adminPassword}" ]; then
                passwords_getApiToken
                passwords_getApiUsers
                passwords_getApiIds
            elif [ -n "${indexer_installed}" ]; then
                passwords_readUsers
            fi
            passwords_checkUser
        fi

        if [ -n "${nuser}" ] && [ -z "${password}" ]; then
            autopass=1
            passwords_generatePassword
        fi

        if [ -n "${nuser}" ] && [ -n "${password}" ]; then
            passwords_checkPassword "${password}"
        fi
        

        if [ -n "${changeall}" ] || [ -n "${p_file}" ]; then
            if [ -n "${indexer_installed}" ]; then
                passwords_readUsers
            fi
            if [ -n "${adminUser}" ] && [ -n "${adminPassword}" ]; then
                passwords_getApiToken
                passwords_getApiUsers
                passwords_getApiIds
            else
                common_logger "Wazuh API admin credentials not provided, Wazuh API passwords not changed."
            fi
            if [ -n "${changeall}" ]; then
                passwords_generatePassword
            fi
        fi


        if [ -n "${p_file}" ]; then
            passwords_readFileUsers
        fi

        if { [ -z "${api}" ] || [ -n "${changeall}" ]; } && [ -n "${indexer_installed}" ]; then
            passwords_getNetworkHost
            passwords_generateHash
            passwords_changePassword
            passwords_runSecurityAdmin
        fi

        if [ -n "${api}" ] || [ -n "${changeall}" ]; then
            if [ -n "${adminUser}" ] && [ -n "${adminPassword}" ]; then
                passwords_changePasswordApi
            fi
        fi

    else
        getHelp
    fi

}
# ------------ passwordsFunctions.sh ------------ 
function passwords_changePassword() {

    if [ -n "${changeall}" ]; then
        if [ -n "${indexer_installed}" ] && [ -z ${no_indexer_backup} ]; then
            eval "mkdir /etc/wazuh-indexer/backup/ ${debug}"
            eval "cp /etc/wazuh-indexer/opensearch-security/* /etc/wazuh-indexer/backup/ ${debug}"
            passwords_createBackUp
        fi
        for i in "${!passwords[@]}"
        do
            if [ -n "${indexer_installed}" ] && [ -f "/etc/wazuh-indexer/backup/internal_users.yml" ]; then
                awk -v new='"'"${hashes[i]}"'"' 'prev=="'${users[i]}':"{sub(/\042.*/,""); $0=$0 new} {prev=$1} 1' /etc/wazuh-indexer/backup/internal_users.yml > internal_users.yml_tmp && mv -f internal_users.yml_tmp /etc/wazuh-indexer/backup/internal_users.yml
            fi

            if [ "${users[i]}" == "admin" ]; then
                adminpass=${passwords[i]}
            elif [ "${users[i]}" == "kibanaserver" ]; then
                dashpass=${passwords[i]}
            fi

        done
    else
        if [ -z "${api}" ] && [ -n "${indexer_installed}" ]; then
            eval "mkdir /etc/wazuh-indexer/backup/ ${debug}"
            eval "cp /etc/wazuh-indexer/opensearch-security/* /etc/wazuh-indexer/backup/ ${debug}"
            passwords_createBackUp
        fi
        if [ -n "${indexer_installed}" ] && [ -f "/etc/wazuh-indexer/backup/internal_users.yml" ]; then
            awk -v new='"'"${hash}"'"' 'prev=="'${nuser}':"{sub(/\042.*/,""); $0=$0 new} {prev=$1} 1' /etc/wazuh-indexer/backup/internal_users.yml > internal_users.yml_tmp && mv -f internal_users.yml_tmp /etc/wazuh-indexer/backup/internal_users.yml
        fi

        if [ "${nuser}" == "admin" ]; then
            adminpass=${password}
        elif [ "${nuser}" == "kibanaserver" ]; then
            dashpass=${password}
        fi

    fi

    if [ "${nuser}" == "admin" ] || [ -n "${changeall}" ]; then
        if [ -n "${filebeat_installed}" ] && [ -z "${dashboard}" ]; then
            file_username=$(grep "username:" /etc/filebeat/filebeat.yml | awk '{print $2}')
            file_password=$(grep "password:" /etc/filebeat/filebeat.yml | awk '{print $2}')
            if [ "$file_username" != "\${username}" ] || [ "$file_password" != "\${password}" ]; then
                common_logger -w "The user and password configured in the filebeat.yml file will be updated and stored in Filebeat Keystore."
            fi
            eval "echo ${adminpass} | filebeat keystore add password --force --stdin ${debug}"
            conf="$(awk '{sub("password: .*", "password: ${password}")}1' /etc/filebeat/filebeat.yml)"
            echo "${conf}" > /etc/filebeat/filebeat.yml
            eval "echo admin | filebeat keystore add username --force --stdin ${debug}"
            conf="$(awk '{sub("username: .*", "username: ${username}")}1' /etc/filebeat/filebeat.yml)"
            echo "${conf}" > /etc/filebeat/filebeat.yml
            common_logger "The filebeat.yml file has been updated to use the Filebeat Keystore username and password."
            passwords_restartService "filebeat"
            eval "/var/ossec/bin/wazuh-keystore -f indexer -k password -v ${adminpass}"
            passwords_restartService "wazuh-manager"
        fi
    fi

    if [ "$nuser" == "kibanaserver" ] || [ -n "$changeall" ]; then
        if [ -n "${dashboard_installed}" ] && [ -n "${dashpass}" ]; then
            if /usr/share/wazuh-dashboard/bin/opensearch-dashboards-keystore --allow-root list | grep -q opensearch.password; then
                eval "echo ${dashpass} | /usr/share/wazuh-dashboard/bin/opensearch-dashboards-keystore --allow-root add -f --stdin opensearch.password ${debug_pass} > /dev/null 2>&1"
            else
                wazuhdashold=$(grep "password:" /etc/wazuh-dashboard/opensearch_dashboards.yml )
                rk="opensearch.password: "
                wazuhdashold="${wazuhdashold//$rk}"
                conf="$(awk '{sub("opensearch.password: .*", "opensearch.password: '"${dashpass}"'")}1' /etc/wazuh-dashboard/opensearch_dashboards.yml)"
                echo "${conf}" > /etc/wazuh-dashboard/opensearch_dashboards.yml
            fi
            passwords_restartService "wazuh-dashboard"
        fi
    fi

}
function passwords_changePasswordApi() {
    #Change API password tool
    if [ -n "${changeall}" ]; then
        for i in "${!api_passwords[@]}"; do
            if [ -n "${wazuh_installed}" ]; then
                passwords_getApiUserId "${api_users[i]}"
                WAZUH_PASS_API='{\"password\":\"'"${api_passwords[i]}"'\"}'
                eval 'common_curl -s -k -X PUT -H \"Authorization: Bearer $TOKEN_API\" -H \"Content-Type: application/json\" -d "$WAZUH_PASS_API" "https://localhost:55000/security/users/${user_id}" -o /dev/null --max-time 300 --retry 5 --retry-delay 5 --fail'
                if [ "${api_users[i]}" == "${adminUser}" ]; then
                    sleep 1
                    adminPassword="${api_passwords[i]}"
                    passwords_getApiToken
                fi
                if [ -z "${AIO}" ] && [ -z "${indexer}" ] && [ -z "${dashboard}" ] && [ -z "${wazuh}" ] && [ -z "${start_indexer_cluster}" ]; then
                    common_logger -nl $"The password for Wazuh API user ${api_users[i]} is ${api_passwords[i]}"
                fi
            fi
            if [ "${api_users[i]}" == "wazuh-wui" ] && [ -n "${dashboard_installed}" ]; then
                passwords_changeDashboardApiPassword "${api_passwords[i]}"
            fi
        done
    else
        if [ -n "${wazuh_installed}" ]; then
            passwords_getApiUserId "${nuser}"
            WAZUH_PASS_API='{\"password\":\"'"${password}"'\"}'
            eval 'common_curl -s -k -X PUT -H \"Authorization: Bearer $TOKEN_API\" -H \"Content-Type: application/json\" -d "$WAZUH_PASS_API" "https://localhost:55000/security/users/${user_id}" -o /dev/null --max-time 300 --retry 5 --retry-delay 5 --fail'
            if [ -z "${AIO}" ] && [ -z "${indexer}" ] && [ -z "${dashboard}" ] && [ -z "${wazuh}" ] && [ -z "${start_indexer_cluster}" ]; then
                common_logger -nl $"The password for Wazuh API user ${nuser} is ${password}"
            fi
        fi
        if [ "${nuser}" == "wazuh-wui" ] && [ -n "${dashboard_installed}" ]; then
                passwords_changeDashboardApiPassword "${password}"
        fi
    fi
}
function passwords_changeDashboardApiPassword() {

    j=0
    until [ -n "${file_exists}" ] || [ "${j}" -eq "12" ]; do
        if [ -f "/usr/share/wazuh-dashboard/data/wazuh/config/wazuh.yml" ]; then
            eval "sed -i 's|password: .*|password: \"${1}\"|g' /usr/share/wazuh-dashboard/data/wazuh/config/wazuh.yml ${debug}"
            if [ -z "${AIO}" ] && [ -z "${indexer}" ] && [ -z "${dashboard}" ] && [ -z "${wazuh}" ] && [ -z "${start_indexer_cluster}" ]; then
                common_logger "Updated wazuh-wui user password in wazuh dashboard. Remember to restart the service."
            fi
            file_exists=1
        fi
        sleep 5
        j=$((j+1))
    done

}
function passwords_checkUser() {

    if [ -n "${adminUser}" ] && [ -n "${adminPassword}" ]; then
        for i in "${!api_users[@]}"; do
            if [ "${api_users[i]}" == "${nuser}" ]; then
                exists=1
            fi
        done
    else
        for i in "${!users[@]}"; do
            if [ "${users[i]}" == "${nuser}" ]; then
                exists=1
            fi
        done
    fi

    if [ -z "${exists}" ]; then
        common_logger -e "The given user does not exist"
        exit 1;
    fi

}
function passwords_checkPassword() {

    if ! echo "$1" | grep -q "[A-Z]" || ! echo "$1" | grep -q "[a-z]" || ! echo "$1" | grep -q "[0-9]" || ! echo "$1" | grep -q "[.*+?-]" || [ "${#1}" -lt 8 ] || [ "${#1}" -gt 64 ]; then
        common_logger -e "The password must have a length between 8 and 64 characters and contain at least one upper and lower case letter, a number and a symbol(.*+?-)."
        if [[ $(type -t installCommon_rollBack) == "function" ]]; then
                installCommon_rollBack
        fi
        exit 1
    fi

}
function passwords_createBackUp() {

    if [ -z "${indexer_installed}" ] && [ -z "${dashboard_installed}" ] && [ -z "${filebeat_installed}" ]; then
        common_logger -e "Cannot find Wazuh indexer, Wazuh dashboard or Filebeat on the system."
        exit 1;
    else
        if [ -n "${indexer_installed}" ]; then
            capem=$(grep "plugins.security.ssl.transport.pemtrustedcas_filepath: " /etc/wazuh-indexer/opensearch.yml )
            rcapem="plugins.security.ssl.transport.pemtrustedcas_filepath: "
            capem="${capem//$rcapem}"
        fi
    fi

    common_logger -d "Creating password backup."
    if [ ! -d "/etc/wazuh-indexer/backup" ]; then
        eval "mkdir /etc/wazuh-indexer/backup ${debug}"
    fi
    eval "JAVA_HOME=/usr/share/wazuh-indexer/jdk/ OPENSEARCH_CONF_DIR=/etc/wazuh-indexer /usr/share/wazuh-indexer/plugins/opensearch-security/tools/securityadmin.sh -backup /etc/wazuh-indexer/backup -icl -p 9200 -nhnv -cacert ${capem} -cert ${adminpem} -key ${adminkey} -h ${IP} ${debug}"
    if [ "${PIPESTATUS[0]}" != 0 ]; then
        common_logger -e "The backup could not be created"
        if [[ $(type -t installCommon_rollBack) == "function" ]]; then
            installCommon_rollBack
        fi
        exit 1;
    fi
    common_logger -d "Password backup created in /etc/wazuh-indexer/backup."

}
function passwords_generateHash() {

    if [ -n "${changeall}" ]; then
        common_logger -d "Generating password hashes."
        for i in "${!passwords[@]}"
        do
            nhash=$(bash /usr/share/wazuh-indexer/plugins/opensearch-security/tools/hash.sh -p "${passwords[i]}" 2>&1 | grep -A 2 'issues' | tail -n 1)
            if [  "${PIPESTATUS[0]}" != 0  ]; then
                common_logger -e "Hash generation failed."
                if [[ $(type -t installCommon_rollBack) == "function" ]]; then
                    installCommon_rollBack
                fi
                exit 1;
            fi
            hashes+=("${nhash}")
        done
        common_logger -d "Password hashes generated."
    else
        common_logger "Generating password hash"
        hash=$(bash /usr/share/wazuh-indexer/plugins/opensearch-security/tools/hash.sh -p "${password}" 2>&1 | grep -A 2 'issues' | tail -n 1)
        if [  "${PIPESTATUS[0]}" != 0  ]; then
            common_logger -e "Hash generation failed."
            if [[ $(type -t installCommon_rollBack) == "function" ]]; then
                installCommon_rollBack
            fi
            exit 1;
        fi
        common_logger -d "Password hash generated."
    fi

}
function passwords_generatePassword() {

    if [ -n "${nuser}" ]; then
        common_logger -d "Generating random password."
        pass=$(< /dev/urandom tr -dc "A-Za-z0-9.*+?" | head -c "${1:-28}";echo;)
        special_char=$(< /dev/urandom tr -dc ".*+?" | head -c "${1:-1}";echo;)
        minus_char=$(< /dev/urandom tr -dc "a-z" | head -c "${1:-1}";echo;)
        mayus_char=$(< /dev/urandom tr -dc "A-Z" | head -c "${1:-1}";echo;)
        number_char=$(< /dev/urandom tr -dc "0-9" | head -c "${1:-1}";echo;)
        password="$(echo "${pass}${special_char}${minus_char}${mayus_char}${number_char}" | fold -w1 | shuf | tr -d '\n')"
        if [  "${PIPESTATUS[0]}" != 0  ]; then
            common_logger -e "The password could not been generated."
            exit 1;
        fi
    else
        common_logger -d "Generating random passwords."
        for i in "${!users[@]}"; do
            pass=$(< /dev/urandom tr -dc "A-Za-z0-9.*+?" | head -c "${1:-28}";echo;)
            special_char=$(< /dev/urandom tr -dc ".*+?" | head -c "${1:-1}";echo;)
            minus_char=$(< /dev/urandom tr -dc "a-z" | head -c "${1:-1}";echo;)
            mayus_char=$(< /dev/urandom tr -dc "A-Z" | head -c "${1:-1}";echo;)
            number_char=$(< /dev/urandom tr -dc "0-9" | head -c "${1:-1}";echo;)
            passwords+=("$(echo "${pass}${special_char}${minus_char}${mayus_char}${number_char}" | fold -w1 | shuf | tr -d '\n')")
            if [ "${PIPESTATUS[0]}" != 0 ]; then
                common_logger -e "The password could not been generated."
                exit 1;
            fi
        done
        for i in "${!api_users[@]}"; do
            pass=$(< /dev/urandom tr -dc "A-Za-z0-9.*+?" | head -c "${1:-28}";echo;)
            special_char=$(< /dev/urandom tr -dc ".*+?" | head -c "${1:-1}";echo;)
            minus_char=$(< /dev/urandom tr -dc "a-z" | head -c "${1:-1}";echo;)
            mayus_char=$(< /dev/urandom tr -dc "A-Z" | head -c "${1:-1}";echo;)
            number_char=$(< /dev/urandom tr -dc "0-9" | head -c "${1:-1}";echo;)
            api_passwords+=("$(echo "${pass}${special_char}${minus_char}${mayus_char}${number_char}" | fold -w1 | shuf | tr -d '\n')")
            if [ "${PIPESTATUS[0]}" != 0 ]; then
                common_logger -e "The password could not been generated."
                exit 1;
            fi
        done
    fi
}
function passwords_generatePasswordFile() {

    common_logger -d "Generating password file."
    users=( admin anomalyadmin kibanaserver kibanaro logstash readall snapshotrestore )
    api_users=( wazuh wazuh-wui )
    user_description=(
        "Admin user for the web user interface and Wazuh indexer. Use this user to log in to Wazuh dashboard"
        "Anomaly detection user for the web user interface"
        "Wazuh dashboard user for establishing the connection with Wazuh indexer"
        "Regular Dashboard user, only has read permissions to all indices and all permissions on the .kibana index"
        "Filebeat user for CRUD operations on Wazuh indices"
        "User with READ access to all indices"
        "User with permissions to perform snapshot and restore operations"
        "Admin user used to communicate with Wazuh API"
        "Regular user to query Wazuh API"
    )
    api_user_description=(
        "Password for wazuh API user"
        "Password for wazuh-wui API user"
    )
    passwords_generatePassword

    for i in "${!users[@]}"; do
        {
        echo "# ${user_description[${i}]}"
        echo "  indexer_username: '${users[${i}]}'"
        echo "  indexer_password: '${passwords[${i}]}'"
        echo ""
        } >> "${gen_file}"
    done

    for i in "${!api_users[@]}"; do
        {
        echo "# ${api_user_description[${i}]}"
        echo "  api_username: '${api_users[${i}]}'"
        echo "  api_password: '${api_passwords[${i}]}'"
        echo ""
        } >> "${gen_file}"
    done

}
function passwords_getApiToken() {
    retries=0
    max_internal_error_retries=20

    TOKEN_API=$(curl -s -u "${adminUser}":"${adminPassword}" -k -X POST "https://localhost:55000/security/user/authenticate?raw=true" --max-time 300 --retry 5 --retry-delay 5)
    while [[ "${TOKEN_API}" =~ "Wazuh Internal Error" ]] && [ "${retries}" -lt "${max_internal_error_retries}" ]
    do
        common_logger "There was an error accessing the API. Retrying..."
        TOKEN_API=$(curl -s -u "${adminUser}":"${adminPassword}" -k -X POST "https://localhost:55000/security/user/authenticate?raw=true" --max-time 300 --retry 5 --retry-delay 5)
        retries=$((retries+1))
        sleep 10
    done
    if [[ ${TOKEN_API} =~ "Wazuh Internal Error" ]]; then
        common_logger -e "There was an error while trying to get the API token."
        if [[ $(type -t installCommon_rollBack) == "function" ]]; then
            installCommon_rollBack
        fi
        exit 1
    elif [[ ${TOKEN_API} =~ "Invalid credentials" ]]; then
        common_logger -e "Invalid admin user credentials"
        if [[ $(type -t installCommon_rollBack) == "function" ]]; then
            installCommon_rollBack
        fi
        exit 1
    fi

}
function passwords_getApiUsers() {

    mapfile -t api_users < <(common_curl -s -k -X GET -H \"Authorization: Bearer $TOKEN_API\" -H \"Content-Type: application/json\"  \"https://localhost:55000/security/users?pretty=true\" --max-time 300 --retry 5 --retry-delay 5 | grep username | awk -F': ' '{print $2}' | sed -e "s/[\'\",]//g")

}
function passwords_getApiIds() {

    mapfile -t api_ids < <(common_curl -s -k -X GET -H \"Authorization: Bearer $TOKEN_API\" -H \"Content-Type: application/json\"  \"https://localhost:55000/security/users?pretty=true\" --max-time 300 --retry 5 --retry-delay 5 | grep id | awk -F': ' '{print $2}' | sed -e "s/[\'\",]//g")

}
function passwords_getApiUserId() {

    user_id="noid"
    for u in "${!api_users[@]}"; do
        if [ "${1}" == "${api_users[u]}" ]; then
            user_id="${api_ids[u]}"
        fi
    done

    if [ "${user_id}" == "noid" ]; then
        common_logger -e "User ${1} is not registered in Wazuh API"
        if [[ $(type -t installCommon_rollBack) == "function" ]]; then
                installCommon_rollBack
        fi
        exit 1
    fi

}
function passwords_getNetworkHost() {

    IP=$(grep -hr "^network.host:" /etc/wazuh-indexer/opensearch.yml)
    NH="network.host: "
    IP="${IP//$NH}"

    # Remove surrounding double quotes if present
    IP="${IP//\"}"

    #allow to find ip with an interface
    if [[ ${IP} =~ _.*_ ]]; then
        interface="${IP//_}"
        IP=$(ip -o -4 addr list "${interface}" | awk '{print $4}' | cut -d/ -f1)
    fi

    if [ "${IP}" == "0.0.0.0" ]; then
        IP="localhost"
    fi
}
function passwords_readFileUsers() {

    filecorrect=$(grep -Ev '^#|^\s*$' "${p_file}" | grep -Pzc "\A(\s*(indexer_username|api_username|indexer_password|api_password):[ \t]+[\'\"]?[\w.*+?-]+[\'\"]?)+\Z")
    if [[ "${filecorrect}" -ne 1 ]]; then
        common_logger -e "The password file does not have a correct format or password uses invalid characters. Allowed characters: A-Za-z0-9.*+?

For Wazuh indexer users, the file must have this format:

# Description
  indexer_username: <user>
  indexer_password: <password>

For Wazuh API users, the file must have this format:

# Description
  api_username: <user>
  api_password: <password>

"
        exit 1
    fi

    sfileusers=$(grep indexer_username: "${p_file}" | awk '{ print substr( $2, 1, length($2) ) }' | sed -e "s/[\'\"]//g")
    sfilepasswords=$(grep indexer_password: "${p_file}" | awk '{ print substr( $2, 1, length($2) ) }' | sed -e "s/[\'\"]//g")

    sfileapiusers=$(grep api_username: "${p_file}" | awk '{ print substr( $2, 1, length($2) ) }' | sed -e "s/[\'\"]//g")
    sfileapipasswords=$(grep api_password: "${p_file}" | awk '{ print substr( $2, 1, length($2) ) }' | sed -e "s/[\'\"]//g")

    mapfile -t fileusers <<< "${sfileusers}"
    mapfile -t filepasswords <<< "${sfilepasswords}"

    mapfile -t fileapiusers <<< "${sfileapiusers}"
    mapfile -t fileapipasswords <<< "${sfileapipasswords}"

    if [ -n "${changeall}" ]; then
        for j in "${!fileusers[@]}"; do
            supported=false
            for i in "${!users[@]}"; do
                if [[ "${users[i]}" == "${fileusers[j]}" ]]; then
                    passwords_checkPassword "${filepasswords[j]}"
                    passwords[i]=${filepasswords[j]}
                    supported=true
                fi
            done
            if [ "${supported}" = false ] && [ -n "${indexer_installed}" ]; then
                common_logger -e "The user ${fileusers[j]} does not exist"
            fi
        done

        if [ -n "${adminUser}" ] && [ -n "${adminPassword}" ]; then
            for j in "${!fileapiusers[@]}"; do
                supported=false
                for i in "${!api_users[@]}"; do
                    if [[ "${api_users[i]}" == "${fileapiusers[j]}" ]]; then
                        passwords_checkPassword "${fileapipasswords[j]}"
                        api_passwords[i]=${fileapipasswords[j]}
                        supported=true
                    fi
                done
                if [ "${supported}" = false ] && [ -n "${indexer_installed}" ]; then
                    common_logger -e "The Wazuh API user ${fileapiusers[j]} does not exist"
                fi
            done
        fi
    else
        finalusers=()
        finalpasswords=()

        finalapiusers=()
        finalapipasswords=()

        for j in "${!fileusers[@]}"; do
            supported=false
            for i in "${!users[@]}"; do
                if [[ "${users[i]}" == "${fileusers[j]}" ]]; then
                    passwords_checkPassword "${filepasswords[j]}"
                    finalusers+=("${fileusers[j]}")
                    finalpasswords+=("${filepasswords[j]}")
                    supported=true
                fi
            done
            if [ ${supported} = false ] && [ -n "${indexer_installed}" ]; then
                common_logger -e "The user ${fileusers[j]} does not exist"
            fi
        done

        if [ -n "${adminUser}" ] && [ -n "${adminPassword}" ]; then
            for j in "${!fileapiusers[@]}"; do
                supported=false
                for i in "${!api_users[@]}"; do
                    if [[ "${api_users[i]}" == "${fileapiusers[j]}" ]]; then
                        passwords_checkPassword "${fileapipasswords[j]}"
                        finalapiusers+=("${fileapiusers[j]}")
                        finalapipasswords+=("${fileapipasswords[j]}")
                        supported=true
                    fi
                done
                if [ ${supported} = false ] && [ -n "${indexer_installed}" ]; then
                    common_logger -e "The Wazuh API user ${fileapiusers[j]} does not exist"
                fi
            done
        fi

        users=()
        passwords=()
        mapfile -t users < <(printf "%s\n" "${finalusers[@]}")
        mapfile -t passwords < <(printf "%s\n" "${finalpasswords[@]}")
        mapfile -t api_users < <(printf "%s\n" "${finalapiusers[@]}")
        mapfile -t api_passwords < <(printf "%s\n" "${finalapipasswords[@]}")

        changeall=1
    fi

}
function passwords_readUsers() {

    passwords_updateInternalUsers
    susers=$(grep -B 1 hash: /etc/wazuh-indexer/opensearch-security/internal_users.yml | grep -v hash: | grep -v "-" | awk '{ print substr( $0, 1, length($0)-1 ) }')
    mapfile -t users <<< "${susers[@]}"

}
function passwords_restartService() {

    common_logger -d "Restarting ${1} service..."
    if [ "$#" -ne 1 ]; then
        common_logger -e "passwords_restartService must be called with 1 argument."
        exit 1
    fi

    if [[ -d /run/systemd/system ]]; then
        eval "systemctl daemon-reload ${debug}"
        eval "systemctl restart ${1}.service ${debug}"
        if [  "${PIPESTATUS[0]}" != 0  ]; then
            common_logger -e "${1} could not be started."
            if [ -n "$(command -v journalctl)" ]; then
                eval "journalctl -u ${1} >> ${logfile}"
            fi
            if [[ $(type -t installCommon_rollBack) == "function" ]]; then
                installCommon_rollBack
            fi
            exit 1;
        else
            common_logger -d "${1} started."
        fi
    elif ps -p 1 -o comm= | grep "init"; then
        eval "/etc/init.d/${1} restart ${debug}"
        if [  "${PIPESTATUS[0]}" != 0  ]; then
            common_logger -e "${1} could not be started."
            if [ -n "$(command -v journalctl)" ]; then
                eval "journalctl -u ${1} >> ${logfile}"
            fi
            if [[ $(type -t installCommon_rollBack) == "function" ]]; then
                installCommon_rollBack
            fi
            exit 1;
        else
            common_logger -d "${1} started."
        fi
    elif [ -x "/etc/rc.d/init.d/${1}" ] ; then
        eval "/etc/rc.d/init.d/${1} restart ${debug}"
        if [  "${PIPESTATUS[0]}" != 0  ]; then
            common_logger -e "${1} could not be started."
            if [ -n "$(command -v journalctl)" ]; then
                eval "journalctl -u ${1} >> ${logfile}"
            fi
            if [[ $(type -t installCommon_rollBack) == "function" ]]; then
                installCommon_rollBack
            fi
            exit 1;
        else
            common_logger -d "${1} started."
        fi
    else
        if [[ $(type -t installCommon_rollBack) == "function" ]]; then
            installCommon_rollBack
        fi
        common_logger -e "${1} could not start. No service manager found on the system."
        exit 1;
    fi

}
function passwords_runSecurityAdmin() {

    common_logger -d "Running security admin tool."
    if [ -z "${indexer_installed}" ] && [ -z "${dashboard_installed}" ] && [ -z "${filebeat_installed}" ]; then
        common_logger -e "Cannot find Wazuh indexer, Wazuh dashboard or Filebeat on the system."
        exit 1;
    else
        if [ -n "${indexer_installed}" ]; then
            capem=$(grep "plugins.security.ssl.transport.pemtrustedcas_filepath: " /etc/wazuh-indexer/opensearch.yml )
            rcapem="plugins.security.ssl.transport.pemtrustedcas_filepath: "
            capem="${capem//$rcapem}"
        fi
    fi

    common_logger -d "Loading new passwords changes."
    eval "OPENSEARCH_CONF_DIR=/etc/wazuh-indexer /usr/share/wazuh-indexer/plugins/opensearch-security/tools/securityadmin.sh -f /etc/wazuh-indexer/backup/internal_users.yml -t internalusers -p 9200 -nhnv -cacert ${capem} -cert ${adminpem} -key ${adminkey} -icl -h ${IP} ${debug}"
    if [  "${PIPESTATUS[0]}" != 0  ]; then
        common_logger -e "Could not load the changes."
        exit 1;
    fi
    eval "cp /etc/wazuh-indexer/backup/internal_users.yml /etc/wazuh-indexer/opensearch-security/internal_users.yml"
    eval "rm -rf /etc/wazuh-indexer/backup/ ${debug}"

    if [[ -n "${nuser}" ]] && [[ -n ${autopass} ]]; then
        common_logger -nl "The password for user ${nuser} is ${password}"
        common_logger -w "Password changed. Remember to update the password in the Wazuh dashboard, Wazuh server, and Filebeat nodes if necessary, and restart the services."
    fi

    if [[ -n "${nuser}" ]] && [[ -z ${autopass} ]]; then
        common_logger -w "Password changed. Remember to update the password in the Wazuh dashboard, Wazuh server, and Filebeat nodes if necessary, and restart the services."
    fi

    if [ -n "${changeall}" ]; then
        if [ -z "${AIO}" ] && [ -z "${indexer}" ] && [ -z "${dashboard}" ] && [ -z "${wazuh}" ] && [ -z "${start_indexer_cluster}" ]; then
            for i in "${!users[@]}"; do
                common_logger -nl "The password for user ${users[i]} is ${passwords[i]}"
            done
            common_logger -w "Wazuh indexer passwords changed. Remember to update the password in the Wazuh dashboard, Wazuh server, and Filebeat nodes if necessary, and restart the services."
        else
            common_logger -d "Passwords changed."
        fi
    fi

}
function passwords_updateInternalUsers() {

    common_logger "Updating the internal users."
    backup_datetime=$(date +"%Y%m%d_%H%M%S")
    internal_users_backup_path="/etc/wazuh-indexer/internalusers-backup"
    passwords_getNetworkHost
    passwords_createBackUp

    eval "mkdir -p ${internal_users_backup_path} ${debug}"
    eval "cp /etc/wazuh-indexer/backup/internal_users.yml ${internal_users_backup_path}/internal_users_${backup_datetime}.yml.bkp ${debug}"
    eval "chmod 750 ${internal_users_backup_path} ${debug}"
    eval "chmod 640 ${internal_users_backup_path}/internal_users_${backup_datetime}.yml.bkp"
    eval "chown -R wazuh-indexer:wazuh-indexer ${internal_users_backup_path} ${debug}"
    common_logger "A backup of the internal users has been saved in the /etc/wazuh-indexer/internalusers-backup folder."

    eval "cp /etc/wazuh-indexer/backup/internal_users.yml /etc/wazuh-indexer/opensearch-security/internal_users.yml ${debug}"
    eval "rm -rf /etc/wazuh-indexer/backup/ ${debug}"
    common_logger -d "The internal users have been updated before changing the passwords."

}

# ------------ passwordsVariables.sh ------------ 

function common_checkAptLock() {

    attempt=0
    seconds=30
    max_attempts=10

    while fuser "${apt_lockfile}" >/dev/null 2>&1 && [ "${attempt}" -lt "${max_attempts}" ]; do
        attempt=$((attempt+1))
        common_logger "Another process is using APT. Waiting for it to release the lock. Next retry in ${seconds} seconds (${attempt}/${max_attempts})"
        sleep "${seconds}"
    done

}
function common_logger() {

    now=$(date +'%d/%m/%Y %H:%M:%S')
    mtype="INFO:"
    debugLogger=
    nolog=
    if [ -n "${1}" ]; then
        while [ -n "${1}" ]; do
            case ${1} in
                "-e")
                    mtype="ERROR:"
                    shift 1
                    ;;
                "-w")
                    mtype="WARNING:"
                    shift 1
                    ;;
                "-d")
                    debugLogger=1
                    mtype="DEBUG:"
                    shift 1
                    ;;
                "-nl")
                    nolog=1
                    shift 1
                    ;;
                *)
                    message="${1}"
                    shift 1
                    ;;
            esac
        done
    fi

    if [ -z "${debugLogger}" ] || { [ -n "${debugLogger}" ] && [ -n "${debugEnabled}" ]; }; then
        if [ -z "${nolog}" ] && { [ "$EUID" -eq 0 ] || [[ "$(basename "$0")" =~ $cert_tool_script_name ]]; }; then
            printf "%s\n" "${now} ${mtype} ${message}" | tee -a ${logfile}
        else
            printf "%b\n" "${now} ${mtype} ${message}"
        fi
    fi

}
function common_checkRoot() {

    common_logger -d "Checking root permissions."
    if [ "$EUID" -ne 0 ]; then
        echo "This script must be run as root."
        exit 1;
    fi

    common_logger -d "Checking sudo package."
    if ! command -v sudo > /dev/null; then 
        common_logger -e "The sudo package is not installed and it is necessary for the installation."
        exit 1;
    fi
}
function common_checkInstalled() {

    common_logger -d "Checking Wazuh installation."
    wazuh_installed=""
    indexer_installed=""
    filebeat_installed=""
    dashboard_installed=""

    if [ "${sys_type}" == "yum" ]; then
        eval "rpm -q wazuh-manager --quiet && wazuh_installed=1"
    elif [ "${sys_type}" == "apt-get" ]; then
        wazuh_installed=$(apt list --installed  2>/dev/null | grep wazuh-manager)
    elif [ "${sys_type}" == "pacman" ]; then
	wazuh_installed=$(pacman -Qs wazuh-manager)
    fi

    if [ -d "/var/ossec" ]; then
        common_logger -d "There are Wazuh remaining files."
        wazuh_remaining_files=1
    fi

    if [ "${sys_type}" == "yum" ]; then
        eval "rpm -q wazuh-indexer --quiet && indexer_installed=1"

    elif [ "${sys_type}" == "apt-get" ]; then
        indexer_installed=$(apt list --installed 2>/dev/null | grep wazuh-indexer)
    elif [ "${sys_type}" == "pacman" ]; then
	wazuh_installed=$(pacman -Qs wazuh-indexer)
    fi

    if [ -d "/var/lib/wazuh-indexer/" ] || [ -d "/usr/share/wazuh-indexer" ] || [ -d "/etc/wazuh-indexer" ] || [ -f "${base_path}/search-guard-tlstool*" ]; then
        common_logger -d "There are Wazuh indexer remaining files."
        indexer_remaining_files=1
    fi

    if [ "${sys_type}" == "yum" ]; then
        eval "rpm -q filebeat --quiet && filebeat_installed=1"
    elif [ "${sys_type}" == "apt-get" ]; then
        filebeat_installed=$(apt list --installed  2>/dev/null | grep filebeat)
    elif [ "${sys_type}" == "pacman" ]; then
	wazuh_installed=$(pacman -Qs wazuh-filebeat)
    fi

    if [ -d "/var/lib/filebeat/" ] || [ -d "/usr/share/filebeat" ] || [ -d "/etc/filebeat" ]; then
        common_logger -d "There are Filebeat remaining files."
        filebeat_remaining_files=1
    fi

    if [ "${sys_type}" == "yum" ]; then
        eval "rpm -q wazuh-dashboard --quiet && dashboard_installed=1"
    elif [ "${sys_type}" == "apt-get" ]; then
        dashboard_installed=$(apt list --installed  2>/dev/null | grep wazuh-dashboard)
    elif [ "${sys_type}" == "pacman" ]; then
	wazuh_installed=$(pacman -Qs wazuh-dashboard)
    fi

    if [ -d "/var/lib/wazuh-dashboard/" ] || [ -d "/usr/share/wazuh-dashboard" ] || [ -d "/etc/wazuh-dashboard" ] || [ -d "/run/wazuh-dashboard/" ]; then
        common_logger -d "There are Wazuh dashboard remaining files."
        dashboard_remaining_files=1
    fi

}
function common_checkSystem() {

    if [ -n "$(command -v yum)" ]; then
        sys_type="yum"
        sep="-"
        common_logger -d "YUM package manager will be used."
    elif [ -n "$(command -v apt-get)" ]; then
        sys_type="apt-get"
        sep="="
        common_logger -d "APT package manager will be used."
    elif [ -n "$(command -v pacman)" ]; then
        sys_type="pacman"
        sep="="
        common_logger -d "Pacman package manager will be used."
    else
        common_logger -e "Couldn't find YUM, APT or PACMAN package manager. Try installing the one corresponding to your operating system and then, launch the installation assistant again."
        exit 1
    fi

}
function common_checkWazuhConfigYaml() {

    common_logger -d "Checking Wazuh YAML configuration file."
    filecorrect=$(cert_parseYaml "${config_file}" | grep -Ev '^#|^\s*$' | grep -Pzc "\A(\s*(nodes_indexer__name|nodes_indexer__ip|nodes_server__name|nodes_server__ip|nodes_server__node_type|nodes_dashboard__name|nodes_dashboard__ip)=.*?)+\Z")
    if [[ "${filecorrect}" -ne 1 ]]; then
        common_logger -e "The configuration file ${config_file} does not have a correct format."
        exit 1
    fi

}
function common_curl() {

    if [ -n "${curl_has_connrefused}" ]; then
        eval "curl $@ --retry-connrefused"
        e_code="${PIPESTATUS[0]}"
    else
        retries=0
        eval "curl $@"
        e_code="${PIPESTATUS[0]}"
        while [ "${e_code}" -eq 7 ] && [ "${retries}" -ne 12 ]; do
            retries=$((retries+1))
            sleep 5
            eval "curl $@"
            e_code="${PIPESTATUS[0]}"
        done
    fi
    return "${e_code}"

}
function common_remove_gpg_key() {

    common_logger -d "Removing GPG key from system."
    if [ "${sys_type}" == "yum" ]; then
        if { rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n' | grep "Wazuh"; } >/dev/null ; then
            key=$(rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n' | grep "Wazuh Signing Key" | awk '{print $1}' )
            rpm -e "${key}"
        else
            common_logger "Wazuh GPG key not found in the system"
            return 1
        fi
    elif [ "${sys_type}" == "apt-get" ]; then
        if [ -f "/usr/share/keyrings/wazuh.gpg" ]; then
            rm -rf "/usr/share/keyrings/wazuh.gpg" "${debug}"
        else
            common_logger "Wazuh GPG key not found in the system"
            return 1
        fi
    fi

}
function common_checkYumLock() {

    attempt=0
    seconds=30
    max_attempts=10

    while [ -f "${yum_lockfile}" ] && [ "${attempt}" -lt "${max_attempts}" ]; do
        attempt=$((attempt+1))
        common_logger "Another process is using YUM. Waiting for it to release the lock. Next retry in ${seconds} seconds (${attempt}/${max_attempts})"
        sleep "${seconds}"
    done

}

main "$@"
