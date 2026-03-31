#!/usr/bin/env python3

import os
import struct
import sys
import zipfile

# All firmware blobs to extract from mtkwlan.dat
FIRMWARE_BLOBS = [
    "BT_RAM_CODE_MT6639_2_1_hdr.bin",
    "WIFI_MT6639_PATCH_MCU_2_1_hdr.bin",
    "WIFI_RAM_CODE_MT6639_2_1.bin",
]


def extract_by_name(data, name, output_path):
    """Extract a named firmware blob from a mtkwlan.dat container.

    The container format has entries with:
      - A null-terminated ASCII name
      - Padding nulls + a 14-digit numeric timestamp
      - 4-byte aligned offset and size fields (little-endian u32)
      - The firmware blob at the given offset
    """
    name_bytes = name.encode() if isinstance(name, str) else name
    idx = data.find(name_bytes)
    if idx == -1:
        raise RuntimeError(f"Firmware entry '{name}' not found in container")

    entry_pos = idx + len(name_bytes)

    # Skip null padding after name
    while entry_pos < len(data) and data[entry_pos] == 0x00:
        entry_pos += 1

    # Skip 14-digit numeric timestamp if present
    if all(48 <= b <= 57 for b in data[entry_pos : entry_pos + 14]):
        entry_pos += 14

    # Align to 4-byte boundary
    entry_pos = (entry_pos + 3) & ~3

    if entry_pos + 8 > len(data):
        raise RuntimeError(
            f"Unexpected end of data while parsing entry '{name}' "
            f"(need 8 bytes at offset {entry_pos}, but data is {len(data)} bytes)"
        )

    data_offset = struct.unpack_from("<I", data, entry_pos)[0]
    data_size = struct.unpack_from("<I", data, entry_pos + 4)[0]

    blob = data[data_offset : data_offset + data_size]

    if len(blob) != data_size:
        raise RuntimeError(
            f"Size mismatch for '{name}': expected {data_size}, got {len(blob)}"
        )

    out_dir = os.path.dirname(output_path)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)

    with open(output_path, "wb") as f:
        f.write(blob)

    print(f"Extracted {name}: {len(blob)} bytes -> {output_path}")


def extract_all(input_path, output_dir):
    """Extract all known firmware blobs to a directory.

    input_path can be a .zip file (reads mtkwlan.dat from it) or a raw
    mtkwlan.dat file.
    """
    if input_path.lower().endswith(".zip"):
        with zipfile.ZipFile(input_path) as zf:
            data = zf.read("mtkwlan.dat")
    else:
        with open(input_path, "rb") as f:
            data = f.read()

    os.makedirs(output_dir, exist_ok=True)

    for name in FIRMWARE_BLOBS:
        output_path = os.path.join(output_dir, name)
        extract_by_name(data, name, output_path)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("usage: extract_firmware.py <driver.zip or mtkwlan.dat> <output-dir>")
        print("  Extracts all firmware blobs to output-dir.")
        print("  Input can be the driver ZIP (mtkwlan.dat read from it) or raw mtkwlan.dat.")
        sys.exit(1)

    extract_all(sys.argv[1], sys.argv[2])
