#!/bin/sh
LD_LIBRARY_PATH=/usr/lib/luxcorerender/lib:$LD_LIBRARY_PATH
exec /usr/lib/luxcorerender/bin/luxcoreui "$@"
