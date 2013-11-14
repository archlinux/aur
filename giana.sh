#!/bin/sh

cd /opt/giana

./giana "$@"

cd - &>/dev/null
