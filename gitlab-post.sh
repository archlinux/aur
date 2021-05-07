#!/bin/bash

(cd /usr/share/webapps/gitlab ; su -s /bin/sh gitlab -c "$(cat environment | xargs) bundle-2.7 exec rake db:migrate")
systemctl start gitlab.target
