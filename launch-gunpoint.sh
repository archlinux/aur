#!/bin/bash

# This is a wrapper that works around the application's single-user design for multi-user systems.

set -e
set -u

game_dir="/opt/gunpoint"
: ${XDG_DATA_HOME:=$HOME/.local/share}
user_dir="$XDG_DATA_HOME/gunpoint"

make_user_dir() {
    echo "Creating a user directory for the game. This only needs to be done once, future runs will skip this step."

    mkdir -p "$user_dir/"

    # Read-only
    ln -s -t "$user_dir/" "$game_dir/Gunpoint" "$game_dir/Gunpoint.wad" "$game_dir/Levels" "$game_dir/Music" "$game_dir/Scripts"

    # Read/Write
    # Savegames and Settings created by game on first launch

    echo "User directory has been created."
}

launch_game() {
    cd "$user_dir"
    ./Gunpoint
}

if [ ! -f "$user_dir/Gunpoint" ]
then
    make_user_dir
fi

launch_game
