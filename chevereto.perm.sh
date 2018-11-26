#!/bin/bash

chevereto_path='/usr/share/webapps/chevereto'
htuser='http'
htgroup='http'

find ${chevereto_path}/ -type f -print0 | xargs -0 chmod 0640
find ${chevereto_path}/ -type d -print0 | xargs -0 chmod 0750
chown -R ${htuser}:${htgroup} ${chevereto_path}/
