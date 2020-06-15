#!/usr/bin/bash

export WINEARCH="${REPLACE_WINEARCH}"
export WINEPREFIX="${REPLACE_WINEPREFIX}"

wine /opt/tagscanner/Tagscan.exe
