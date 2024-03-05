#!/usr/bin/bash
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/dida-flags.conf ]]; then
   DIDA_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/dida-flags.conf | tr '\n' ' ')"
fi

exec __ELECTRON__ $DIDA_USER_FLAGS /usr/share/dida/dida.asar "$@"
