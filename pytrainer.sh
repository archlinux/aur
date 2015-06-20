#!/bin/sh
# First arg is log level, e.g. -d for DEBUG

cd /usr/share/pytrainer
exec python2 pytrainer "$@"
