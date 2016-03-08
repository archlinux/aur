#!/bin/sh

# For help, start with argument "/?".
# For convenience, this script converts common help-invocations to an invocation with "/?".

cd /opt/idos-timetable

helparg=''
case "$1" in
  "-h"|"-help"|"--help"|'/?')
    helparg="/?"
    shift
  ;;
esac

wine TT.exe ${helparg} "$@"
