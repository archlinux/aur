#!/usr/bin/env sh
set -e

if [ -n "$WAYLAND_DISPLAY" ]; then
	set -- --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
fi

if ! grep -qFx 1 /proc/sys/kernel/unprivileged_userns_clone; then
	set -- --no-sandbox "$@"
fi

exec electron /usr/lib/chrysalis/app.asar "$@"
