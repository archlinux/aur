#!/usr/bin/env sh
export NZBHYDRA_DISABLE_UPDATE=true
export NZBHYDRA_DISABLE_WRAPPER_CHECK=true
exec /usr/lib/nzbhydra2/nzbhydra2wrapperPy3.py "$@"
