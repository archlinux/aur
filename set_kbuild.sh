#!/bin/bash
board_name="Unknown"

if [ -f "/sys/class/dmi/id/board_name" ]; then
    board_name="$(cat /sys/class/dmi/id/board_name)"
fi

echo "----------------------------------------------------------------"
echo ":: Motorcomm YT6801 DKMS Pre-Build Assessment"

if [ "GXxHRXx" = "$board_name" ] || [ "GM5IXxA" = "$board_name" ]; then
    echo ":: Known problematic board '$board_name' detected."
    echo ":: Action: Copying Kbuild_no_aspm to Kbuild (ASPM disabled)."
    cp Kbuild_no_aspm Kbuild
else
    echo ":: No problematic board detected (Board: '$board_name')."
    echo ":: Action: Copying Kbuild_default to Kbuild (ASPM enabled)."
    cp Kbuild_default Kbuild
fi
echo "----------------------------------------------------------------"
