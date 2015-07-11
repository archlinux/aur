#!/usr/bin/sh

if [ ! -e /var/lib/trid/triddefs.trd ]; then
    echo "Defenitions database not found!"
    echo "Run update-trid-defs as root to download the database."
    echo "You can enable automatic updates by enabling the update-trid-defs systemd service."

    exit 200;
fi

/usr/bin/trid.bin -d:/var/lib/trid/triddefs.trd $*
