#! /bin/sh
conf="$1"
pol="$2"

usage() {
	echo "Usage:"
	echo "   $0 <configuration> <polarization>"
	echo "   <configuration> must be a *.cfg file"
	echo "   <polarization> is either z or xy"
}

if [ -z "$pol" ] || [ -z "$conf" ] ; then
	usage
	exit
else
	cat "/usr/share/maxwell2d/default/domain.cfg" \
		"/usr/share/maxwell2d/default/$pol.cfg" "$conf" | \
		maxwell2d_gif epsilon_gif_file="$(basename "$conf" .cfg)_$pol.gif" - > "$(basename "$conf" .cfg)_$pol.gif"
fi
