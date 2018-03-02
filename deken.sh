#!/bin/sh -e
export DEKEN_HOME="/usr/lib/deken"
exec "$DEKEN_HOME"/virtualenv/bin/hy "$DEKEN_HOME"/deken.hy "$@"
