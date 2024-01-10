#!/bin/sh
. /usr/share/ffsubsync-venv/bin/activate
exec /usr/share/ffsubsync-venv/bin/ffs "$@"
