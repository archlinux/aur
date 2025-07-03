#!/bin/sh
cd /usr/lib/spacecontrol || exit 1
exec ./sc_daemon "$@"
