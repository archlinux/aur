#!/usr/bin/env python3
"""Extract a firmware blob from a MediaTek mtkwlan.dat container.

Usage: extract-bt-firmware.py <mtkwlan.dat> <blob name> <output file>

Container layout per entry: null-terminated ASCII name, null padding, a
14-digit build stamp, then 4-byte-aligned little-endian u32 offset and size.
"""

import struct
import sys

BUILD_STAMP_LEN = 14


def digits(chunk: bytes) -> bool:
    return len(chunk) == BUILD_STAMP_LEN and all(0x30 <= b <= 0x39 for b in chunk)


def extract(data: bytes, name: bytes) -> bytes:
    idx = data.find(name)
    if idx == -1:
        raise SystemExit(f"{name.decode()}: no such entry in container")

    pos = idx + len(name)
    while pos < len(data) and data[pos] == 0:
        pos += 1
    if digits(data[pos : pos + BUILD_STAMP_LEN]):
        pos += BUILD_STAMP_LEN
    pos = (pos + 3) & ~3

    if pos + 8 > len(data):
        raise SystemExit(f"{name.decode()}: container truncated at entry header")

    offset, size = struct.unpack_from("<II", data, pos)
    blob = data[offset : offset + size]
    if len(blob) != size:
        raise SystemExit(f"{name.decode()}: header claims {size} bytes, container holds {len(blob)}")
    if not digits(blob[:BUILD_STAMP_LEN]):
        raise SystemExit(f"{name.decode()}: blob does not start with a build stamp, wrong offset")
    return blob


def main() -> None:
    if len(sys.argv) != 4:
        raise SystemExit(__doc__)
    container, name, output = sys.argv[1:]

    with open(container, "rb") as f:
        blob = extract(f.read(), name.encode())
    with open(output, "wb") as f:
        f.write(blob)

    print(f"{name}: {len(blob)} bytes, build {blob[:BUILD_STAMP_LEN].decode()} -> {output}")


if __name__ == "__main__":
    main()
