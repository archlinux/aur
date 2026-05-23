#!/usr/bin/bash

CHATLAB_CONFIG_DIR="${HOME}/.chatlab"
CHATLAB_USER_FLAGS_FILE="${CHATLAB_CONFIG_DIR}/user-flags.conf"

# Allow users to override command-line options
if [[ -f "${CHATLAB_USER_FLAGS_FILE}" ]]; then
    CHATLAB_USER_FLAGS=$(grep -v '^#' "$CHATLAB_USER_FLAGS_FILE")
fi

# Launch
exec /usr/bin/_ELECTRON_VERSION_ /usr/lib/chatlab/desktop/app.asar $CHATLAB_USER_FLAGS "$@"
