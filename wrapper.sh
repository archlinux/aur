#!/bin/sh
# RimPy writes logs to the working directory, but also uses relative paths for locating core files. 
# This wrapper script copies RimPy to the user's home directory (for write permissions) and invokes
# that instance.

# User configuration is handled by RimPy in $XDG_CONFIG_HOME/'RimPy Mod Manager', so this script
# only persists logs between upgrades.

RIMPY_VERSION="@RIMPY_VERSION@"
RIMPY_DIR=~/".local/share/RimPy-local" # ~/ needs to be outside of quotes for some reason

# If local version doesn't exist or doesn't match package version, setup directory and backup logs
# if present. Then extract package, tag it with package version and restore log files if present.
if ! grep -qe ^"$RIMPY_VERSION"$ $RIMPY_DIR/version 2> /dev/null; then
	echo "Local version mismatch, upgrading files..."
	mkdir -p $RIMPY_DIR
	test -d $RIMPY_DIR/logs && mv $RIMPY_DIR/logs /tmp/rimpy-old-logs
	rm -r $RIMPY_DIR/* 2> /dev/null
	tar -xf "/opt/rimpy/RimPy_Linux_${RIMPY_VERSION}.tar.gz" -C "$RIMPY_DIR"
	echo $RIMPY_VERSION > $RIMPY_DIR/version
	test -d /tmp/rimpy-old-logs && mv /tmp/rimpy-old-logs $RIMPY_DIR/logs
	echo "Installed local version ${RIMPY_VERSION}."
fi

cd $RIMPY_DIR
$RIMPY_DIR/RimPy.sh
