#!/bin/sh -e

appdir=/usr/lib/lbe
datadir=/usr/share/lbe

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
	cp -a "$datadir"/skel/. "$confdir"/

	# XXX: we don't really need lbe.properties if we chdir anyway

	cat > "$confdir/lbe.properties" <<-EOF
	base=$confdir/
	session.dir=$confdir/
	cacert.file=$confdir/lbecacerts
	EOF
fi

# Protect session configs
umask 077

cd "$confdir"

for jvm in /usr/lib/jvm/java-8-{openjdk,jre}; do
	if [ -d "$jvm" ]; then
		exec "$jvm"/jre/bin/java -jar "$appdir/lbe.jar" "$@"
	fi
done

echo "error: could not find a compatible JRE" >&2
exit 1
