#!/bin/sh

XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}
mkdir -p $XDG_DATA_HOME/powercord/{plugins,themes}

exec electron13 /usr/share/powercord/app $@