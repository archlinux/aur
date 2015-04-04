#!/bin/sh
#
# launcher for Woah Dave by carstene1ns 2015
#

# create jail folder
mkdir -p "$HOME"/.mutekicorp/WoahDave

# link data, if needed
if [ ! -L "$HOME"/.mutekicorp/WoahDave/Bundle ]; then
  ln -s /opt/woahdave/Bundle "$HOME"/.mutekicorp/WoahDave
fi

# change to game dir and launch
cd "$HOME"/.mutekicorp/WoahDave && exec /opt/woahdave/WoahDave "$@"

# eof
