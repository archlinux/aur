#!/bin/bash

_ruby=$(pacman -Qiq gitlab | awk '{/^Depends On/ && match($0,/\<ruby[0-9.]*\>/,a)}END{print a[0]}')
_bundle=$(pacman -Qlq "$_ruby" | grep '/usr/bin/bundle\>')

cd /usr/share/webapps/gitlab
su -s /bin/sh gitlab -c "$(xargs < environment ) $_bundle exec rake db:migrate"
systemctl start gitlab.target
