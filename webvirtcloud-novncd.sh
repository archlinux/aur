#!/bin/sh

cd /usr/lib/webvirtcloud
. venv/bin/activate
exec python2 /usr/lib/webvirtcloud/console/novncd

