#!/bin/sh

LIBPATH=/usr/share/inform7
INFORM7="$LIBPATH/inform7"
$INFORM7 --no-census-update -internal $LIBPATH "$@"
