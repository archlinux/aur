#!/bin/sh
exec /usr/bin/electron23 /opt/spplice/app.asar --disable-gpu-vsync "$@"
