#!/bin/bash

set() {
	shopt -s extglob
	sed -i "s/pipedapi.kavin.rocks/${1#http?(s)://}/g" /usr/share/webapps/piped/frontend/assets/*
	shopt -u extglob
	exit 0
}

[[ -v "${1}" ]] &&
	set "${1}"

echo 'No arg given, searching through configs'

for config in /etc/webapps/piped/{frontend,backend}.properties; do
	[[ -f "${config}" ]] &&
		set "$(grep API_URL "${config}" | cut -d':' -f2-)"
done

echo 'No configs found, nothing done. You may need to manually rerun this, with the URL included.'
