#!/bin/bash

# default the vim executable
VIM_EXEC=/usr/bin/vim

# Get the Python version
PYTHON_MAJOR_VER=$($(which python) --version 2>&1 | sed -e 's/[a-zA-Z ]*//' | cut -d . -f 1)

echo "Starting vim for python $PYTHON_MAJOR_VER"

if [ $PYTHON_MAJOR_VER -eq 3 ]; then
    VIM_EXEC="/opt/gvim-python3-noconflict/bin/vim -u ~/.vimrc-python3"
else
    VIM_EXEC="/usr/bin/vim"
fi

exec $VIM_EXEC "$@"

