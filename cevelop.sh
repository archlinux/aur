#!/bin/sh

# Disable GTK3 if it seems to cause problems
# export SWT_GTK3=0

export ECLIPSE_HOME=/usr/lib/cevelop
exec "$ECLIPSE_HOME/runner" "$@"
