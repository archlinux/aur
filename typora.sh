#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
TYPORA_PLUGIN_CONFIG_HOME=${XDG_CONFIG_HOME}/typora_plugin

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/typora-flags.conf ]]; then
	TYPORA_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/typora-flags.conf | tr '\n' ' ')"
fi

# copy typora plugin settings files
if [[ ! -e $TYPORA_PLUGIN_CONFIG_HOME ]]; then
  mkdir -p $TYPORA_PLUGIN_CONFIG_HOME
fi

# typora-plugin copy user configs
(cd /usr/share/typora/resources/plugin/bin/ && bash ./typora-plugin.sh )

# Launch
exec /usr/share/typora/Typora "$@" $TYPORA_USER_FLAGS
