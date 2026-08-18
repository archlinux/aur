#!/bin/sh

# https://github.com/flathub/com.discordapp.Discord/wiki/Rich-Precense-(discord-rpc)
for i in {0..9}; do
    test -S $XDG_RUNTIME_DIR/discord-ipc-$i || ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

mkdir -p "$XDG_CONFIG_HOME/bar"

electron42 /usr/share/beyondallreason/app.asar --disable-launcher-update -w $XDG_DATA_HOME/BeyondAllReason -c /usr/share/beyondallreason/config.json "$@"
