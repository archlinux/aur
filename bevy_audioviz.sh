#!/bin/sh

# Define the directory where assets and the binary expect to run from
APP_SHARE_DIR="/usr/share/bevy_audioviz"

# Change to the application's share directory
cd "$APP_SHARE_DIR" || exit 1

# Explicitly set CARGO_MANIFEST_DIR to the current directory.
# This *might* help Bevy resolve asset paths correctly relative to the CWD.
export CARGO_MANIFEST_DIR="$APP_SHARE_DIR"

# Execute the actual binary, passing along any arguments
exec /usr/lib/bevy_audioviz/bevy_audioviz_bin "$@"