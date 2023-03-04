#!/usr/bin/env sh

export HYDRAWORKINGFOLDER=/usr/share/java/nzbhydra2
export NZBHYDRA_DISABLE_UPDATE=true
export NZBHYDRA_DISABLE_UPDATE_ON_SHUTDOWN=1
export NZBHYDRA_DISABLE_WRAPPER_CHECK=1
export NZBHYDRA_SKIP_BASE_PATH_CHECK=1
export NZBHYDRA_USE_BASE_PATH_FOR_LIBS=1
export NZBHYDRA_FORCE_GENERIC=generic

exec /usr/lib/nzbhydra2/nzbhydra2wrapperPy3.py "$@"
