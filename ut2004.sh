#! /bin/bash

# Setup user directory if needed (GOG specific CD key extraction)
if [ ! -d "$HOME"/.ut2004 ] ; then
   mkdir -p "$HOME"/.ut2004/System
   if [ -f "/opt/ut2004/__support/app/System/" ]; then
       cp /opt/ut2004/__support/app/System/* "$HOME"/.ut2004/System/
   fi
   if [ -f "/opt/ut2004/goggame-1207658691.script" ]; then
       grep -FB1 CDKey /opt/ut2004/goggame-1207658691.script | grep -Po '"valueData": "\K[A-Z0-9-]*(?=",)' > "$HOME"/.ut2004/System/CDkey
       chmod 600 "$HOME"/.ut2004/System/CDkey
   fi
fi

# Architecture detection and path selection
ARCH=$(uname -m)
if [ "$ARCH" == "aarch64" ]; then
    cd /opt/ut2004/SystemARM64
    BINARY="./UT2004"
else
    # Default to x86_64 System folder
    cd /opt/ut2004/System
    BINARY="./UT2004"
fi

# Launch the game
if [ -f "$BINARY" ]; then
    exec "$BINARY" "$@"
else
    echo "Error: Binary not found: $BINARY in $(pwd)"
    exit 1
fi
