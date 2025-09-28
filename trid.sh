#!/usr/bin/sh

if [ ! -e /var/lib/trid/triddefs.trd ]; then
    echo "Defenitions database not found!"
    echo "Run update-trid-defs as root to download the database."
    echo "You can enable automatic updates by enabling the update-trid-defs systemd service."

    exit 200;
fi

if [ ! -e /var/lib/trid/.triddefs.trd.cache ]; then
    echo "Defenitions database cache not found!"
    echo "If you just upgraded to version 2.41, you need to trigged a database update!"
    echo "Run update-trid-defs as root to update the database and generate the cache."
    echo "You can enable automatic updates by enabling the update-trid-defs systemd service."

    exit 200;
fi

python /usr/share/trid/trid.py -d /var/lib/trid/triddefs.trd $*
