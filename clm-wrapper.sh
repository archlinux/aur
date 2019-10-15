#!/usr/bin/env bash

# default paths
CLEANPATH=/usr/lib/StdEnv
CLEANLIB=/usr/libexec/clean-lang-bin/exe

if [ -d "$HOME/.local/lib/StdEnv" ]; then
    CLEANPATH="$HOME/.local/lib/StdEnv"
elif [ -d "$PWD/StdEnv" ]; then
    echo "Notice: using CWD install of StdEnv"
    CLEANPATH="$PWD/StdEnv"
else
    echo "Warning: you are calling clm using the system install of StdEnv," >&2
    echo "         this cause compilation to fail. Use the clenv tool create" >&2
    echo "         a user specific checkout of StdEnv." >&2
fi

export CLEANPATH
export CLEANLIB
exec /usr/libexec/clean-lang-bin/clm "$@"
