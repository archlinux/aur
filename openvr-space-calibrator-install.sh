#!/bin/bash

set -e

USER_HOME="${1:-$HOME}"

if [ -z "$USER_HOME" ] || [ "$USER_HOME" = "/root" ]; then
    if [ -n "$SUDO_USER" ]; then
        USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
    elif [ -n "$REAL_USER" ]; then
        USER_HOME=$(getent passwd "$REAL_USER" | cut -d: -f6)
    else
        REAL_USER=$(who am i 2>/dev/null | awk '{print $1}' || echo "")
        if [ -n "$REAL_USER" ]; then
            USER_HOME=$(getent passwd "$REAL_USER" | cut -d: -f6)
        fi
    fi
fi

if [ -z "$USER_HOME" ] || [ "$USER_HOME" = "/root" ]; then
    echo "Error: Could not determine user home directory. Please run as: openvr-space-calibrator-install /home/username" >&2
    exit 1
fi

if [ ! -d "$USER_HOME" ]; then
    echo "Error: User home directory does not exist: $USER_HOME" >&2
    exit 1
fi

STEAMVR_DRIVERS_DIR="$USER_HOME/.local/share/SteamVR/drivers/01spacecalibrator"
PKG_DIR="/usr/lib/openvr-space-calibrator-linux"

if [ ! -d "$PKG_DIR" ]; then
    echo "Error: Package files not found at $PKG_DIR"
    echo "Please ensure openvr-space-calibrator-linux is installed."
    exit 1
fi

mkdir -p "$STEAMVR_DRIVERS_DIR/bin/linux64"

echo "Installing Space Calibrator to SteamVR for $USER_HOME..."

OWNER_USER=$(stat -c '%U' "$USER_HOME" 2>/dev/null || echo "")
OWNER_GROUP=$(stat -c '%G' "$USER_HOME" 2>/dev/null || echo "")

cp "$PKG_DIR/driver_01spacecalibrator.so" "$STEAMVR_DRIVERS_DIR/bin/linux64/"

# Copy binary to SteamVR directory (this is where it needs to run from)
if [ -f "$PKG_DIR/space-calibrator" ]; then
    cp "$PKG_DIR/space-calibrator" "$STEAMVR_DRIVERS_DIR/bin/linux64/"
elif [ -f "/usr/bin/space-calibrator" ]; then
    cp "/usr/bin/space-calibrator" "$STEAMVR_DRIVERS_DIR/bin/linux64/"
else
    echo "Error: space-calibrator binary not found" >&2
    exit 1
fi
chmod +x "$STEAMVR_DRIVERS_DIR/bin/linux64/space-calibrator"

cp "$PKG_DIR/manifest.vrmanifest" "$STEAMVR_DRIVERS_DIR/bin/linux64/"

if [ -f "$PKG_DIR/actions.json" ]; then
    cp "$PKG_DIR/actions.json" "$STEAMVR_DRIVERS_DIR/bin/linux64/"
else
    echo "Warning: actions.json not found at $PKG_DIR/actions.json - playspace movement bindings may not work" >&2
fi
cat > "$STEAMVR_DRIVERS_DIR/driver.vrdrivermanifest" << 'DRIVER_MANIFEST_EOF'
{
	"alwaysActivate": true,
	"name" : "01spacecalibrator",
	"directory" : "",
	"resourceOnly" : false,
	"activateOtherDriversWhenEnabled" : true
}
DRIVER_MANIFEST_EOF
cp -r "$PKG_DIR/resources" "$STEAMVR_DRIVERS_DIR/"

if [ -n "$OWNER_USER" ] && [ "$(id -u)" -eq 0 ]; then
    chown -R "$OWNER_USER:$OWNER_GROUP" "$STEAMVR_DRIVERS_DIR" 2>/dev/null || true
fi

VRPATHREG=""
for path in \
    "$USER_HOME/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrpathreg" \
    "$USER_HOME/.steam/steam/steamapps/common/SteamVR/bin/linux64/vrpathreg" \
    "$USER_HOME/.steam/root/steamapps/common/SteamVR/bin/linux64/vrpathreg" \
    "/usr/local/bin/vrpathreg" \
    "/usr/bin/vrpathreg"; do
    if [ -f "$path" ]; then
        VRPATHREG="$path"
        break
    fi
