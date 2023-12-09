#!/usr/bin/bash

PROJ_BASE_DIR="/usr/share/sonix-flasher/"

cd ${PROJ_BASE_DIR} && exec python3 ./src/main/python/main.py $@
