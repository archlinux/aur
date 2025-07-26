#!/bin/sh

# This script is called by a pacman hook.
# It injects Wayland environment variables into the /usr/bin/brave script.

# First, remove any existing Wayland flags to avoid duplication.
sed -i '/# Wayland Flags Start/,/# Wayland Flags End/d' /usr/bin/brave

# Now, insert the flags just before the last line of the script.
cat <<'EOF' | sed -i '$e cat /dev/stdin' /usr/bin/brave
# Wayland Flags Start
# Detect Wayland protocol and add appropriate flags
if [[ "${XDG_SESSION_TYPE}" == "wayland" ]] || [[ -n "${WAYLAND_DISPLAY}" ]]
then
FLAG_LIST+=(
"--enable-features=UseOzonePlatform"
"--ozone-platform=wayland"
"--enable-wayland-ime"
"--wayland-text-input-version=1"
"--disable-features=GlobalShortcutsPortal,WaylandTextInputV3"
)
fi
# Wayland Flags End
EOF