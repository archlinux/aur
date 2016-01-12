#!/bin/sh
cd /var/lib/openbazaard/
export PYTHONPATH=/var/lib/openbazaard/:/usr/lib/python2.7/site-packages/
ARGS="-t"
python2 openbazaard.py "$@" $ARGS
