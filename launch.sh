#!/bin/sh
exec electron3 "/usr/lib/$(basename "$0")/app.asar" "$@"
