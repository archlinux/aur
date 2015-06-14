#!/bin/sh
# Always run Google Earth from this shell script and not directly!
# This script makes sure the app looks in the right place for libraries
# that might also reside elsewhere.
#
# Ryan C. Gordon,  Thu Jul 20 14:32:33 PDT 2006

# We alredy know the path
cd /opt/google/earth/legacy

# Launch the app
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./googleearth-bin "$@"
