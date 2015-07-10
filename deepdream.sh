#!/bin/sh

install -d -m 755 "${HOME}/deepdream"
[ -e "${HOME}/deepdream/dream.ipynb" ] || install -m 755 '/opt/deepdream/dream.ipynb' ~/deepdream/
cd "${HOME}/deepdream/"
ipython2 notebook "$@"
