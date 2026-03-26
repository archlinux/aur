#!/bin/bash

# copy from https://aur.archlinux.org/cgit/aur.git/tree/visual-studio-code-bin.sh?h=visual-studio-code-bin

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/trae-cn-flags.conf ]]; then
    CODE_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/trae-cn-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/trae-cn/bin/trae-cn "$@" $CODE_USER_FLAGS
