#!/usr/bin/env bash

# Set Wine prefix to custom location, for better compatability
export WINEPREFIX="$HOME/.local/share/undertalemodtool"

# Make directory for Wine prefix if doesn't exist
if [ ! -d "$WINEPREFIX" ]; then
    mkdir -p "$WINEPREFIX"
fi

# If session is Wayland and file "$WINEPREFIX/forceX" doesn't exit, force Wayland mode
if [[ "$XDG_SESSION_TYPE" == "wayland" &&  ! -f "$WINEPREFIX/forceX" ]]; then
    export DISPLAY= 
fi

# Launch
WINE_D3D_CONFIG="renderer=gdi" wine /opt/undertalemodtool/UndertaleModTool.exe "$1"