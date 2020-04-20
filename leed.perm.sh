#!/bin/bash

leed_path='/usr/share/webapps/leed'
htuser='http'
htgroup='http'

find ${leed_path}/ -type f -print0 | xargs -0 chmod 0640
find ${leed_path}/ -type d -print0 | xargs -0 chmod 0750
chown -R ${htuser}:${htgroup} ${leed_path}/
