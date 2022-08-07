#!/bin/sh
cd "$(dirname "$(readlink -f "$0")")"
electron20 . "$@"
