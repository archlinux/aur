#!/bin/sh
exec unshare -rm /usr/lib/cemu/cemu "$@"
