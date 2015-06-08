#!/bin/bash
CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.multimc5}
mkdir -p $CONFIG_DIR
/usr/lib/multimc5/MultiMC5 -d $CONFIG_DIR
