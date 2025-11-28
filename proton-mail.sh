#!/bin/bash
# don't edit the electron binary name here! simply change the variable in the PKGBUILD and we will sed it into the correct one :)
exec /usr/bin/electron /usr/share/proton-mail/app.asar "$@"
