#!/usr/bin/sh

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

python /usr/share/trid/trid.py --update -d /var/lib/trid/triddefs.trd

# Trigger an analyzis to generate the DB defs cache
python /usr/share/trid/trid.py -d /var/lib/trid/triddefs.trd /var/lib/trid/triddefs.trd
