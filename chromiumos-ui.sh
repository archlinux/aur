#!/bin/bash

USER_DATA_DIR=$HOME/.config/chromiumos-ui
FLASH_DIR=/usr/lib/PepperFlash
FLASH_LIB=$FLASH_DIR/libpepflashplayer.so
FLASH_MANIFEST=$FLASH_DIR/manifest.json
GOOGLE_KEYFILE=$HOME/.googleapikeys
GOOGLE_KEYNAMES=(google_{api_key,default_client_{id,secret}})

json2vars() {
    local IFS=,
    jq -r "{$*}"' | to_entries | map("\(.key)=\(.value | @sh)") | .[]'
}

keys2json() {
    echo '{'
    sed -e "s/\"/\\\\\"/g;s/'/\"/g" | \
        tr "\n" " " | \
        sed -e "s/,[[:space:]]*$//"
    echo '}'
}

# Allow users to override command-line options
# Based on Gentoo's chromium package (and by extension, Debian's)
if [[ -f /etc/chromiumos-ui/default ]]; then
    . /etc/chromiumos-ui/default
fi

# Prefer user defined CHROMIUM_USER_FLAGS (from env) over system
# default CHROMIUM_FLAGS (from /etc/chromiumos-ui/default)
CHROMIUM_FLAGS=${CHROMIUM_USER_FLAGS:-$CHROMIUM_FLAGS}

# Use separate profile for Google logins
if [[ "$1" == "--login" ]]; then
    shift
    use_login_manager=yes
    use_login_profile=yes
fi

# Auto-login last user if requested
if [[ "$1" == "--lastuser" ]]; then
    shift
    # Check if user has ever logged into Google account before
    if [[ -d "$USER_DATA_DIR/user" ]]; then
        # Get last logged-in user
        user=$(sed -nr \
                   -e 's/^\s*"LastLoggedInRegularUser": "([^"]*)",/\1/p' \
                   "$USER_DATA_DIR/Local State")
        # Check for stub user
        if [[ "$user" == "stub-user@example.com" ]]; then
            # Fallback to using the login manager
            user=
        else
            # Auto login user
            use_login_manager=
        fi
    fi
fi

# Auto-detect Flash player support
if [ -f $FLASH_LIB ]; then
    eval $(json2vars version < $FLASH_MANIFEST)
    CHROMIUM_FLAGS="$CHROMIUM_FLAGS --ppapi-flash-path=$FLASH_LIB --ppapi-flash-version=$version"
fi

# Use Google API keys if available
if [ -f $GOOGLE_KEYFILE ]; then
    eval $(keys2json < $GOOGLE_KEYFILE | json2vars ${GOOGLE_KEYNAMES[@]})
    for var in ${GOOGLE_KEYNAMES[@]}; do
        eval export ${var^^}="\$$var"
    done
fi

exec /usr/lib/chromiumos-ui/chrome \
     $CHROMIUM_FLAGS \
     --user-data-dir=$USER_DATA_DIR \
     ${use_login_profile:+--login-profile=user} \
     ${use_login_manager:+--login-manager} \
     ${user:+--login-user=}$user \
     "$@"
