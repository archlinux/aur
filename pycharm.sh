#!/bin/sh

if [ -z "$PYCHARM_JDK" ] ; then
  PYCHARM_JDK="/usr/share/pycharm/jbr/"
fi
exec env PYCHARM_JDK="$PYCHARM_JDK" /usr/share/pycharm/bin/pycharm.sh "$@"

# vim: ts=2 sw=2 et:
