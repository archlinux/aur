#!/bin/sh

XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}
mkdir -p $XDG_DATA_HOME/powercord/{plugins,themes}

for d in /usr/share/powercord/src/Powercord/plugins/*/
do
	ln -s $d $XDG_DATA_HOME/powercord/plugins/ &>/dev/null
done

exec electron15 /usr/share/powercord/app $@