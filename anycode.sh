#!/bin/sh
# AnyCode is shipped as an AppImage. The package unpacks it to /opt/anycode and
# runs the bundled AppRun, which sets LD_LIBRARY_PATH for the libraries shipped
# in usr/lib and adds --no-sandbox when user namespaces are unavailable.
exec /opt/anycode/AppRun "$@"
