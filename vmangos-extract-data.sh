#!/bin/bash
set -e
trap 'cleanup_and_exit' INT TERM HUP

BIN_DIR="/usr/share/vmangos/Extractors"
DATA_DIR="/var/lib/vmangos"

main () {
    check_user
    run_extractors
    cleanup_and_exit
}

echoerr () {
    echo "$@" 1>&2
}

check_user () {
    if [[ "$(whoami)" != "vmangos" ]]; then
        echoerr "This script must be run as the vmangos user:"
        echoerr "      $ sudo -u vmangos /usr/share/vmangos/vmangos-extract-data.sh"
        exit 1
    fi
}

run_extractors () {
    "$BIN_DIR/MapExtractor" -o "$DATA_DIR" && echo "Maps & DBC extracted"

    cd "$DATA_DIR" || { echoerr "Failed to change directory to $DATA_DIR"; exit 1; }

    "$BIN_DIR/VMapExtractor" -d "$OLDPWD/Data" && echo "VMaps extracted"
    "$BIN_DIR/VMapAssembler" && echo "VMaps assembled"
    "$BIN_DIR/MoveMapGenerator" \
        --threads "$(nproc)" \
        --silent \
        --configInputPath "$BIN_DIR/config.json" \
        --offMeshInput "$BIN_DIR/offmesh.txt"

    cd - > /dev/null || { echoerr "Failed to navigate to original directory"; exit 1; }
}

cleanup_and_exit () {
    [[ -d "$DATA_DIR/dbc" ]] && mv "$DATA_DIR/dbc" "$DATA_DIR/5875/dbc"
    [[ -d "$DATA_DIR/Buildings" ]] && rm -r "$DATA_DIR/Buildings"
    [[ -d "$DATA_DIR/Cameras" ]] && rm -r "$DATA_DIR/Cameras"
    exit 0
}

main "$@"

