#!/bin/sh

set -x

_NAME=akshare-release-v$1
_FILE=python-akshare-$1.tar.gz

if [ -e $_FILE ]; then
	tar xf ${_FILE} ${_NAME}/docs/changelog.md --strip-components=2
fi
