#!/bin/sh

# Disable the intro, it requires additional system library (webkit gtk) we don't control
export CEVELOP_INTRO=false

# To disable GTK3 (and go back to GTK2), uncomment the following line:
# export SWT_GTK3=0

export ECLIPSE_HOME=/usr/lib/cevelop
exec "$ECLIPSE_HOME/cevelop" "$@"
