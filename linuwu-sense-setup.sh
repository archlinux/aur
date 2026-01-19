#!/bin/bash

# Configuration
MODULE_NAME="linuwu-sense"
MODULE_VERSION="1.0.0"

echo ">>> Starting Linuwu-Sense setup..."

# Function to detect compiler used for kernel build
get_kernel_compiler() {
    local kver="$1"
    # Try /usr/lib/modules first (Arch), then /lib/modules (Debian/Fedora)
    local build_dir="/usr/lib/modules/$kver/build"
    [ ! -d "$build_dir" ] && build_dir="/lib/modules/$kver/build"
    
    if [ ! -d "$build_dir" ]; then
        echo "unknown"
        return
    fi

    # Check .config for CONFIG_CC_IS_CLANG
    if grep -q "CONFIG_CC_IS_CLANG=y" "$build_dir/.config" 2>/dev/null; then
        echo "clang"
    elif grep -q "CONFIG_CC_IS_GCC=y" "$build_dir/.config" 2>/dev/null; then
        echo "gcc"
    else
        # Fallback: try to guess from /proc/config.gz if valid for running kernel, 
        # but for offline kernels, we rely on headers. 
        # If no .config, we assume GCC as it's standard for most.
        echo "gcc" 
    fi
}

# Loop through all kernels in /lib/modules (standard) or /usr/lib/modules (Arch)
MODULES_DIR="/lib/modules"
[ ! -d "$MODULES_DIR" ] && MODULES_DIR="/usr/lib/modules"

for kdir in "$MODULES_DIR"/*; do
    if [ ! -d "$kdir" ]; then continue; fi
    
    KVER=$(basename "$kdir")
    
    # Skip if build directory doesn't exist (headers not installed)
    if [ ! -d "$kdir/build" ]; then
        echo ">>> Skipping kernel $KVER: Headers not found in $kdir/build"
        continue
    fi
    
    echo ">>> Processing kernel: $KVER"
    
    COMPILER=$(get_kernel_compiler "$KVER")
    echo "    Detected compiler: $COMPILER"
    
    # Prepare build environment
    if [ "$COMPILER" == "clang" ]; then
        echo "    Enabling LLVM=1 for Clang build"
        export LLVM=1
        export CC=clang
    else
        unset LLVM
        unset CC
    fi
    
    # Add/Build/Install
    # dkms add/build/install handles checking if already done, but we force install to ensure checks pass
    
    # Ensure it is added first to the DKMS tree
    # If dkms status returns output, it is already added (state could be added, built, or installed)
    if ! dkms status -m "$MODULE_NAME" -v "$MODULE_VERSION" | grep -q "$MODULE_NAME"; then
         echo "    Adding to DKMS tree..."
         dkms add -m "$MODULE_NAME" -v "$MODULE_VERSION" || true
    fi
    
    echo "    Building/Installing for $KVER..."
    dkms install -m "$MODULE_NAME" -v "$MODULE_VERSION" -k "$KVER"
    
    if [ $? -eq 0 ]; then
        echo "    Success for $KVER"
    else
        echo "    Failed to install for $KVER"
    fi
    
    # Clean up env
    unset LLVM
    unset CC
done
