#!/bin/bash

export UT_DATA_PATH="/opt/unreal-tournament"
export UT_USER_PATH="$HOME/.utpg"

if [ ! -d "$UT_USER_PATH" ]; then
    mkdir -p "$UT_USER_PATH/System"
    
    # Copy default config files from User/ directory (Unified location for GOG/Steam/ISO)
    if [ -d "$UT_DATA_PATH/User" ]; then
        cp "$UT_DATA_PATH/User/"* "$UT_USER_PATH/System/"
    fi
    if [ -d "$UT_DATA_PATH/UserPatch" ]; then
        cp "$UT_DATA_PATH/UserPatch/"* "$UT_USER_PATH/System/"
    fi
fi


# Launch the game.
cd "$UT_DATA_PATH/System"
BINARY="./ut-bin"

if [ -f "$BINARY" ]; then
    exec "$BINARY" -homedir "$@"
else
    echo "Error: Binary not found: $BINARY in $(pwd)"
    exit 1
fi
