#!/bin/sh

cd /usr/lib/webvirtcloud
. venv/bin/activate
exec gunicorn webvirtcloud.wsgi:application -c /usr/lib/webvirtcloud/gunicorn.conf.py

