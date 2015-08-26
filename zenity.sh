#!/bin/bash

# ISSE reads stderr alongside with stdout,
# causing the file choose dialog to fail.
# Let's block stderr.
exec /usr/bin/zenity "$@" 2>/dev/null
