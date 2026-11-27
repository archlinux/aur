#!/usr/bin/bash
set -euo pipefail

# DKMS supplies these:
#   kernelver
#   kernel_source_dir

module_root="$(pwd)"
hid_dir="${module_root}/drivers/hid"
cache_root="${module_root}/.cache/hid-logitech-k400plus"

# Arch examples:
#   7.1.9-arch1-2.1      -> 7.1.9
#   6.12.47-1-lts        -> 6.12.47
#   6.16.3-zen1-1-zen    -> 6.16.3
upstream_version="${kernelver%%-*}"
tag="v${upstream_version}"

case "${kernelver}" in
    *-arch*)
        ;;
    *)
        echo "Warning: kernel ${kernelver} is not an Arch stock linux kernel;" >&2
        echo "building against upstream ${tag} driver source." >&2
        ;;
esac

cache="${cache_root}/${upstream_version}"

base_url="https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain"

echo "Preparing hid-logitech-hidpp for kernel ${kernelver}"
echo "Using upstream source tag ${tag}"

mkdir -p \
    "${cache}/usbhid" \
    "${hid_dir}/usbhid"

fetch()
{
    local remote="$1"
    local target="$2"

    if [[ -s "${target}" ]]; then
        return
    fi

    local tmp="${target}.tmp"

    echo "Downloading ${remote}"

    curl \
        --fail \
        --location \
        --proto '=https' \
        --retry 3 \
        --retry-delay 2 \
        --output "${tmp}" \
        "${base_url}/${remote}?h=${tag}"

    mv "${tmp}" "${target}"
}

fetch \
    "drivers/hid/hid-logitech-hidpp.c" \
    "${cache}/hid-logitech-hidpp.c"

grep -q 'Logitech devices relying on the HID++ specification' \
    "${cache}/hid-logitech-hidpp.c" ||
{
    echo "Downloaded hid-logitech-hidpp.c does not look valid" >&2
    rm -f "${cache}/hid-logitech-hidpp.c"
    exit 1
}

fetch \
    "drivers/hid/hid-ids.h" \
    "${cache}/hid-ids.h"

fetch \
    "drivers/hid/usbhid/usbhid.h" \
    "${cache}/usbhid/usbhid.h"

install -m644 \
    "${cache}/hid-logitech-hidpp.c" \
    "${hid_dir}/hid-logitech-hidpp.c"

install -m644 \
    "${cache}/hid-ids.h" \
    "${hid_dir}/hid-ids.h"

install -m644 \
    "${cache}/usbhid/usbhid.h" \
    "${hid_dir}/usbhid/usbhid.h"

install -m644 \
    "${module_root}/Makefile.hid" \
    "${hid_dir}/Makefile"

cd "${module_root}"

patch \
    --forward \
    --batch \
    -p1 \
    < k400plus-native-touchpad.patch
