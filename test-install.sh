#!/bin/bash
# Test script for validating Lem installation
# This script should be run inside an archlinux:latest Docker container
# Used by: update.sh validate_package() function
#
# Expects the package file at: /tmp/lem-editor.pkg.tar.zst
# Verifies:
#   1. Package installs without errors
#   2. Wrapper script exists and is executable
#   3. AppImage runs via --appimage-extract-and-run without FUSE
#   4. Binary returns version info

set -e

# Update package databases
pacman -Sy --noconfirm > /dev/null 2>&1

# Install the package (no FUSE dependency needed)
pacman -U --noconfirm /tmp/lem-editor.pkg.tar.zst > /dev/null 2>&1

# Verify wrapper script exists and is executable
if [ ! -x /usr/bin/lem ]; then
    echo "ERROR: /usr/bin/lem wrapper script does not exist or is not executable"
    exit 1
fi

# Verify AppImage exists
if [ ! -f /opt/lem-editor/lem.AppImage ]; then
    echo "ERROR: /opt/lem-editor/lem.AppImage does not exist"
    exit 1
fi

# Test execution - run --version to verify the AppImage works with --appimage-extract-and-run
if ! output=$(/usr/bin/lem --version 2>&1); then
    echo "ERROR: Failed to execute /usr/bin/lem"
    exit 1
fi

# Verify output contains version info
if [ -z "$output" ]; then
    echo "ERROR: No version output from /usr/bin/lem"
    exit 1
fi

# Print success message with version info
echo "✓ Package installed and tested successfully (no FUSE required)"
echo "  Version: $output"

exit 0
