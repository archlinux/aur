#!/bin/sh

STATIC_FILES="${STATIC_FILES:-/opt/mealie/dist}"                          \
PRODUCTION="${PRODUCTION:-true}"                                          \
DATA_DIR="${DATA_DIR:-$HOME/.mealie}"                                     \
                                                                          \
/opt/mealie/venv/bin/python /opt/mealie/venv/lib/python3.12/site-packages/mealie/main.py
