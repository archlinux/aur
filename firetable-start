#!/bin/bash

# this is an extract of the original sysv init script that we can call directly
# from a systemd unit.

# source application-specific settings
if [ -r /etc/firetable/firetable.conf ]; then 
  INTERFACES=$(grep "^start_on_boot" /etc/firetable/firetable.conf | cut -f2 -d"=")
fi

/usr/bin/firetable start ${INTERFACES} &> /dev/null
exit $?
