#!/bin/bash
URI_TO_OPEN="$1"

if ! [ "${URI_TO_OPEN:0:8}" == "jsbridge" ]; then
    /real-xdg-open "$URI_TO_OPEN"
fi
