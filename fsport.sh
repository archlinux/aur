#!/bin/sh

if [ -x /usr/bin/fs2_open-mediavps ]; then
    /usr/bin/fs2_open-mediavps "$@" -mod fsport
else
    /usr/bin/fs2_open "$@" -mod fsport
fi
