#!/bin/sh
export LD_LIBRARY_PATH=/opt/gowin-eda-ide/lib
exec /opt/gowin-eda-ide/bin/gw_sh "$@"
