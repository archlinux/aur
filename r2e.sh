#!/bin/sh

mkdir -p ${HOME}/.rss2email
cd ${HOME}/.rss2email
python2 /usr/lib/rss2email/rss2email.py feeds.dat "$@"
