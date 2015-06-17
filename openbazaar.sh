#!/bin/sh
cd /var/lib/openbazaar/
COMMANDS="--config-file /etc/openbazaar.conf"
export PYTHONPATH=/var/lib/openbazaar:/usr/lib/python2.7/site-packages/
python2 -m node.openbazaar $COMMANDS "$@" &
