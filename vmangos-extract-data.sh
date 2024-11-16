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

check_user () {
    if [[ $(whoami) != vmangos ]]; then
        >&2 echo "This script must be run as the vmangos user:"
        >&2 echo "      $ sudo -u vmangos /usr/share/vmangos/vmangos-extract-data.sh"
        exit 1
    fi
}

run_extractors () {
    "$BIN_DIR/MapExtractor" -o "$DATA_DIR" && echo "Maps & DBC extracted"

    pushd "$DATA_DIR" > /dev/null
    "$BIN_DIR/VMapExtractor" -d "$OLDPWD/Data" && echo "VMaps extracted"
    "$BIN_DIR/VMapAssembler" && echo "VMaps assembled"

    "$BIN_DIR/MoveMapGenerator" --silent --configInputPath "$BIN_DIR/config.json" --offMeshInput "$BIN_DIR/offmesh.txt" 0 &
    "$BIN_DIR/MoveMapGenerator" --silent --configInputPath "$BIN_DIR/config.json" --offMeshInput "$BIN_DIR/offmesh.txt" 1 &
    "$BIN_DIR/MoveMapGenerator" --silent --configInputPath "$BIN_DIR/config.json" --offMeshInput "$BIN_DIR/offmesh.txt" --skipContinents &
    wait && echo "Movemaps generated"
    popd > /dev/null
}

kill_jobs () {
    for pid in $(jobs -p); do
        kill "$pid"
    done
}

cleanup_and_exit () {
    kill_jobs
    [[ -d "$DATA_DIR/dbc" ]] && mv "$DATA_DIR/dbc" "$DATA_DIR/5875/dbc"
    rm -rf "$DATA_DIR/Buildings"
    rm -rf "$DATA_DIR/Cameras"
    exit 0
}

main "$@"

