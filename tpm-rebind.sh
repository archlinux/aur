#!/bin/sh
set -euo pipefail

ROOTDEV_UUID="$(grep -oP 'cryptdevice=UUID=[0-9a-f-]+' /proc/cmdline | cut -d= -f3)"
ROOTDEV="/dev/disk/by-uuid/${ROOTDEV_UUID}"

MEASURED_PIN="$(dmesg | grep -F 'Clevis pin:' | head -1 | cut -d: -f2- | tr -d '=\r\n\t ')"

TPM2_PIN="$(clevis luks list -d "${ROOTDEV}" | grep -F 'tpm2' || true)"

if [ -z "$TPM2_PIN" ]; then
	echo 'No binding found, creating a new one!'
	clevis luks bind -d "${ROOTDEV}" tpm2 "${MEASURED_PIN}"
else
	SLOT="$(echo "${TPM2_PIN}" | cut -d: -f1)"
	echo "Binding already exists in slot ${SLOT}, rebinding!"
	clevis luks edit -d "${ROOTDEV}" -s "${SLOT}" -c "${MEASURED_PIN}"
fi
