#!/bin/sh
export WINEPREFIX=$HOME/.ltspice/env WINEARCH=wine64
wine hh /usr/share/doc/ltspice/ltspice.chm "$@"
