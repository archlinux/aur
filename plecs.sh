#!/bin/sh

cd /opt/plecs/ || exit 1
exec ./PLECS "$@"
