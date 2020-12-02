#!/bin/sh
export DJANGO_SETTINGS_MODULE=config.settings.dev
cd /tmp || exit
exec /usr/bin/django-admin "$@"
