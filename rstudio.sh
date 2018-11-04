#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/rstudio/lib
exec /usr/lib/rstudio/bin/rstudio "$@"
