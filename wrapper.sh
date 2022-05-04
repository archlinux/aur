#!/bin/sh

LIBPATH=/usr/share/inform7
INFORM7="$LIBPATH/inform7"

if [ -z "$1" ] || [ "$1" = "-help" ] || [ "$1" = "--help" ];
    then $INFORM7 -help;
elif [ "$1" = "-version" ] || [ "$1" = "--version" ];
    then $INFORM7 -version;
else $INFORM7 -no-census-update -internal $LIBPATH "$@"; fi
