#!/bin/sh
# Extract-and-run avoids needing FUSE for the AppImage.
export APPIMAGE_EXTRACT_AND_RUN=1
exec /opt/blinko-desktop/Blinko.AppImage "$@"
