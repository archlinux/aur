#!/bin/bash

CONFIG_FILE="/etc/pango-design-suite-license.conf"

if [ ! -f "$CONFIG_FILE" ]; then
	echo "Error: Pango Design Suite (PDS) config file not found!" >&2
	return 1
fi

source "$CONFIG_FILE"

if [ -z "$SNPSLMD_LICENSE_FILE" ] || [ -z "$PANGO_LICENSE_FILE" ]; then
	echo "Error: Failed to load Pango Design Suite (PDS) license!" >&2
	return 1
fi
