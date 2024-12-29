#!/bin/sh
set -euo pipefail

SLOT=1
ROOTDEV=/dev/nvme0n1p2

MEASURED_PIN="$(dmesg | grep -F 'Clevis pin:' | cut -d: -f2- | tr -d '=\r\n\t ')"

if ! clevis luks list -d "${ROOTDEV}" -s "${SLOT}" | grep -qF 'tpm2'; then
	clevis luks unbind -d "${ROOTDEV}" -s "${SLOT}" || true
	clevis luks bind -d "${ROOTDEV}" -s "${SLOT}" tpm2 "${MEASURED_PIN}"
else
	clevis luks edit -d "${ROOTDEV}" -s "${SLOT}" -c "${MEASURED_PIN}"
fi
