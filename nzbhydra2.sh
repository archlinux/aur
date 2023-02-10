#!/usr/bin/env sh
export NZBHYDRA_DISABLE_UPDATE=true
#export NZBHYDRA_DISABLE_WRAPPER_CHECK=true
export NZBHYDRA_DISABLE_UPDATE_ON_SHUTDOWN=true
export NZBHYDRA_FORCE_GENERIC=native
export NZBHYDRA_SKIP_BASE_PATH_CHECK=false
export NZBHYDRA_USE_BASE_PATH_FOR_LIBS=true

exec /usr/lib/nzbhydra2/nzbhydra2wrapperPy3.py "$@"
