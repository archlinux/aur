#!/bin/sh
set -e

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Load user-defined flags
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
