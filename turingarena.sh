#!/bin/sh
# Wrapper script to launch turingarena
. /etc/default/turingarena
exec /usr/lib/turingarena/turingarena admin --database-url="$DATABASE" $@
