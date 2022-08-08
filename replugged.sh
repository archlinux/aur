#!/bin/sh

XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
mkdir -p "$XDG_DATA_HOME/replugged/"{plugins,themes}

for DIR in /usr/share/replugged/src/Powercord/plugins/*/
do
	ln -s "$DIR" "$XDG_DATA_HOME/replugged/plugins/" &>/dev/null
done

ln -s "/usr/share/replugged/src/fake_node_modules" "$XDG_DATA_HOME/replugged/" &>/dev/null

exec electron19 /usr/share/replugged "$@"