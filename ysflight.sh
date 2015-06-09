#!/bin/bash

# Mirror files to the home directory
if [ ! -d "$HOME/.config/ysflight" ]; then
	[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
	cp -r "YSFLIGHT_DIR/ysflight/config" "$HOME/.config/ysflight"
fi
if [ -d "$HOME/.cache/ysflight" ] && [ "$0" -nt "$HOME/.cache/ysflight" ]; then
	rm -rf "$HOME/.cache/ysflight"
fi
if [ ! -d "$HOME/.cache/ysflight" ]; then
	mkdir -p "$HOME/.cache/ysflight"
	# lndir without lndir…
	find "YSFLIGHT_DIR/ysflight" -mindepth 1 -printf '%y\t%P\n' \
	| while IFS=$'\t' read t n; do case $t in
	d) mkdir "$HOME/.cache/ysflight/$n" ;;
	*) ln -s "YSFLIGHT_DIR/ysflight/$n" "$HOME/.cache/ysflight/$n" ;;
	esac; done
	rm -rf "$HOME/.cache/ysflight/config"
	ln -s "$HOME/.config/ysflight" "$HOME/.cache/ysflight/config"
fi

# Launch YsFlight
cd "$HOME/.cache/ysflight/"
arch=$(uname -m | grep -o 64 || echo 32)
conf="$HOME/.config/ysflight/archlinux"

if [ "${0##*/}" == 'ysflight-server' ]; then
	exec ./ysflight${arch}_nownd "$@"
else
	# Setup
	while [ ! -f "$HOME/.config/ysflight/archlinux" ]; do
		version=$(zenity --list --radiolist --print-column=2 --hide-column=2 \
			--title 'Choose your YsFlight binary' \
			--text  "The choice is stored in ${conf}; remove this file to get this dialog again." \
			--column="Choice" --column "" --column="Binary" \
			  1                 gl1         'OpenGL 1.x' \
			  2                 gl2         'OpenGL 2.0' || exit 1)
		[ -n "$version" ] && printf 'version="%s"\n' "$version" >"$conf"
	done
	. "$conf"
	# Run
	exec ./ysflight${arch}_${version} "$@"
fi
