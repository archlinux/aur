#!/bin/sh
#
# launcher for retroguru games by carstene1ns 2013-2014
#

# get game from script name
game=`basename $0`

# create jail folder
mkdir -p "$HOME"/.$game

# link data folder, if needed
if [ ! -L "$HOME"/.$game/data ]; then
  ln -s /usr/share/$game/data "$HOME"/.$game/data
fi

# change to game dir and launch
cd "$HOME"/.$game && exec /usr/lib/$game/$game "$@"

# eof
