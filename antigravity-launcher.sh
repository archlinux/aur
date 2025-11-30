#!/usr/bin/env bash
# Antigravity Sandbox

# Configuration
APP_DIR="/opt/antigravity"
APP_BIN="$APP_DIR/antigravity"
WORK_DIR="$HOME/AntigravityWorkspace"
CONF_DIR="$HOME/.config/antigravity"
CACHE_DIR="$HOME/.cache/antigravity"

# Ensure persistence directories exist
mkdir -p "$WORK_DIR" "$CONF_DIR" "$CACHE_DIR"

# Basic Bubblewrap Args
BWRAP_ARGS=(
    # Unshare namespaces for isolation
    --unshare-all
    --share-net
    --die-with-parent
    --new-session

    # Mount host root read-only
    --ro-bind / /

    # Overlay a writable tmpfs on /tmp
    # Required because we use --disable-dev-shm-usage
    --tmpfs /tmp

    # Mount devices and process info
    --dev-bind /dev /dev
    --ro-bind /sys /sys
    --proc /proc

    # TMPFS for HOME (Hides your real files)
    --tmpfs "$HOME"

    # Bind Persistent Directories (Read-Write)
    --bind "$WORK_DIR" "$WORK_DIR"
    --bind "$CONF_DIR" "$CONF_DIR"
    --bind "$CACHE_DIR" "$CACHE_DIR"

    # Bind X11 / Wayland Sockets (Display)
    # Must happen AFTER --tmpfs /tmp
    --ro-bind /tmp/.X11-unix /tmp/.X11-unix
    --setenv DISPLAY "$DISPLAY"
)

# Wayland Support
if [[ -n "$XDG_RUNTIME_DIR" ]]; then
    BWRAP_ARGS+=(
        --bind "$XDG_RUNTIME_DIR" "$XDG_RUNTIME_DIR"
        --setenv XDG_RUNTIME_DIR "$XDG_RUNTIME_DIR"
    )
fi

# Electron Specifics
ELECTRON_FLAGS=(
    --no-sandbox
    --disable-setuid-sandbox
    --disable-dev-shm-usage
)

echo "Starting Antigravity using bubblewrap as sandbox"
echo "Shield $HOME access for Antigravity/VSCode/Plugins/Electron"
echo "Writeable Workspace at: $WORK_DIR"

exec bwrap "${BWRAP_ARGS[@]}" "$APP_BIN" "${ELECTRON_FLAGS[@]}" "$@"
