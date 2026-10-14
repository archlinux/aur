#!/bin/sh
# Pacman owns the executable; Horizon's downloaded games stay user-managed.
export HORIZON_LAUNCHER_NO_SELF_UPDATE=1
launcher=/usr/lib/horizon-launcher/horizon-launcher

# Upstream's generated menu entry points at the executable, bypassing this wrapper.
# Use the package's system menu entries and icons instead. This upstream command
# preserves other settings and disables automatic per-user menu registration.
if [ "$#" -eq 0 ]; then
    "$launcher" desktop-entry --remove >/dev/null || exit "$?"
fi
exec "$launcher" "$@"
