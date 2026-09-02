#!/bin/sh
set -e

# 2. Load user-defined flags
# The script checks for flags in the following order (later files override/append to earlier ones):
# 1. System-wide Electron flags: $XDG_CONFIG_HOME/electron-flags.conf
# 2. App-specific global flags: $XDG_CONFIG_HOME/@appname@-flags.conf
# 3. App-specific directory flags: $XDG_CONFIG_HOME/@cfgdirname@/@appname@-flags.conf
flags=""
for _FLAGS_FILE in \
    "${XDG_CONFIG_HOME}/electron-flags.conf" \
    "${XDG_CONFIG_HOME}/@appname@-flags.conf" \
    "${XDG_CONFIG_HOME}/@cfgdirname@/@appname@-flags.conf"
do
    if [ -f "$_FLAGS_FILE" ]; then
        echo "Loading flags from $_FLAGS_FILE"
        _file_flags="$(grep -v '^[[:space:]]*#' "$_FLAGS_FILE" | grep -v '^[[:space:]]*$')"
        if [ -n "$_file_flags" ]; then
            if [ -z "$flags" ]; then
                flags="$_file_flags"
            else
                flags="$flags $_file_flags"
            fi
        fi
    fi
done

exec /opt/@appname@/@appname@ $flags "$@"
