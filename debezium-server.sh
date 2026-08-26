#!/usr/bin/bash

set -e

cd /usr/lib/debezium-server

exec ./run.sh "$@"
