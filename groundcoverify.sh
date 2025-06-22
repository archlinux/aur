#!/usr/bin/env bash

ARGS="${*}"
PREV_DIR=$(pwd)
RUN_DIR=${HOME}/.config/openmw
OUT_DIR=${HOME}/.local/share/openmw/data

# Ensure data-local exists to output to. This is just the default location, and could be changed
# By specifying an openmw.cfg location, or changing the location in groundcoverify.toml in $HOME/.config/openmw
mkdir -p "${OUT_DIR}"

cd "${RUN_DIR}" || exit 1

# If the configuration file does not exist, copy it to the user's directory
# and assign the appropriate output location
if [ ! -r "groundcoverify.toml" ]; then
    cp /usr/share/groundcoverify/groundcoverify.toml .
    sed -i "s|# output_directory = \".\"|output_directory = \"${OUT_DIR}\"|" "groundcoverify.toml"
fi

/usr/share/groundcoverify/groundcoverify.py "$@" #"${ARGS}"

cd "${PREV_DIR}" || exit