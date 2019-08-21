#!/bin/bash
export STEAM_RUNTIME=0
export STEAM_RUNTIME_HEAVY=0
# Workaround for dbus fatal termination related coredumps (SIGABRT)
# https://github.com/ValveSoftware/steam-for-linux/issues/4464
export DBUS_FATAL_WARNINGS=0
# Override some libraries as these are what games linked against.
export LD_LIBRARY_PATH="/usr/lib/steam:/usr/lib32/steam${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH"
exec /usr/lib/steam/steam "$@"
