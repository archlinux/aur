#!/bin/sh

cd /opt/plecs-blockset/bin/glnxa64/ || exit 1
exec ./PLECS.setup "$@"
