#!/bin/bash
set -euo pipefail
shopt -s nullglob

KMOD_DIRS=(/usr/lib/modules/*-mnt-reform)

if (( ${#KMOD_DIRS[@]} == 0 )); then
  echo "==> No linux-mnt-reform kernels found, skipping initramfs"
  exit 0
fi

echo "==> Updating module dependencies"
for dir in "${KMOD_DIRS[@]}"; do
  KVER="$(basename "$dir")"
  echo "  -> depmod $KVER"
  /usr/bin/depmod "$KVER"
done

# Select newest kernel by version
KVER_LATEST="$(
  printf "%s\n" "${KMOD_DIRS[@]##*/}" | sort -V | tail -n1
)"

echo "==> Using latest kernel: $KVER_LATEST"

# Maintain symlink
if [ -f /boot/Image-linux-mnt-reform ]; then
  ln -sf Image-linux-mnt-reform /boot/Image
fi

echo "==> Building initramfs for $KVER_LATEST"
/usr/bin/dracut -f /boot/initramfs-linux \
  --kver "$KVER_LATEST" \
  --no-hostonly \
  --add "initqueue hwdb" \
  --omit "lvm network-manager network net-lib crypt dm mdraid nvdimm qemu qemu-net systemd-cryptsetup fido2 pkcs11 cifs lunmask resume virtfs virtiofs drm plymouth" \
  --add-drivers 'nvme nvme_core nvme_keyring nvme_auth'

