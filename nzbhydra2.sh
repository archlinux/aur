#!/usr/bin/env sh
export HYDRAWORKINGFOLDER=/usr/share/java/nzbhydra2
export NZBHYDRA_DISABLE_UPDATE=true
exec /usr/lib/nzbhydra2/nzbhydra2wrapperPy3.py "$@"
