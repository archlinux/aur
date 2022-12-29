#!/bin/bash
URI_TO_OPEN="$1"

if [ "${URI_TO_OPEN:0:4}" == "http" ]; then
    /snapd-xdg-open "$URI_TO_OPEN"
else
    /real-xdg-open "$URI_TO_OPEN"
fi
