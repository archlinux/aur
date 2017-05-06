#!/bin/bash
if [[ $XDG_CONFIG_HOME ]] ; then
  CONFIG_DIR=$XDG_CONFIG_HOME/MultiMC5
else
  CONFIG_DIR=$HOME/.multimc5
fi
mkdir -p $CONFIG_DIR
/usr/lib/multimc5/bin/MultiMC -d $CONFIG_DIR $@
