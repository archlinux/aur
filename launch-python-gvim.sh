#!/bin/bash

# default the gvim executable
VIM_EXEC=/usr/bin/gvim

# Get the Python version
PYTHON_MAJOR_VER=$($(which python) --version 2>&1 | sed -e 's/[a-zA-Z ]*//' | cut -d . -f 1)

echo "Starting gvim for python $PYTHON_MAJOR_VER"

if [ $PYTHON_MAJOR_VER -eq 3 ]; then
    VIM_EXEC="/opt/gvim-python3-noconflict/bin/gvim -u ~/.vimrc-python3"
else
    VIM_EXEC="/usr/bin/gvim"
fi

exec $VIM_EXEC "$@"

