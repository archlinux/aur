#!/bin/bash

APP_NAME="fightcade2"
SYSTEM_DIR="/opt/${APP_NAME}"
USER_DIR="${HOME}/.${APP_NAME}"
SYSTEM_VERSION_FILE="${SYSTEM_DIR}/VERSION.txt"
USER_VERSION_FILE="${USER_DIR}/VERSION.txt"

mkdir -p "$USER_DIR"

is_update_needed() {
    if [ ! -f "$USER_VERSION_FILE" ]; then
        return 0
    fi

    SYSTEM_VER=$(cat "$SYSTEM_VERSION_FILE")
    USER_VER=$(cat "$USER_VERSION_FILE")

    if [ "$SYSTEM_VER" != "$USER_VER" ]; then
        return 0
    fi

    return 1
}

if is_update_needed; then
    echo "Fightcade: First run or new version detected. Syncing files to ${USER_DIR}..."
    rsync -av --delete "${SYSTEM_DIR}/" "${USER_DIR}/"
    echo "Sync complete."
fi

cd "$USER_DIR"
exec ./Fightcade2.sh "$@"
