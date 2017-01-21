#!/bin/sh
export LD_LIBRARY_PATH=/usr/share/maptiler/libs:/usr/lib/gdal1
exec /usr/share/maptiler/maptilergui "$@"
