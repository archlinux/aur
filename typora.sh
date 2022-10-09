#!/usr/bin/sh

# don't edit the electron binary name here! simply change the variable in the PKGBUILD and we will sed it into the correct one :)
install -d /tmp/typora/
exec __ELECTRON__ /usr/lib/typora/app.asar   "${@:-/tmp/typora/}"
