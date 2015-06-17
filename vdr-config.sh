#!/bin/bash

case "$1" in
    --version)
        pkg-config vdr --modversion
        ;;
    --*dir|--apiversion|--user|--group)
        pkg-config vdr --variable=${1#--}
        ;;
    *)
        echo "Error: unknown option '$1'." >&2
        exit 1
        ;;
esac
