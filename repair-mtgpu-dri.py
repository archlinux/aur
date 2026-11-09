#!/usr/bin/env python3
"""Repair mtgpu_dri.so WaylandSwapChain destructor double-free in-place."""
import hashlib
import sys
from pathlib import Path

ORIGINAL_SHA = '2583b5c4e793389e0d130bfb8895884dfdee358ac70d63195deeba1eb0d1a07c'
REPAIRED_SHA = '05cd2ddd3dcb2c0a77994d52b959548babcf912027b550efb9a45aeb6201fc23'

def main():
    if len(sys.argv) < 2:
        print('Usage: repair-mtgpu-dri.py <path_to_mtgpu_dri.so>', file=sys.stderr)
        sys.exit(1)
    target = Path(sys.argv[1])
    data = bytearray(target.read_bytes())
    sha_orig = hashlib.sha256(data).hexdigest()
    if sha_orig == REPAIRED_SHA:
        print('Already repaired:', target)
        return
    if sha_orig != ORIGINAL_SHA:
        raise ValueError(f'Unexpected SHA256 for {target}: {sha_orig}')
    for offset, expected in ((0x5A51A0, 'e8dbe7daff'), (0x5875E0, 'e89bc3dcff')):
        if data[offset:offset + 5] != bytes.fromhex(expected):
            raise ValueError(f'Unexpected opcode at offset {offset:#x}')
        data[offset:offset + 5] = bytes.fromhex('0f1f440000')
    sha_new = hashlib.sha256(data).hexdigest()
    if sha_new != REPAIRED_SHA:
        raise ValueError(f'Patch verification failed: got {sha_new}')
    target.write_bytes(data)
    print('Successfully repaired WaylandSwapChain destructors:', target)

if __name__ == '__main__':
    main()
