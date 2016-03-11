#!/bin/sh

# Disable GTK3 because it seems to cause more problems and has no benefits for now
export SWT_GTK3=0

export ECLIPSE_HOME=/usr/lib/cevelop
exec "$ECLIPSE_HOME/runner" "$@"
