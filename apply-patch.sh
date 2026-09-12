#!/bin/bash
#
# Apply or revert the sidebarsubtitles integration patch on uosc's main.lua.
# Used by both the package .install script and the pacman hook (so a uosc
# upgrade automatically re-applies the patch).
#
set -u

UOSC_FILE="/usr/share/mpv/scripts/uosc/main.lua"
PATCH_FILE="/usr/share/mpv-sidebarsubtitles/uosc-sidebarsubtitles.patch"

cmd="${1:-apply}"

apply() {
    if [ ! -f "$UOSC_FILE" ]; then
        echo "==> WARNING: uosc main.lua not found at $UOSC_FILE"
        echo "    Make sure mpv-uosc is installed."
        return 0
    fi

    if [ ! -f "$PATCH_FILE" ]; then
        echo "==> WARNING: patch file not found at $PATCH_FILE"
        return 0
    fi

    # Already applied? (dry-run reverse)
    if patch -R -p1 -d / -i "$PATCH_FILE" --dry-run >/dev/null 2>&1; then
        echo "==> sidebarsubtitles patch already applied to uosc, skipping."
        return 0
    fi

    # Try to apply
    if patch -N -p1 -d / -i "$PATCH_FILE" --dry-run >/dev/null 2>&1; then
        patch -N -p1 -d / -i "$PATCH_FILE"
        echo "==> Applied sidebarsubtitles integration patch to uosc."
    else
        echo "==> WARNING: Could not apply sidebarsubtitles patch to uosc."
        echo "    uosc may have been updated and the patch no longer matches."
        echo "    sidebarsubtitles will still load, but uosc controls may overlap the sidebar."
    fi
}

revert() {
    if [ ! -f "$PATCH_FILE" ]; then
        return 0
    fi

    if patch -R -p1 -d / -i "$PATCH_FILE" --dry-run >/dev/null 2>&1; then
        patch -R -p1 -d / -i "$PATCH_FILE"
        echo "==> Reverted sidebarsubtitles integration patch from uosc."
    fi
}

case "$cmd" in
    apply)  apply ;;
    revert) revert ;;
    *)
        echo "Usage: $0 {apply|revert}"
        exit 1
        ;;
esac
