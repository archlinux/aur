#!/usr/bin/bash

export WINEARCH=win32
export WINEPREFIX="${REPLACE_WINEPREFIX}"

wine /opt/halcogen/HALCOGEN.exe
