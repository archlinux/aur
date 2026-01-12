#!/bin/bash
# ==============================================================================
# Hytale Launcher Wrapper for Arch Linux
#
# Author:      [SCDevel/root@scdevel.net]
# License:     MIT
# Description: Gathers system information for debugging purposes.
#
# Disclaimer:  This script is an unofficial community tool and is not
#              affiliated with, endorsed by, or owned by Hypixel Studios Canada.
# ==============================================================================

#!/bin/bash
HYTALE_FOLDER="$HOME/.local/share/Hytale"
TEMP_DEBUG="/tmp/hytale-debug-$(date +%s).txt"

echo "Collecting system information... please wait."
echo ""

{
echo "--- Hytale Debugger ---"
echo "Generated on: $(date)"
echo "-----------------------"

echo ""

echo "--- Java Information ---"
echo "JAVA_HOME: $JAVA_HOME"
echo "Default Java: $(which java)"
java -version 2>&1 | head -n 1
echo "Installed Java Versions:"
ls -1 /usr/lib/jvm/

echo ""
echo "--- Kernel Information ---"
uname -a

echo ""
echo "--- Graphics Information ---"
echo "Windowing System: $XDG_SESSION_TYPE"
echo "NVIDIA Driver Version: $(cat /proc/driver/nvidia/version 2>/dev/null || echo "Not Found")"
glxinfo | grep "OpenGL renderer" || echo "glxinfo not found. Install 'mesa-utils'."

echo ""
echo "--- Environment Variables ---"
echo "PATH: $PATH"
echo "__NV_DISABLE_EXPLICIT_SYNC: $__NV_DISABLE_EXPLICIT_SYNC"
echo "WEBKIT_DISABLE_DMABUF_RENDERER: $WEBKIT_DISABLE_DMABUF_RENDERER"

echo ""
echo "--- Launcher Permissions ---"
ls -lh "$HYTALE_FOLDER/install/release/package/launcher/current/hytale-launcher"

#echo ""
#echo "--- Hytale Permissions ---"
#ls -lh "$HYTALE_FOLDER/install/release/package/hytale?"

echo ""
echo "--- Launcher Log from last launch ---"
tac "$HYTALE_FOLDER/hytale-launcher.log" | sed -n '1,/starting hytale-launcher/p' | tac

# I have no idea if this will actually exist but it's worth a shot.
#echo ""
#echo "--- Hytale Log ---"
#cat "$HYTALE_FOLDER/hytale.log"

} > "$TEMP_DEBUG"

cat "$TEMP_DEBUG"

echo "----------------------"

read -p "Would you like to upload this debug info to 0x0.st? (y/N): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Uploading to 0x0.st..."


    PASTE_URL=$(curl -s -F "file=@$TEMP_DEBUG" https://0x0.st)

    if [[ $PASTE_URL == http* ]]; then
        echo "Upload Successful!"
        echo "Share this link for support: $PASTE_URL"
        echo "Deleting the Temporary File..."
        rm "$TEMP_DEBUG"
    else
        echo "Upload failed. Your debug info remains at: $TEMP_DEBUG"
        echo "You can manually delete it or copy the text above."
        exit 0
    fi
else
    echo "Upload cancelled. Your debug info remains at: $TEMP_DEBUG"
    echo "You can manually delete it or copy the text above."
fi
