#!/bin/sh

if [ -z "$1" ]; then
	echo 'usage: ./get-changelog.sh "<version>"'
else
	curl -O "https://raw.githubusercontent.com/pex-tool/pex/v$1/CHANGES.md"
fi
