#!/usr/bin/sh

cd /usr/share/hivision-id-photos
exec python deploy_api.py "$@"
