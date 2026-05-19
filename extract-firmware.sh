#!/usr/bin/env bash
# Extract TAS2783 firmware blobs from the ASUS SmartAMP Windows driver
# installer and install them to /lib/firmware/.
#
# Dependencies (runtime): icoutils (wrestool), p7zip (7z), coreutils (sha256sum).
#
# Usage:
#   sudo extract-firmware.sh <path/to/SmartAMP_TI_DCH_*.exe>
#
# Obtain the installer from
#   https://www.asus.com/laptops/for-creators/proart/proart-px13-hn7306/helpdesk_download
# under Driver & Tools -> Windows 11 64-bit -> "TI Smart Amplifier Driver for
# Speakers" (file name: SmartAMP_TI_DCH_TexasInstruments_Z_V6.3.1.15_47519.exe).
#
# Based on SaltCube/ASUS-ProArt-PX13-Audio-Fix:extract-firmware.sh.
# The .bin payloads are TI/ASUS proprietary blobs with unclear redistribution
# terms, so the package ships only this extractor, never the binaries.
set -euo pipefail

# Embedded constants for ProArt PX13 (HN7306EAC, ASUS subsystem ID 0x1714).
INSTALLER_SHA256="8728835795be467d39c721b6245e6e038d44fcbf0d0e49718ef45cb44eb8a3ce"
FIRMWARE_8_NAME="1714-1-0x8.bin"
FIRMWARE_8_SHA256="9a105de50978fc3250062d66bea6b77f3aaabaf85280739be28ff1ed3ae535ca"
FIRMWARE_B_NAME="1714-1-0xB.bin"
FIRMWARE_B_SHA256="a975dc7e2340cb5c97259d5e8c3d7e447b5a0af1a91528c058c9fda0adeb74c1"

EXE="${1:?Usage: $0 <SmartAMP installer .exe>}"
[[ -f $EXE ]] || { echo "Not a file: $EXE" >&2; exit 1; }

for cmd in wrestool 7z sha256sum install; do
    command -v "$cmd" >/dev/null || {
        echo "Error: $cmd not found. Install icoutils and p7zip." >&2
        exit 1
    }
done

if [[ $EUID -ne 0 ]]; then
    echo "Error: must be run as root to write /lib/firmware/. Re-run with sudo." >&2
    exit 1
fi

echo "Verifying installer checksum..."
actual=$(sha256sum "$EXE" | awk '{print $1}')
if [[ $actual != "$INSTALLER_SHA256" ]]; then
    echo "Warning: installer SHA-256 mismatch (expected $INSTALLER_SHA256, got $actual)." >&2
    echo "  Continuing -- firmware hashes are still checked after extraction." >&2
fi

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

echo "Extracting firmware archive from installer..."
wrestool -x --raw --type=ZIP --name=103 "$EXE" > "$TMPDIR/firmwares.7z"

echo "Extracting firmware blobs from 7z archive..."
7z x "$TMPDIR/firmwares.7z" -o"$TMPDIR/out" \
    "Firmwares/$FIRMWARE_8_NAME" "Firmwares/$FIRMWARE_B_NAME" -y >/dev/null

echo "Verifying firmware checksums..."
fail=0
for entry in "$FIRMWARE_8_NAME:$FIRMWARE_8_SHA256" "$FIRMWARE_B_NAME:$FIRMWARE_B_SHA256"; do
    name=${entry%%:*}
    want=${entry##*:}
    got=$(sha256sum "$TMPDIR/out/Firmwares/$name" | awk '{print $1}')
    if [[ $got != "$want" ]]; then
        echo "FAIL: $name hash mismatch (expected $want, got $got)" >&2
        fail=1
    fi
done
(( fail == 0 )) || exit 1

# Kernel firmware loader expects 1714-1-8.bin, not 1714-1-0x8.bin.
target_8="${FIRMWARE_8_NAME/0x/}"
target_B="${FIRMWARE_B_NAME/0x/}"

install -d -m 755 /lib/firmware/ti/audio/tas2783
install -m 644 "$TMPDIR/out/Firmwares/$FIRMWARE_8_NAME" "/lib/firmware/$target_8"
install -m 644 "$TMPDIR/out/Firmwares/$FIRMWARE_B_NAME" "/lib/firmware/$target_B"
install -m 644 "$TMPDIR/out/Firmwares/$FIRMWARE_8_NAME" "/lib/firmware/ti/audio/tas2783/$target_8"
install -m 644 "$TMPDIR/out/Firmwares/$FIRMWARE_B_NAME" "/lib/firmware/ti/audio/tas2783/$target_B"

echo
echo "OK -- installed:"
echo "  /lib/firmware/$target_8"
echo "  /lib/firmware/$target_B"
echo "  /lib/firmware/ti/audio/tas2783/$target_8"
echo "  /lib/firmware/ti/audio/tas2783/$target_B"
echo
echo "Reload the codec to pick up the firmware:"
echo "  sudo modprobe -r snd_soc_tas2783_sdw && sudo modprobe snd_soc_tas2783_sdw"
echo "Or just reboot."
