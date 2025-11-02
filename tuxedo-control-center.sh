#!/bin/bash
appname='tuxedo-control-center'
# DO NOT change __ELECTRON__, it's updated by PKGBUILD
exec __ELECTRON__ /usr/lib/${appname} "$@"
