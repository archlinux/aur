#!/bin/sh
LOGSTASH_CONFIG=$1
shift
LANG=C /usr/bin/journalctl -afb -n1 "$@" | /usr/bin/logstash-forwarder -config "$LOGSTASH_CONFIG" -spool-size 100
