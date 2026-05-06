#!/bin/sh

# shellcheck disable=SC2181

ENTRYPOINT_HASH="INSERT_ENTRYPOINT_HASH_HERE"
OPENASAR_HASH="INSERT_OPENASAR_HASH_HERE"
EQUICORD_HASH="INSERT_EQUICORD_HASH_HERE"

CHANNEL=stable
DOWNLOAD=https://updates.discord.com/
DIR=discord
EXE=Discord
BOOTSTRAP_SUFFIX=equicord/updater_bootstrap

config_home=$XDG_CONFIG_HOME
if [ -z "$config_home" ]; then
    config_home=$HOME/.config
fi

discord_host=$config_home/$DIR/$EXE

if [ ! -x "$discord_host" ]; then
    mkdir -p "$config_home/$DIR"
    if [ ! -d "$config_home/$DIR" ]; then
        echo "Fatal error, failed to create $DIR in $config_home" >&2
        exit 1
    fi
    if [ -t 1 ]; then
        zenity=--no-zenity
    else
        zenity=--zenity
    fi
    bootstrap=/usr/share/$BOOTSTRAP_SUFFIX
    if [ ! -x "$bootstrap" ]; then
        bootstrap=/opt/$BOOTSTRAP_SUFFIX
        if [ ! -x "$bootstrap" ]; then
            bootstrap="$(dirname -- "$0")/updater_bootstrap"
        fi
    fi

    app_dir=$("$bootstrap" $zenity "$config_home/$DIR" $CHANNEL "$DOWNLOAD")
    if [ "$?" = "0" ]; then
        echo "Bootstrap complete"
        ln -fs "$config_home/$DIR/$app_dir/$EXE" "$discord_host"
        exec "$0" "$@"
    else
        echo "Bootstrap failed or was canceled"
        exit 2
    fi
fi

RESOURCES="$(dirname "$(readlink "$discord_host")")/resources"
(
    cd "$RESOURCES" || {
        echo "Error: Could not enter directory [$RESOURCES]"
        exit 1
    }

    EQ_PATH="/usr/share/equicord"

    ENTRYPOINT_HASH_NEW="$(sha256sum app.asar | awk '{print $1}')"
    OPENASAR_HASH_NEW="$(sha256sum _app.asar | awk '{print $1}')"
    EQUICORD_HASH_NEW="$(sha256sum equicord.asar | awk '{print $1}')"

    if [ "$ENTRYPOINT_HASH_NEW" != "$ENTRYPOINT_HASH" ]; then
      cp "$EQ_PATH/app.asar" .
    fi

    if [ "$OPENASAR_HASH_NEW" != "$OPENASAR_HASH" ]; then
      cp "$EQ_PATH/openasar.asar" _app.asar
    fi

    if [ "$EQUICORD_HASH_NEW" != "$EQUICORD_HASH" ]; then
      cp "$EQ_PATH/equicord.asar" .
    fi
)

exec "$discord_host" "$@"
