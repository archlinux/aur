#!/bin/bash
set -e
__NAME__="zenbu-login"

function zenbu-login () {
    post_data="form_request=login&gw_address=10.10.24.1&gw_port=2060&gw_id=ZenBu10289&mac=EC%3A0E%3AC4%3A1C%3A8E%3A2F&auth_source=default-network&username=$username&password=$password&form_submit=login"
    url="$(curl\
        -H 'Content-Type: application/x-www-form-urlencoded'\
        -d ${post_data}\
        https://secure.zenbu.net.nz/login/ \
        2>/dev/null\
        | egrep -o 'http://.*url=' -m 1)"
    curl "$url" &> /dev/null
}

# execute if called directly
if grep -q "${__NAME__}" <<< "$0"; then
    usage="Usage: $0 [[username] [password/code]\n\
        You can define username and password in /etc/${__NAME__}"
    if egrep -q "[[:alnum:]]+" <<< "$1"; then
        if [ "$2" ]; then
            username="$1"
            password="$2"
        else
            username=""
            password="$1"
        fi
    else
        if [ "$1" ]; then
            echo -e ${usage}
            exit 1
        fi
        # the following file should define 2 variables: $username and $password
        source /etc/"${__NAME__}"
        if [ -z "$password" ]; then
            echo -e ${usage}
            exit 1
        fi
    fi
    ${__NAME__}
fi
