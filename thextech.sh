#!/bin/bash

OLD_DIR_1="$HOME/.thextech-smbx"
OLD_DIR_2="$HOME/.thextech-aod"
NEW_DIR="${XDG_DATA_HOME:-"$HOME/.local/share"}/TheXTech"

migrate() {
    local old_dir=$1

    if [ -L "$old_dir" ]; then
        return
    fi

    if [ -d "$old_dir" ]; then
        echo "Old game data dir found：$old_dir"

        if [ ! -d "$NEW_DIR" ]; then
            mkdir -p "$NEW_DIR"
        fi

        mv "$old_dir"/* "$NEW_DIR/"
        rmdir "$old_dir"
        echo "Moved to new location：$NEW_DIR"
    fi
}

migrate "$OLD_DIR_1"
migrate "$OLD_DIR_2"

exec /usr/lib/thextech/thextech "$@"
