#!/bin/bash

# Code for forcing OpenGL backend taken from upstream start_RimWorld_openglfix.sh
FORCEGL=""

if which glxinfo | grep -q glxinfo ; then
	OPENGL_VERSION=`glxinfo | grep "OpenGL version string:" | cut -d' ' -f 4`
	if [[ (( $OPENGL_VERSION < 3.2 )) ]]; then
		echo "Detected OpenGL version < 3.2, launching game with a fix"
		FORCEGL=" -force-opengl"
	fi
fi

# LC_ALL: Apparently Unity has problems with non-english locales
# Also, the game binary needs to be in the same directory as the game data
LC_ALL=C /opt/rimworld/rimworld $FORCEGL
