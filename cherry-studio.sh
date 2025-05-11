#!/bin/bash
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
appname='cherry-studio'

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/${appname}-flags.conf ]]; then
    mapfile -t _USER_FLAGS < <(sed 's/#.*//' "$XDG_CONFIG_HOME/${appname}-flags.conf" | tr '\n' ' ')
fi

# DO NOT change __ELECTRON__, it's updated by PKGBUILD
exec __ELECTRON__ /usr/lib/${appname}/app.asar "$@" "${USER_FLAGS[@]}"
