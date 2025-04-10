#!/bin/bash

CONFIG_FILE="/etc/linglong-tools.conf"

if [ ! -f "$CONFIG_FILE" ]; then
	echo "Error: LingLong config file not found!" >&2
	return 1
fi

source "$CONFIG_FILE"

if [ -z "$LINGLONG_USERNAME" ] || [ -z "$LINGLONG_PASSWORD" ]; then
	echo "Error: Failed to load LingLong credentials!" >&2
	return 1
fi
