#!/bin/sh

if [ $# != 1 ] && [ $# != 2 ]  ; then
    echo -e "Usage: $0 <service> [domain]\n       service can be \`auth\`, \`config\`, \`cli\`, \`fido2\`, \`link\`, 'saml', 'lock', \`casa\`" >&2
    exit 1
fi

configdir="/etc"
tmpdir="/tmp/jansconfig"
serviceName=$1
domain=$2
keystorePath="$configdir/jans/certs/jans-auth-keys.pkcs12"
scripts="$(dirname $0)/scripts.py"

if [ -z "$domain" ]; then
    domain="localhost:8080"
fi

failNoSalt() {
    if [ ! -f "$configdir/jans/conf/salt" ]; then
        exit 10
    fi
}

randomPassword() {
    echo $(head -c $1 /dev/urandom | base64 -w 0 | sed 's|[+/]|_|g')
}

obscure() {
    failNoSalt

    enckey=$(cat "$configdir/jans/conf/salt" | cut -d '=' -f 2 | xxd -p)
    echo $(echo -n "$1" | openssl des-ede3-ecb -e -a -K "$enckey" 2>/dev/null)
}

randomKey() {
    echo $(obscure $(randomPassword 33))
}

set_client() {
    baseId=$1
    placeholderId=$2
    clientFile=$3
    if grep -Fq $placeholderId "$clientFile"; then
        clientId=$baseId.$(uuidgen)
        sed -i "s|%($placeholderId)s|$clientId|" "$clientFile"
        echo "ClientId: $clientId"
    fi
}

set_secret() {
    placeholderId=$1
    file=$2

    secret=$(randomPassword 33)
    key=$(obscure "$secret")
    sed -i "s|%($placeholderId)s|$key|" "$file"
    echo "ClientSecret: $secret"
}

if [ ! -d "$configdir/jans" ]; then
    echo "$configdir/jans doesn't exist, you need to install jans-config!" >&2
    exit 2
fi

if [ "$(id -u)" != "0" ]; then
    echo "You need to be root to generate config!" >&2
    exit 3
fi

mkdir -p "$tmpdir/templates"
chmod 700 "$tmpdir"

if [ "$serviceName" = "auth" ]; then

    if [ ! -f $scripts ]; then
        echo "Didn't find scripts.py! Looked in $scripts" >&2
        exit 5
    fi

    if [ -f "$keystorePath" ]; then
        echo "keystore for jans-auth has already been generated!" >&2
        echo "If you really want to start over then delete $keystorePath" >&2
        exit 6
    fi

    if [ ! -f "$configdir/jans/conf/salt" ]; then
        echo "encodeSalt=$(randomPassword 18)" > "$configdir/jans/conf/salt"
        chmod o-r "$configdir/jans/conf/salt"
    fi

    keypsswd=$(randomPassword 18)
    keystore=$(java -Dlog4j.defaultInitOverride=true -cp "/usr/share/java/jans/jans-auth-client-jar-with-dependencies.jar" io.jans.as.client.util.KeyGenerator -keystore "$keystorePath" -keypasswd "$keypsswd" -sig_keys RS256 RS384 ES256K ES384 PS256 PS384 EdDSA -enc_keys RSA-OAEP-256 ECDH-ES+A192KW ECDH-ES+A256KW -key_ops_type ALL -dnname "CN=jansAuth CA Certificates" -expiration 2)

    adminId=$(uuidgen)
    sed -i "s|%(admin_inum)s|$adminId|" "$configdir/jans/templates/jans-auth/people.ldif"
    sed -i "s|%(admin_inum)s|$adminId|" "$configdir/jans/templates/jans-auth/groups.ldif"

    # auth
    configPath="$tmpdir/auth.ldif"
    cat "$configdir/jans/templates/base.ldif" > "$configPath"
    echo >> "$configPath"

    cat "$configdir/jans/templates/configuration.ldif" >> "$configPath"
    echo >> "$configPath"
    cat "$configdir/jans/templates/agama.ldif" >> "$configPath"
    echo >> "$configPath"
    cat "$configdir/jans/templates/attributes.ldif" >> "$configPath"
    echo >> "$configPath"
    cat "$configdir/jans/templates/scopes.ldif" >> "$configPath"
    echo >> "$configPath"

    cat "$configdir/jans/templates/jans-auth/role-scope-mappings.ldif" >> "$configPath"

    $scripts "$configdir/jans/templates/scripts.ldif" "/usr/share/jans/script-catalog" >> "$configPath"

    cat "$configdir/jans/templates/jans-auth/people.ldif" >> "$configPath"
    echo >> "$configPath"
    cat "$configdir/jans/templates/jans-auth/groups.ldif" >> "$configPath"
    echo >> "$configPath"

    cat "$configdir/jans/templates/jans-auth/configuration.ldif" >> "$configPath"
    cat "$configdir/jans/templates/jans-auth/o_metric.ldif" >> "$configPath"

    sed -i "s|%(authorization_challenge_authorizationchallenge)s|$(cat "/usr/share/jans/script-catalog/authorization_challenge/AuthorizationChallenge.java" | base64 -w 0)|" $configPath
    sed -i "s|%(introspection_role_based_scopes_update_token_role_based_scopes_update_token)s|$(cat "/usr/share/jans/script-catalog/introspection/role-based-scopes-update-token/role_based_scopes_update_token.py" | base64 -w 0)|" $configPath
    sed -i "s|%(dynamic_scope_dynamic_permission)s|$(cat "/usr/share/jans/script-catalog/dynamic_scope/dynamic-permission/dynamic_permission.py" | base64 -w 0)|" $configPath

    cp "$configdir/jans/templates/jans-auth/jans-auth-config.json" "$tmpdir/templates/"

    url="$domain/jans-auth"
    sed -i "s|%(hostname)s/jans-auth|$url|" "$tmpdir/templates/jans-auth-config.json"
    sed -i "s|%(hostname)s|$url|" "$tmpdir/templates/jans-auth-config.json"
    sed -i "s|%(oxauth_openid_jks_fn)s|$keystorePath|" "$tmpdir/templates/jans-auth-config.json"
    sed -i "s|%(oxauth_openid_jks_pass)s|$keypsswd|" "$tmpdir/templates/jans-auth-config.json"
    sed -i "s|%(pairwiseCalculationKey)s|$(head -c 33 /dev/urandom | base64 -w 0 | sed 's|[+/]||g')|" "$tmpdir/templates/jans-auth-config.json"
    sed -i "s|%(pairwiseCalculationSalt)s|$(head -c 33 /dev/urandom | base64 -w 0 | sed 's|[+/]||g')|" "$tmpdir/templates/jans-auth-config.json"

    sed -i "s|https:|http:|" "$tmpdir/templates/jans-auth-config.json"

    sed -i "s|%(role_scope_mappings)s|$(cat "$configdir/jans/templates/jans-auth/role-scope-mappings.json" | jq -c)|" "$configPath"
    sed -i "s|%(oxauth_config_base64)s|$(cat "$tmpdir/templates/jans-auth-config.json" | base64 -w 0)|" $configPath
    sed -i "s|%(oxauth_error_base64)s|$(cat "$configdir/jans/templates/jans-auth/jans-auth-errors.json" | base64 -w 0)|" $configPath
    sed -i "s|%(oxauth_static_conf_base64)s|$(cat "$configdir/jans/templates/jans-auth/jans-auth-static-conf.json" | base64 -w 0)|" $configPath
    sed -i "s|%(oxauth_openid_key_base64)s|$(echo -n $keystore | base64 -w 0)|" $configPath

    sed -i "s|jansScr::%(|jansScr: (|" "$configPath"

    echo "Config created in $configPath"

    password=$(head -c 33 /dev/urandom | base64 -w 0 | sed 's|[+/]|_|g')
    #passwordHash=$(echo "$password" | python -c 'from ldap3.utils.hashed import hashed, HASHED_SALTED_SHA512; print(hashed(HASHED_SALTED_SHA512, input()))')
    sed -i "s|%(encoded_admin_password)s|$password|" $configPath
    echo "Admin password: $password"
    password=


elif [ "$serviceName" = "scim" ]; then

    set_client 1201 scim_client_id "$configdir/jans/templates/jans-scim/clients.ldif"

    configPath="$tmpdir/scim.ldif"
    cat "$configdir/jans/templates/jans-scim/configuration.ldif" > "$configPath"
    cat "$configdir/jans/templates/jans-scim/scopes.ldif" >> "$configPath"
    echo >> "$configPath"
    cat "$configdir/jans/templates/jans-scim/clients.ldif" >> "$configPath"

    set_secret scim_client_encoded_pw "$configPath"

    cp "$configdir/jans/templates/jans-scim/dynamic-conf.json" "$tmpdir/templates/scim-dynamic-conf.json"

    sed -i "s|https://%(hostname)s/jans-scim|http://$domain/jans-scim|" "$tmpdir/templates/scim-dynamic-conf.json"
    sed -i "s|https://%(hostname)s|http://$domain/jans-auth|" "$tmpdir/templates/scim-dynamic-conf.json"

    sed -i "s|%(scim_dynamic_conf_base64)s|$(cat "$tmpdir/templates/scim-dynamic-conf.json" | base64 -w 0)|" "$configPath"
    sed -i "s|%(scim_static_conf_base64)s|$(cat "$configdir/jans/templates/jans-scim/static-conf.json" | base64 -w 0)|" "$configPath"

    echo "Config created in $configPath"

elif [ "$serviceName" = "config" ]; then

    clientId=1800.$(uuidgen)
    key=$(randomKey)

    testClientId=1802.$(uuidgen)
    testKey=$(randomKey)

    sed -i "s|\${jca_client_id}|$clientId|" "$configdir/jans/templates/jans-config-api/dynamic-conf.json"
    sed -i "s|%(jca_client_id)s|$clientId|" "$configdir/jans/templates/jans-config-api/clients.ldif"
    sed -i "s|%(test_client_id)s|$testClientId|" "$configdir/jans/templates/jans-config-api/testing-clients.ldif"

    configPath="$tmpdir/config-api.ldif"
    cat "$configdir/jans/templates/jans-config-api/config.ldif" > "$configPath"
    echo >> "$configPath"
    cat "$configdir/jans/templates/jans-config-api/scopes.ldif" >> "$configPath"
    cat "$configdir/jans/templates/jans-config-api/clients.ldif" >> "$configPath"
    echo >> "$configPath"
    cat "$configdir/jans/templates/jans-config-api/testing-clients.ldif" >> "$configPath"
    echo >> "$configPath"
    cp "$configdir/jans/templates/jans-config-api/dynamic-conf.json" "$tmpdir/templates/config-dynamic-conf.json"

    sed -i "s|%(jca_client_encoded_pw)s|$key|" "$configPath"
    sed -i "s|%(test_client_encoded_pw)s|$testKey|" "$configPath"

    sed -i "s|https://%(hostname)s/jans-auth/|http://$domain/jans-auth/|" "$tmpdir/templates/config-dynamic-conf.json"
    sed -i "s|https://%(hostname)s/|http://$domain/|" "$tmpdir/templates/config-dynamic-conf.json"

    sed -i "s|\${jca_client_encoded_pw}|$key|" "$tmpdir/templates/config-dynamic-conf.json"
    sed -i "s|%(config_api_dynamic_conf_base64)s|$(cat "$tmpdir/templates/config-dynamic-conf.json" | base64 -w 0)|" "$configPath"
    sed -i "s|%(hostname)s|$domain|" "$configPath"

    echo "Config created in $configPath"

elif [ "$serviceName" = "cli" ]; then

    set_client 2000 tui_client_id "$configdir/jans/templates/jans-cli/client.ldif"

    configPath="$tmpdir/cli.ldif"
    cat "$configdir/jans/templates/jans-cli/client.ldif" > "$configPath"

    set_secret tui_client_encoded_pw "$configPath"

    sed -i "s|%(hostname)s|$domain|" "$configPath"

    echo "Config created in $configPath"

elif [ "$serviceName" = "fido2" ]; then

    configPath="$tmpdir/fido2.ldif"
    cat "$configdir/jans/templates/jans-fido2/fido2.ldif" > "$configPath"
    cp "$configdir/jans/templates/jans-fido2/dynamic-conf.json" "$tmpdir/templates/fido2-dynamic-conf.json"
    sed -i "s|https://%(hostname)s/jans-fido2|http://$domain/jans-fido2|" "$tmpdir/templates/fido2-dynamic-conf.json"
    sed -i "s|%(hostname)s|$domain|" "$tmpdir/templates/fido2-dynamic-conf.json"
    sed -i "s|%(fido2_dynamic_conf_base64)s|$(cat "$tmpdir/templates/fido2-dynamic-conf.json" | base64 -w 0)|" "$configPath"
    sed -i "s|%(fido2_error_base64)s|$(cat "$configdir/jans/templates/jans-fido2/jans-fido2-errors.json" | base64 -w 0)|" "$configPath"
    sed -i "s|%(fido2_static_conf_base64)s|$(cat "$configdir/jans/templates/jans-fido2/static-conf.json" | base64 -w 0)|" "$configPath"

    echo "Config created in $configPath"

elif [ "$serviceName" = "link" ]; then

    configPath="$tmpdir/link.ldif"
    cat "$configdir/jans/templates/jans-link/configuration.ldif" > "$configPath"

    sed -i "s|%(jans_link_config_base64)s|$(cat "$configdir/jans/templates/jans-link/jans-link-config.json" | base64 -w 0)|" "$configPath"
    sed -i "s|%(jans_link_static_conf_base64)s|$(cat "$configdir/jans/templates/jans-link/jans-link-static-config.json" | base64 -w 0)|" "$configPath"

    echo "Config created in $configPath"

elif [ "$serviceName" = "saml" ]; then

    configPath="$tmpdir/saml.ldif"
    cat "$configdir/jans/templates/jans-saml/configuration.ldif" > "$configPath"
    cp "$configdir/jans/templates/jans-saml/jans-saml-config.json" "$tmpdir/templates/"
    cp "$configdir/jans/templates/jans-saml/kc_jans_api/jans.api-openid-client.json" "$tmpdir/templates/"

    clientId=jans-api-$(uuidgen)
    secret=$(randomPassword 33)
    password=$(randomPassword 33)

    sed -i "s|https://${keycloack_hostname}/kc|http://$domain/kc|" "$tmpdir/templates/jans-saml-config.json"

    sed -i "s|\${jans_idp_client_id}|$clientId|" "$tmpdir/templates/jans-saml-config.json"
    sed -i "s|\${jans_idp_client_id}|$clientId|" "$tmpdir/templates/jans.api-openid-client.json"
    sed -i "s|\${jans_idp_client_secret}|$secret|" "$tmpdir/templates/jans-saml-config.json"
    sed -i "s|\${jans_idp_client_secret}|$secret|" "$tmpdir/templates/jans.api-openid-client.json"
    sed -i "s|\${jans_idp_client_secret}|$secret|" "$tmpdir/templates/jans.api-openid-client.json"
    sed -i "s|\${jans_idp_user_password}|$password|" "$tmpdir/templates/jans-saml-config.json"

    sed -i "s|%(saml_dynamic_conf_base64)s|$(cat "$tmpdir/templates/jans-saml-config.json" | base64 -w 0)|" "$configPath"

    echo "Config created in $configPath"
    echo "Jans API ClientId: $clientId"
    echo "Jans API ClientSecret: $secret"
    echo "Jans API User Password: $password"

elif [ "$serviceName" = "lock" ]; then

    configPath="$tmpdir/lock.ldif"
    cat "$configdir/jans/templates/jans-lock/config.ldif" > "$configPath"

    sed -i "s|%(lock_dynamic_conf_base64)s|$(cat "$configdir/jans/templates/jans-lock/dynamic-conf.json" | base64 -w 0)|" "$configPath"
    sed -i "s|%(lock_error_base64)s|$(cat "$configdir/jans/templates/jans-lock/errors.json" | base64 -w 0)|" "$configPath"
    sed -i "s|%(lock_static_conf_base64)s|$(cat "$configdir/jans/templates/jans-lock/static-conf.json" | base64 -w 0)|" "$configPath"

    echo "Config created in $configPath"

elif [ "$serviceName" = "casa" ]; then

    clientId=1902.$(uuidgen)
    secret=$(randomPassword 33)
    key=$(obscure "$secret")

    sed -i "s|%(casa_client_id)s|$clientId|" "$configdir/jans/templates/jans-casa/casa-config.json"
    sed -i "s|%(casa_client_id)s|$clientId|" "$configdir/jans/templates/jans-casa/client.ldif"

    configPath="$tmpdir/casa.ldif"
    cat "$configdir/jans/templates/jans-casa/configuration.ldif" > "$configPath"
    cat "$configdir/jans/templates/jans-casa/client.ldif" >> "$configPath"
    echo >> "$configPath"
    $scripts "$configdir/jans/templates/jans-casa/person_authentication_script.ldif" "/usr/share/jans/script-catalog" db >> "$configPath"

    cp "$configdir/jans/templates/jans-casa/casa-config.json" "$tmpdir/templates/"

    path="$domain/jans-casa"
    sed -i "s|%(casa_redirect_uri)s|http://$path|" "$configPath"
    sed -i "s|%(casa_redirect_logout_uri)s|http://$path/postlogout|" "$configPath"
    sed -i "s|%(casa_frontchannel_logout_uri)s|http://$path/frontlogout|" "$configPath"
    sed -i "s|%(casa_client_encoded_pw)s|$key|" "$configPath"

    #sed -i 's|jansModuleProperty: {"value1":"location_type","value2":"ldap","description":""}|jansModuleProperty: {"value1":"location_type","value2":"file","description":""}\n|' "$configPath"
    #sed -i "s|%(casa_person_authentication_script)s|$(cat "/usr/share/jans/script-catalog/person_authentication/casa/Casa.py" | base64 -w 0)|" "$configPath"

    sed -i "s|%(hostname)s|$path|" "$tmpdir/templates/casa-config.json"
    sed -i "s|%(casa_redirect_uri)s|http://$path|" "$tmpdir/templates/casa-config.json"
    sed -i "s|%(casa_redirect_logout_uri)s|http://$path/postlogout|" "$tmpdir/templates/casa-config.json"
    sed -i "s|%(casa_frontchannel_logout_uri)s|http://$path/frontlogout|" "$tmpdir/templates/casa-config.json"
    sed -i "s|%(casa_client_pw)s|$secret|" "$tmpdir/templates/casa-config.json"

    sed -i "s|%(casa_config_base64)s|$(cat "$tmpdir/templates/casa-config.json" | base64 -w 0)|" "$configPath"

    echo "Config created in $configPath"

else
    echo "Unrecognized service name '$serviceName'!" >&2
    exit 4
fi
