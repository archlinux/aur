#!/bin/sh

. /usr/share/remoteit/functions.sh

checkinternet=$(/usr/share/remoteit/connectd -nc install.remote.it:443 |grep SUCCESS)

if [ "$checkinternet" = "" ]; then
  i=1
  while [ "$i" -le 10 ]; do
    sleep 1
    r3_logger "remote.it is checking the Internet connectivity....."
    checkinternet=$(/usr/share/remoteit/connectd -nc install.remote.it:443 |grep SUCCESS)
    [ "$checkinternet" != "" ] && break
    i=$((i+1))
    done
fi

r3_logger "Internet connectivity is good."

r3_reload_agent 2>&1 | r3_logger
