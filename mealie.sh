#!/bin/sh

STATIC_FILES="${STATIC_FILES:-/usr/lib/mealie/dist}"                      \
PRODUCTION="${PRODUCTION:-true}"                                          \
DATA_DIR="${DATA_DIR:-$HOME/.mealie}"                                     \
                                                                          \
python /usr/lib/_PYTHONDIR/site-packages/mealie/main.py
