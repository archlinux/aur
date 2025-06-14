#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
VERSION=$(cat ${SCRIPT_DIR}/VERSION)

docker run --rm -i -v ${SCRIPT_DIR}:/home/builder pcmagas/arch-pkg-builder run_fixperm makepkg --printsrcinfo | sed '/^Start container$/d;/^Running post-install command: makepkg --printsrcinfo$/d' > ${SCRIPT_DIR}/.SRCINFO
