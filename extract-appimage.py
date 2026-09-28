#!/usr/bin/env python3
"""Extract a type-2 AppImage without executing architecture-specific code."""
import struct
import subprocess
import sys

with open(sys.argv[1], 'rb') as image:
    header = image.read(64)
    if header[:6] != b'\x7fELF\x02\x01' or header[8:11] != b'AI\x02':
        raise SystemExit('Expected a little-endian ELF64 type-2 AppImage')
    offset = (struct.unpack_from('<Q', header, 40)[0]
              + struct.unpack_from('<H', header, 58)[0]
              * struct.unpack_from('<H', header, 60)[0])
    image.seek(offset)
    if image.read(4) != b'hsqs':
        raise SystemExit('AppImage SquashFS header not found')
subprocess.run(['unsquashfs', '-no-progress', '-o', str(offset),
                '-d', sys.argv[2], sys.argv[1],
                'resources/app.asar.unpacked/out/mcp-server-*'], check=True)
