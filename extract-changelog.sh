#!/bin/sh

_NAME=akshare-$1
_FILE=python-${_NAME}.tar.gz

if [ -e $_FILE ]; then
	tar xf ${_FILE} ${_NAME}/docs/changelog.md --strip-components=2
fi
