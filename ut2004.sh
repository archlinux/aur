#! /bin/bash

# Setup user directory if needed.
if [ ! -d "$HOME"/.ut2004 ] ; then
   mkdir -p "$HOME"/.ut2004/System
   
   # Copy default config files from User/ directory. (Unified location for GOG/Steam/ISO)
   if [ -d "/opt/ut2004/User" ]; then
       cp /opt/ut2004/User/* "$HOME"/.ut2004/System/
   fi
   
   # Handle GOG-specific CD key if present.
   if [ -f "/opt/ut2004/GOG/goggame-1207658691.script" ]; then
       grep -FB1 CDKey /opt/ut2004/GOG/goggame-1207658691.script | grep -Po '"valueData": "\K[A-Z0-9-]*(?=",)' > "$HOME"/.ut2004/System/CDkey
       chmod 600 "$HOME"/.ut2004/System/CDkey
   fi
fi

# Launch the game.
cd /opt/ut2004/System
BINARY="./UT2004"

if [ -f "$BINARY" ]; then
    exec "$BINARY" "$@"
else
    echo "Error: Binary not found: $BINARY in $(pwd)"
    exit 1
fi
