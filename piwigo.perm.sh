#!/bin/bash

piwigo_path='/usr/share/webapps/piwigo'
htuser='http'
htgroup='http'

find ${piwigo_path}/ -type f -print0 | xargs -0 chmod 0640
find ${piwigo_path}/ -type d -print0 | xargs -0 chmod 0750
chown -R ${htuser}:${htgroup} ${piwigo_path}/
