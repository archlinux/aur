#!/bin/bash
set -e
__NAME__="zenbu-login"

# the following file should define 2 variables: $username and $password:
source /etc/"${__NAME__}"
if [[ "$username" == "" ]]; then
    echo You need to define username and password in /etc/${__NAME__}.
    exit 1

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
    ${__NAME__}
fi
