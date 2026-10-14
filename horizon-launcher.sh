#!/bin/sh
# Pacman owns the executable; Horizon's downloaded games stay user-managed.
export HORIZON_LAUNCHER_NO_SELF_UPDATE=1
# Keep menu registrations made by the GUI or CLI on the package's update policy.
# Requires a launcher release with HORIZON_LAUNCHER_DESKTOP_EXEC support.
export HORIZON_LAUNCHER_DESKTOP_EXEC=/usr/bin/horizon-launcher
launcher=/usr/lib/horizon-launcher/horizon-launcher

# Clear entries made by older launchers that bypassed this wrapper. Keep the
# package's system entries as the default; re-enabled per-user entries use
# HORIZON_LAUNCHER_DESKTOP_EXEC once the launcher supports it.
if [ "$#" -eq 0 ]; then
    "$launcher" desktop-entry --remove >/dev/null || exit "$?"
fi
exec "$launcher" "$@"
