#!/bin/sh
ELECTRON_IS_DEV=0 exec /usr/lib/electron39/electron /usr/lib/potacat --user-data-dir="$HOME/.config/potacat" "$@"
