#!/bin/bash
set -euo pipefail

KVER="7.1.1-reform1"

if [[ ! -d "/usr/lib/modules/$KVER" ]]; then
  echo "==> Kernel modules directory missing for $KVER, skipping initramfs"
  exit 0
fi

echo "==> Updating module dependencies for $KVER"
/usr/bin/depmod "$KVER"

# Maintain symlink
if [ -f /boot/Image-linux-mnt-reform ]; then
  ln -sf Image-linux-mnt-reform /boot/Image
elif [ -f /boot/vmlinuz-linux-mnt-reform ]; then
  ln -sf vmlinuz-linux-mnt-reform /boot/vmlinuz-linux
fi

echo "==> Building initramfs for $KVER"
/usr/bin/dracut -f /boot/initramfs-linux \
  --kver "$KVER" \
  --no-hostonly \
  --add "initqueue hwdb" \
  --omit "lvm network-manager network net-lib crypt dm mdraid nvdimm qemu qemu-net systemd-cryptsetup fido2 pkcs11 cifs lunmask resume virtfs virtiofs drm plymouth" \
  --add-drivers 'nvme nvme_core nvme_keyring nvme_auth'
