#!/usr/bin/sh

cd /usr/share/metube || exit 1
exec python app/main.py "$@"
