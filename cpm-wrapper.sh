#!/usr/bin/env bash

# default paths
CLEAN_HOME=/opt/clean-itasks-dev-bin

if [ -d "$HOME/.cache/clean-itasks-dev-bin" ]; then
    CLEAN_HOME="$HOME/.cache/clean-itasks-dev-bin"
elif [ -d "$PWD/clean-itasks-dev-bin" ]; then
    echo "Notice: using CWD install of clean/itasks"
    CLEAN_HOME="$PWD/clean-itasks-dev-bin"
else
    echo "Warning: you are calling cpm using the system install of Clean," >&2
    echo "         this can cause compilation to fail. Use the clenv tool" >&2
    echo "         to create a user specific checkout of Clean/iTasks." >&2
fi

export CLEAN_HOME
exec "$CLEAN_HOME/bin/cpm" "$@"
