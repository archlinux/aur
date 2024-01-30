#!/bin/bash

conf_dir="$HOME/.config/subs2srs"

if [[ ! -d $conf_dir ]]; then
	mkdir -p -- "$conf_dir"
fi

if [[ ! -f $conf_dir/preferences.txt ]]; then
	cp -- "/opt/subs2srs/preferences.txt" "$conf_dir/"
fi

cd -- "$conf_dir" || exit 1
exec mono /opt/subs2srs/subs2srs.exe
