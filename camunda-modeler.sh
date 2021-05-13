#!/bin/sh

PRG=$0
while [ -h "$PRG" ]; do
    ls=$(ls -ld "$PRG")
    link=$(expr "$ls" : '^.*-> \(.*\)$' 2>/dev/null)
    if expr "$link" : '^/' 2> /dev/null >/dev/null; then
        PRG="$link"
    else
        PRG="$(dirname "$PRG")/$link"
    fi
done

PRG="$(dirname "$PRG")/camunda-modeler"
session_type="${XDG_SESSION_TYPE:-x11}"
if [ "$session_type" = "wayland" ]
then
    "$PRG" --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
else
    "$PRG" "$@"
fi
