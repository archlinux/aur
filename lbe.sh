#!/bin/sh -e

if [ -d ~/.lbe ]; then
	confdir=~/.lbe
else
	confdir=${XDG_CONFIG_HOME:-~/.config}/lbe
fi

# LBE tries to find everything in the current working directory (it pretty much
# expects the user to double-click lbe.jar in their ~/Downloads/lbe), so for a
# system-wide /usr installation we must manually set up a config directory and
# chdir() into it.
if [ ! -d "$confdir" ]; then
	mkdir -p -m 0700 "$confdir"
	cp -a /usr/share/lbe/skel/. "$confdir"/
fi
if [ ! -e "$confdir"/help ]; then
	ln -nsf /usr/share/doc/lbe/help "$confdir"/help
fi
cd "$confdir"

# Protect session configuration files.
umask 077

for jvm in /usr/lib/jvm/java-{11-{openjdk,jdk},8-{openjdk,jre}/jre}; do
	if [ -d "$jvm" ]; then
		exec "$jvm"/bin/java -jar /usr/lib/lbe/lbe.jar "$@"
	fi
done

echo "error: could not find a compatible JRE" >&2
exit 1
