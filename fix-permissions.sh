#!/usr/bin/sh

_group="${1:-games}"

getent group $_group &> /dev/null

if [ $? != 0 ]; then
    echo "group '$_group' not found";
    echo "${0##/} [group]       default: games"
    exit 1
fi

# fix permissions
chgrp -R $_group /opt/constructor/{savegame,settings/setsnd.cfg,settings/system.ini}
chmod -R g+w     /opt/constructor/{savegame,settings/setsnd.cfg,settings/system.ini}
