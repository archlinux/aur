#!/bin/sh

if [ -z "$1" ]; then
	echo 'usage: ./get-changelog.sh "<version>"'
else
	curl -O "https://raw.githubusercontent.com/pantsbuild/pex/v$1/CHANGES.rst"
fi
