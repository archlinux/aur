#!/usr/bin/env bash

# Just a friendly script so it is easy to update the SRCINFO even from
# a machine that does not run Arch Linux natively.

set -euo pipefail

docker() {
    if [[ "${OSTYPE:-}" != darwin* ]] && [[ "${EUID}" != 0 ]]; then
        sudo -E docker "$@"
    else
        docker "$@"
    fi
}

docker build . -t pass-ln-aur
docker run -it --rm -v "${PWD}:/src" -w /src                      \
       -e GIT_USER_NAME="$(git config user.name)"                 \
       -e GIT_USER_EMAIL="$(git config user.email)"               \
       --entrypoint=/src/docker-entrypoint.bash pass-ln-aur bash
