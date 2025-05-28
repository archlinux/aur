#!/bin/sh

export LC_ALL=C
export LD_LIBRARY_PATH="/opt/creality-print/lib:$LD_LIBRARY_PATH"

exec /opt/creality-print/bin/CrealityPrint "$@"
