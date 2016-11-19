#!/usr/bin/sh

_group="${1:-games}"

getent group $_group &> /dev/null

if [ $? != 0 ]; then
    echo "group '$_group' not found";
    echo "${0##/} [group]       default: games"
    exit 1
fi

# fix permissions
chgrp $_group    /opt/simcity-2000{,/cities}
chmod g+w        /opt/simcity-2000{,/cities}
chgrp -R $_group /opt/simcity-2000/{scurkart,resource.urk,sc2000.cfg,sc2000.dat}
chmod -R g+w     /opt/simcity-2000/{scurkart,resource.urk,sc2000.cfg,sc2000.dat}
