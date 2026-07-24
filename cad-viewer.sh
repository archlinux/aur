#!/bin/sh
exec electron --ozone-platform-hint=auto /usr/lib/cad-viewer/main.js "$@"
