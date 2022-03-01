#!/usr/bin/env bash

set -euo pipefail

groupadd -g "$(stat -c %g "$PWD")" -o -p '!' -r docker
useradd -u "$(stat -c %u "$PWD")" -g "$(stat -c %g "$PWD")" -o -p '!' -m -N -l -s /usr/bin/bash -G sudo docker

runuser -u docker -- git config --global user.name "${GIT_USER_NAME}"
runuser -u docker -- git config --global user.email "${GIT_USER_EMAIL}"

exec runuser -u docker -- "$@"
