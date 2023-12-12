#!/bin/sh
set -e
APPDIR=/opt/apps/@appname@
APPNAME=@runappname@
export LC_CTYPE=en_US.UTF-8
cd "${APPDIR}"
exec "${APPDIR}/files/${APPNAME}"