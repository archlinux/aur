#!/bin/bash
USBFS_MEMORY_MB_VALUE=${USBFS_MEMORY_MB_VALUE:-256}
SYSTEMS_USBFS_MEMORY_MB_VALUE=\$(cat /sys/module/usbcore/parameters/usbfs_memory_mb)
echo \"usbcore.usbfs_memory_mb:  \${SYSTEMS_USBFS_MEMORY_MB_VALUE}\" | systemd-cat -p info
echo \"Changing to: \${USBFS_MEMORY_MB_VALUE} MB\"
sh -c \"echo \${USBFS_MEMORY_MB_VALUE} > /sys/module/usbcore/parameters/usbfs_memory_mb\"

SYSTEMS_USBFS_MEMORY_MB_VALUE=\$(cat /sys/module/usbcore/parameters/usbfs_memory_mb)
if [ $? -eq 0 ]; then
echo \"usbcore.usbfs_memory_mb: Changed sucessfully to: \${SYSTEMS_USBFS_MEMORY_MB_VALUE} MB\" | systemd-cat -p info
else
echo \"usbcore.usbfs_memory_mb: Could not be modified. Error: ${?}\" | systemd-cat -p error
fi
exit 0