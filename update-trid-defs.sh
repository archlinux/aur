#!/usr/bin/sh

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

_PWD=$(pwd)

cd /var/lib/trid/
python2 /usr/share/trid/tridupdate.py

cd ${_PWD}
