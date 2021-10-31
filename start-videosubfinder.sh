#!/bin/bash

# Get the cache folder path from env or else from default str
cache_folder="${XDG_CACHE_HOME:-~/.cache}/videosubfinder"

if [ ! -d "${cache_folder}" ]; then
	mkdir "${cache_folder}"
	WINEPREFIX="${cache_folder}" winetricks vcrun2015
fi

WINEDEBUG=-all WINEPREFIX="${cache_folder}" wine /usr/share/videosubfinder/VideoSubFinderWXW.exe "$@"
