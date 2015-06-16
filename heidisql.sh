#!/bin/bash

progName="heidisql"
progRealPath="/usr/share/$progName"
if [ -n "$HEIDISQL_HOME" ]; then
    progHome="$HEIDISQL_HOME"
else
    progHome="$HOME/.$progName"
fi
progBin="$progName.exe"

# Create folder
mkdir -p "$progHome" >/dev/null 2>&1

# Create read-only symlinks
ln -s "$progRealPath/$progBin" "$progHome/$progBin" >/dev/null 2>&1
ln -s "$progRealPath/readme.txt" "$progHome/readme.txt" >/dev/null 2>&1
ln -s "$progRealPath/libmysql.dll" "$progHome/libmysql.dll" >/dev/null 2>&1

# Create a blank config file (otherwise HeidiSQL stores its settings in the Windows Registry)
if [ -n "$XDG_CONFIG_HOME" ]; then
    mkdir -p "$XDG_CONFIG_HOME/$progName" >/dev/null 2>&1
    touch "$XDG_CONFIG_HOME/$progName/portable_settings.txt"
    ln -s "$XDG_CONFIG_HOME/$progName/portable_settings.txt" "$progHome/portable_settings.txt" >/dev/null 2>&1
else
    touch "$progHome/portable_settings.txt"
fi

# If default wineprefix defined - run from it
if [ -n "$WINEPREFIX" ]; then
    WINEDEBUG=-all WINEPREFIX="$WINEPREFIX" wine "$progHome/$progBin" "$@"
else
    WINEDEBUG=-all wine "$progHome/$progBin" "$@"
fi