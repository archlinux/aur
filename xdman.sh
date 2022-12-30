#!/usr/bin/env sh
if [ $EUID -eq 0 ];then
	echo "It's not recomended to run XDM as root, as it can cause problems"
fi
if [ -f "$HOME/.xdmanrc" ]; then
	source "$HOME/.xdmanrc"
fi
if [ "x$XDMAN_JAVA_HOME" != "x" ]; then
	"$XDMAN_JAVA_HOME/bin/java" -Dsun.java2d.xrender=false -jar /usr/share/java/xdman/xdman.jar $@
else
	java -Dsun.java2d.xrender=false -jar /usr/share/java/xdman/xdman.jar $@
fi
