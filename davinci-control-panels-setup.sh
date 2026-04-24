!/usr/bin/sh

# The directory matches _pkgname defined in the PKGBUILD
INSTALL_DIR="/opt/davinci-resolve"

# Path to the executable (wrapped in quotes to handle spaces)
BINARY="$INSTALL_DIR/DaVinci Control Panels Setup/DaVinci Control Panels Setup"

# Resolve internal library path to avoid "shared library not found" errors
export LD_LIBRARY_PATH="$INSTALL_DIR/libs:$LD_LIBRARY_PATH"

exec "$BINARY" "$@"
