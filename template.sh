#!/bin/sh

export DOOMTOOLS_PATH="/usr/share/doomtools"
export DOOMTOOLS_JAR="/usr/share/java/doomtools/doomtools-PKGVER_PLACEHOLDER.jar"
case $@ in
	*"--update"* )
	   echo "DoomTools was installed from AUR, updating in this manner is unsupported."
	   echo "Please pull a new version from AUR to update."
	   exit 1
   	;;
esac
exec /usr/bin/java -cp "$DOOMTOOLS_JAR" -Xms64M -Xmx4G MAINCLASS_PLACEHOLDER "$@"
