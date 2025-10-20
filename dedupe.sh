#!/bin/sh
conf=~/.config/dedupe.conf
if [ "$(id -u)" -ne 0 ] ; then
	if [ -e $conf ] ; then
		grep -vE '^(\s*$|#)' $conf | while read -r line ; do
			duperemove -hdr --hashfile="$line"/.duperemove "$line"
		done
	else
		printf "# put location you wish to deduplicate here, no relative paths\n# this runs as user and therefore you must have permissions to access said drive for it to work\n# anything commented is ignored, leave off the last slash symbol\n# for example :\n# /mnt/example-drive\n# /home/your-username/Pictures" >> $conf

		echo "Configuration file has been created at ~/.config/dedupe.conf, but must first be set up."
	fi
else
	echo "This script should not be run as root. Exiting."
fi
