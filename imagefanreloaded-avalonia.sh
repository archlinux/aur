#!/bin/sh
set -e
APPDIR=/opt/@appname@
APPNAME=@runappname@
export LC_CTYPE=en_US.UTF-8
exec "${APPDIR}/${APPNAME}"