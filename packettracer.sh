#!/bin/bash
# Packet Tracer 9.0.0 environment setup script

# Set Packet Tracer home
PT8HOME=/usr/lib/packettracer/
export PT8HOME

# Add internal binaries to PATH
export PATH="$PT8HOME/bin:$PATH"

# Compare version numbers function
version_gt() {
    test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"
}

# Default Qt version check
QT_VERSION_CHECK="5.5.0"

# Detect Qt version if qmake exists
if command -v qmake >/dev/null 2>&1; then
    QT_VERSION=$(qmake -v | grep "Using Qt version" | sed -r 's/.* ([0-9]+\.[0-9]+\.[0-9]+).*/\1/')
else
    QT_VERSION="$QT_VERSION_CHECK"
fi

# Set Qt scaling for HiDPI displays
if version_gt "$QT_VERSION" "$QT_VERSION_CHECK"; then
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
else
    export QT_DEVICE_PIXEL_RATIO=auto
fi

# If used as wrapper
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    exec /usr/lib/packettracer/packettracer "$@"
fi
