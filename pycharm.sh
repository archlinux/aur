#!/bin/sh
if [ -z "$PYCHARM_JDK" ] ; then
  PYCHARM_JDK="/usr/share/pycharm/jbr/"
fi
cd /usr/share/pycharm/bin
exec env PYCHARM_JDK="$PYCHARM_JDK" ./pycharm "$@"

# vim: ts=2 sw=2 et:
