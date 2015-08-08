#!/bin/sh -e

: ${XDG_CONFIG_HOME:=~/.config}

appdir="/opt/lbe"

if [ -d "$HOME/.lbe" ]; then
	confdir="$HOME/.lbe"
else
	confdir="$XDG_CONFIG_HOME/lbe"
fi

if [ ! -d "$confdir" ]; then
	mkdir -pm0700 "$confdir"

	cat > "$confdir/lbe.properties" <<-EOF
	base=$confdir/
	session.dir=$confdir/
	cacert.file=$confdir/lbecacerts
	EOF

	cp -a "$appdir/help/uofmichigan.cfg.sample" "$confdir/U of Michigan.cfg"

	cp -a "$appdir/attributes.config" "$confdir/"

	cp -a "$appdir/templates" "$confdir/"
fi

cd "$confdir" # FIXME: if we do this, we can ditch lbe.properties; any disadvantages?

umask 077 # protect session files

exec java -jar "$appdir/lbe.jar" "$@"
