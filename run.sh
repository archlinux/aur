#!/bin/sh

# https://github.com/flathub/com.discordapp.Discord/wiki/Rich-Precense-(discord-rpc)
for i in {0..9}; do
    test -S $XDG_RUNTIME_DIR/discord-ipc-$i || ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$XDG_CONFIG_HOME/bar"

/opt/beyondallreason/beyond-all-reason --disable-launcher-update -w $XDG_CONFIG_HOME/bar -c /opt/beyondallreason/config.json "$@"
