#!/bin/sh
export LST_SKIP_AUTO_UPDATE=1
exec /usr/bin/electron41 /usr/lib/linux-sensor-tray/app.asar "$@"
