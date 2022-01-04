#!/bin/sh
SCRIPT=$(basename "$0")
OPTIONS=$(getopt -o h -l help -n "$SCRIPT" -- "$@")
if [ $? != 0 ]; then exit 1; fi
eval set -- "$OPTIONS"

while true; do
    case "$1" in
    -h | --help )
        echo "$SCRIPT [-h] <infile> <outfile>"
        exit 0
        ;;
    --) shift; break;;
    esac
    shift
done

exec /usr/bin/mono /opt/YTSubConverter/YTSubConverter.exe $@
