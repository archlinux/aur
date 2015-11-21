#!/bin/sh
cd /var/lib/openbazaar-server/
export PYTHONPATH=/var/lib/openbazaar-server:/usr/lib/python2.7/site-packages/
ARGS="-t -d"
python2 openbazaard.py "$@" $ARGS
