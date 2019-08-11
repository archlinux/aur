#!/bin/bash

# Mirror files to the home directory
if [ ! -d "$HOME/.config/ysflight" ]; then
	[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
	cp -r "YSFLIGHT_DIR/config" "$HOME/.config/ysflight"
fi
if [ -d "$HOME/.cache/ysflight" ] && [ "$0" -nt "$HOME/.cache/ysflight" ]; then
	rm -rf "$HOME/.cache/ysflight"
fi
if [ ! -d "$HOME/.cache/ysflight" ]; then
	cp -rs "YSFLIGHT_DIR" "$HOME/.cache/ysflight"
	rm -rf "$HOME/.cache/ysflight/config"
	ln -s "$HOME/.config/ysflight" "$HOME/.cache/ysflight/config"
fi

# Launch YsFlight
cd "$HOME/.cache/ysflight/"
exe="${0##*/}"
[ -e "$exe" ] || exe="ysflight64_gl2"
exec ./$exe "$@"
