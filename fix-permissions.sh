#!/usr/bin/sh

_group="${1:-games}"

getent group $_group &> /dev/null

if [ $? != 0 ]; then
    echo "group '$_group' not found";
    echo "${0##/} [group]       default: games"
    exit 1
fi

# fix permissions
chgrp $_group /opt/jagged-alliance-deadly-games/{,sound.cfg}
chmod g+w     /opt/jagged-alliance-deadly-games/{,sound.cfg}
