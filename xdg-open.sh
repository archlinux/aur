#!/bin/bash
URI_TO_OPEN="$1"

if ! [ "${URI_TO_OPEN:0:8}" == "jsbridge" ]; then
    if [ "${URI_TO_OPEN:0:4}" == "http" ]; then
        /snapd-xdg-open "$URI_TO_OPEN"
    else
        /flatpak-xdg-open "$URI_TO_OPEN"
    fi
fi
