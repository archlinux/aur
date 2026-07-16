#!/bin/bash
set -e

echo "=== cliphist-cpp Installation Script ==="


echo "Checking dependencies..."
MISSING_DEPS=0

for cmd in wl-copy wl-paste pkg-config g++; do
    if ! command -v $cmd &> /dev/null; then
        echo "Error: Command '$cmd' not found!"
        MISSING_DEPS=1
    fi
done


if command -v pkg-config &> /dev/null; then
    if ! pkg-config --exists gtk+-3.0 gdk-pixbuf-2.0; then
        echo "Error: gtk+-3.0 or gdk-pixbuf-2.0 development files not found (pkg-config check failed)."
        echo "Please install GTK3 development packages (e.g. 'gtk3' on Arch, 'libgtk-3-dev' on Debian/Ubuntu)."
        MISSING_DEPS=1
    fi
fi

if [ $MISSING_DEPS -ne 0 ]; then
    echo "Please install the missing dependencies and try again."
    exit 1
fi

echo "Dependencies OK."


echo "Building cliphist-cpp..."
make clean
make



read -p "Install system-wide (requires sudo) [y/N]? " systemwide

if [[ $systemwide =~ ^[Yy]$ ]]; then
    echo "Installing system-wide..."
    sudo make install
    echo "Installation complete!"
    echo "To start the daemon, run:"
    echo "  systemctl --user enable --now cliphist-cpp.service"
else
    echo "Installing user-local (to ~/.local)..."
    mkdir -p ~/.local/bin
    mkdir -p ~/.local/share/applications
    mkdir -p ~/.config/systemd/user

    cp cliphist-cpp ~/.local/bin/
    cp cliphist-cpp.desktop ~/.local/share/applications/
    cp cliphist-cpp.service ~/.config/systemd/user/


    sed -i "s|/usr/bin/cliphist-cpp|$HOME/.local/bin/cliphist-cpp|g" ~/.config/systemd/user/cliphist-cpp.service

    echo "Installation complete!"
    echo "Please ensure ~/.local/bin is in your PATH."
    echo "To start the daemon, run:"
    echo "  systemctl --user daemon-reload"
    echo "  systemctl --user enable --now cliphist-cpp.service"
fi
