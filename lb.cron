#!/bin/sh

if [ -x /usr/bin/lb ]; then
	nice -n 19 /usr/lib/lb --lock --ssh-C --numeric-ids --exclude /etc/lb.exclude / root@machine:/destination
fi
