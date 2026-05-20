#!/usr/bin/bash

CHATLAB_CONFIG_DIR="${HOME}/.chatlab"
CHATLAB_USER_FLAGS_FILE="${CHATLAB_CONFIG_DIR}/user-flags.conf"
CHATLAB_NLP_DICT_DIR="${CHATLAB_CONFIG_DIR}/data/nlp"
DICT_DOWNLOAD_URL_BASE='https://chatlab.fun/assets/nlp'

if [[ ! -d "${CHATLAB_NLP_DICT_DIR}" ]]; then
    mkdir -p "${CHATLAB_NLP_DICT_DIR}"
fi

for dict in zh-CN zh-TW; do
    if [[ ! -f "${CHATLAB_NLP_DICT_DIR}/${dict}.dict" ]]; then
        curl -fsSL -o "${CHATLAB_NLP_DICT_DIR}/${dict}.dict" "${DICT_DOWNLOAD_URL_BASE}/${dict}.dict"
    fi
done

# Allow users to override command-line options
if [[ -f "${CHATLAB_USER_FLAGS_FILE}" ]]; then
    CHATLAB_USER_FLAGS=$(grep -v '^#' "$CHATLAB_USER_FLAGS_FILE")
fi

# Launch
exec /usr/bin/_ELECTRON_VERSION_ /usr/lib/chatlab/app.asar $CHATLAB_USER_FLAGS "$@"
