#!/bin/bash

if [ ! -f /etc/shifter/imagemanager.json ]; then
	echo 'error: /etc/shifter/imagemanager.json does not exist'
	exit 1
fi
SYSTEMS=($(jq '.Platforms | keys[]' /etc/shifter/imagemanager.json | sed -e 's/"//g'))
ROOT_TREE=/opt/shifter/imagegw

for QA in ${SYSTEMS}; do
	echo "Starting Celery Queue $QA"
	celery2 -A shifter_imagegw.imageworker worker -Q $QA --loglevel=INFO -n worker.queue.$QA &
done

echo "Starting imagegw API"
python2 $ROOT_TREE/imagegwapi.py &