done

if [ -z "$VRPATHREG" ] && command -v vrpathreg &> /dev/null; then
    VRPATHREG="vrpathreg"
fi

if [ -n "$VRPATHREG" ]; then
    OPENVR_LIB=""
    if [ -f "$VRPATHREG" ]; then
        OPENVR_LIB="$(dirname "$VRPATHREG")"
    fi
    
    echo "Registering driver with SteamVR..."
    if [ -n "$OPENVR_LIB" ] && [ "$OPENVR_LIB" != "." ]; then
        if LD_LIBRARY_PATH="$OPENVR_LIB:$LD_LIBRARY_PATH" "$VRPATHREG" adddriver "$STEAMVR_DRIVERS_DIR" 2>&1; then
            echo "Driver registered with SteamVR"
        else
            REGISTER_ERROR=$?
            echo "Note: Driver registration returned error code $REGISTER_ERROR (may already be registered or SteamVR not running)"
        fi
    else
        if "$VRPATHREG" adddriver "$STEAMVR_DRIVERS_DIR" 2>&1; then
            echo "Driver registered with SteamVR"
        else
            REGISTER_ERROR=$?
            echo "Note: Driver registration returned error code $REGISTER_ERROR (may already be registered or SteamVR not running)"
        fi
    fi
else
    echo "Warning: vrpathreg not found - manual registration may be required"
    echo "Driver files installed, but driver registration skipped. Run 'openvr-space-calibrator-install' manually after SteamVR is installed."
fi

MANIFEST_PATH="$STEAMVR_DRIVERS_DIR/bin/linux64/manifest.vrmanifest"
echo ""
echo "Registering overlay manifest..."

if [ -f "$MANIFEST_PATH" ]; then
    REGISTER_UTIL=""
    for path in \
        "/usr/bin/openvr-space-calibrator-register" \
        "$USER_HOME/.local/bin/openvr-space-calibrator-register"; do
        if [ -f "$path" ] && [ -x "$path" ]; then
            REGISTER_UTIL="$path"
            break
        fi
    done
    
    if [ -n "$REGISTER_UTIL" ]; then
        OPENVR_LIB_PATH=""
        for lib_path in \
            "$USER_HOME/.local/share/Steam/steamapps/common/SteamVR/bin/linux64" \
            "$USER_HOME/.steam/steam/steamapps/common/SteamVR/bin/linux64" \
            "$USER_HOME/.steam/root/steamapps/common/SteamVR/bin/linux64"; do
            if [ -f "$lib_path/libopenvr_api.so" ]; then
                OPENVR_LIB_PATH="$lib_path"
                break
            fi
        done
        
        if [ -n "$OPENVR_LIB_PATH" ]; then
            # Suppress all output and errors (expected when SteamVR is not running)
            # Only show a clean message based on exit code
            if LD_LIBRARY_PATH="$OPENVR_LIB_PATH:$LD_LIBRARY_PATH" "$REGISTER_UTIL" "$MANIFEST_PATH" >/dev/null 2>&1; then
                echo "Overlay registered successfully"
            else
                echo "Note: Overlay will register itself on first run (SteamVR not running)"
            fi
        else
            echo "Note: Could not find OpenVR library. Overlay will register itself on first run."
        fi
    else
        echo "Note: Registration utility not found. Overlay will register itself on first run."
    fi
else
    echo "Warning: Manifest file not found at $MANIFEST_PATH"
fi

# Note: Symlink creation is handled in the .install file's post_install hook
# (which runs as root) to ensure proper permissions

echo ""
echo "Installation complete!"
echo ""
echo "IMPORTANT: To enable the overlay:"
echo "1. Start SteamVR"
echo "2. The overlay should appear automatically in the SteamVR dashboard"
echo "3. If it doesn't appear, manually launch it once:"
echo "   space-calibrator"
echo "   (It will register itself and then auto-start on future SteamVR launches)"
echo ""
echo "Restart SteamVR to activate the driver and overlay."

