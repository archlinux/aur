#!/bin/sh

# we need a writeable directory with exec mount option
cd /tmp

# we want the config file in home directory, so we link it
if [ ! -e ${HOME}/.GCStatistic.conf ]; then
	ln -sf ${HOME}/.GCStatistic.conf
fi

# just execute
exec /opt/gcstatistic/GCStatistic
