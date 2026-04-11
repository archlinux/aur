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

# Test 1: Version output (quick test)
test_output=$(/usr/bin/lem --version 2>&1) || {
    exit_code=$?
    echo "ERROR: Failed to run /usr/bin/lem --version (exit code: $exit_code)"
    echo "Output:"
    echo "$test_output"

    # Diagnose common issues
    if echo "$test_output" | grep -q "fusermount\|FUSE\|libfuse"; then
        echo ""
        echo "DIAGNOSIS: AppImage requires FUSE but --appimage-extract-and-run should handle this."
        echo "The wrapper script may not be using --appimage-extract-and-run correctly."
    fi
    if echo "$test_output" | grep -q "not found\|cannot open shared"; then
        echo ""
        echo "DIAGNOSIS: Missing library or dependency detected."
        echo "The AppImage requires system libraries that are not installed."
    fi
    exit 1
}

if [ -z "$test_output" ]; then
    echo "ERROR: No version output from /usr/bin/lem"
    exit 1
fi

# Test 2: Try to initialize the editor (more thorough test)
# Use timeout and /dev/null input to prevent hanging, capture errors
init_output=$(timeout 2 /usr/bin/lem < /dev/null 2>&1) || {
    exit_code=$?
    # Exit code 124 is timeout (expected for interactive app), other codes indicate errors
    if [ $exit_code -ne 124 ]; then
        echo "ERROR: Editor failed to initialize (exit code: $exit_code)"
        echo "Output:"
        echo "$init_output"

        # Diagnose the failure
        if echo "$init_output" | grep -q "not found\|cannot open shared\|No such file"; then
            echo ""
            echo "DIAGNOSIS: Missing system dependency or library file."
            echo "Check that all required libraries are installed."
        fi
        exit 1
    fi
}

# Print success message with version info
echo "✓ Package installed and tested successfully"
echo "✓ Wrapper script works correctly"
echo "✓ AppImage environment preserved (no FUSE required)"
echo "✓ All dependencies available"
echo ""
echo "Version info:"
echo "$test_output"

exit 0
