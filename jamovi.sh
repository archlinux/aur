#!/bin/sh

export LD_LIBRARY_PATH=/usr/lib/R/library/RInside/lib/:/usr/lib/R/lib/:/usr/lib
exec /usr/lib/jamovi/bin/jamovi $@
