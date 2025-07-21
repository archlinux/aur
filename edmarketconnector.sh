#!/bin/sh

cd /usr/lib/edmarketconnector || exit 1
exec /usr/bin/python ./EDMarketConnector.py "$@"
