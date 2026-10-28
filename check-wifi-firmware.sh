#!/usr/bin/env bash
# Warn when the MT7927 WiFi firmware is missing. Run from the DEB postinst, the
# RPM %post and a live `make install`; the Arch .install script carries its own
# copy of this check.
#
# Since 2.14-4 this package no longer installs the WiFi blobs, so they stop
# shadowing the newer vendor build in linux-firmware. On a system whose
# linux-firmware predates MR !1055 that leaves no copy at all, and the driver
# then fails with "Direct firmware load ... failed with error -2" (GH #120).
# Warn while the user is still looking at the terminal.
#
# FIRMWARE_DIR exists so the check can be tested against a scratch tree; leave
# it unset for real use.

fw_dir=${FIRMWARE_DIR:-/usr/lib/firmware/mediatek/mt7927}
missing=()

for blob in WIFI_RAM_CODE_MT6639_2_1.bin WIFI_MT6639_PATCH_MCU_2_1_hdr.bin; do
    [[ -e $fw_dir/$blob || -e $fw_dir/$blob.zst || -e $fw_dir/$blob.xz ]] || missing+=("$blob")
done

((${#missing[@]})) || exit 0

cat <<EOF
==> WARNING: MT7927 WiFi firmware not found in $fw_dir:
$(printf '      %s\n' "${missing[@]}")
    This package does not ship the WiFi firmware, because doing so shadowed the
    newer MediaTek-submitted build in linux-firmware. Your linux-firmware appears
    to predate that submission, so the WiFi driver will fail to start.
    Update linux-firmware BEFORE rebooting, or extract the blobs from your
    board vendor's driver ZIP - see "WiFi firmware" in the README.
EOF
exit 0
