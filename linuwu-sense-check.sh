#!/bin/bash

MODULE_NAME="linuwu_sense"
KVER=$(uname -r)

echo ">>> Checking Linuwu-Sense status for kernel $KVER..."

# 1. Check if module is loaded
if lsmod | grep -q "$MODULE_NAME"; then
    echo "[OK] Module '$MODULE_NAME' is currently loaded."
else
    echo "[WARN] Module '$MODULE_NAME' is NOT loaded."
    
    # 2. Check if modinfo can find it
    echo ">>> Checking with modinfo..."
    if modinfo "$MODULE_NAME" > /dev/null 2>&1; then
        echo "[OK] Module found in disk for current kernel."
        echo "     Version: $(modinfo -F version "$MODULE_NAME")"
        echo "     Filename: $(modinfo -F filename "$MODULE_NAME")"
    else
        echo "[FAIL] Module '$MODULE_NAME' not found for kernel $KVER."
    fi
fi

# 3. Check DKMS status
echo ">>> Checking DKMS status..."
dkms status -m linuwu-sense
