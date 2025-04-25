#!/bin/sh
if [ -z "$OPENIDE_JDK" ] ; then
  OPENIDE_JDK="/usr/share/openide/jbr/"
fi
exec env OPENIDE_JDK="$OPENIDE_JDK" /usr/share/openide/bin/openide "$@"

# vim: ts=2 sw=2 et:
