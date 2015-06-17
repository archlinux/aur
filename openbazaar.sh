#!/bin/sh
cd /var/lib/openbazaar/
COMMANDS="--disable-open-browser -q 8888 -p 12345 --enable-ip-checker"
export PYTHONPATH=/var/lib/openbazaar:/usr/lib/python2.7/site-packages/
(python2 node/openbazaar.py $COMMANDS start &) &
