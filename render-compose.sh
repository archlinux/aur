#!/bin/bash
set -e

set -a
source /opt/podman-sabnzbd/default.env
source "$1"
source /opt/podman-sabnzbd/.env
set +a

envsubst < /opt/podman-sabnzbd/docker-compose.yaml > "$2"
