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

if [[ ! -f $TYPORA_PLUGIN_CONFIG_HOME/settings.user.toml ]]; then
  cp /usr/share/typora/resources/plugin/global/settings/settings.user.toml $TYPORA_PLUGIN_CONFIG_HOME/
fi

if [[ ! -f $TYPORA_PLUGIN_CONFIG_HOME/custom_plugin.user.toml ]]; then
  cp /usr/share/typora/resources/plugin/global/settings/custom_plugin.user.toml $TYPORA_PLUGIN_CONFIG_HOME/
fi


# Launch
exec /usr/share/typora/Typora "$@" $TYPORA_USER_FLAGS
