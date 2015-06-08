#!/bin/bash

source /etc/conf.d/graphite-api.conf
gunicorn -w${workers} graphite_api.app:app -b ${listen_ip}:${port}
