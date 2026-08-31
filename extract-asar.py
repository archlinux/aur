#!/usr/bin/env python3
"""Extract an Electron asar archive to a directory."""
from __future__ import annotations

import json
import os
import struct
import sys
from pathlib import Path


def _walk(node: dict, prefix: str, dest: Path, blob: bytes, data_offset: int) -> None:
    files = node.get("files")
    if files is not None:
        target = dest / prefix if prefix else dest
        target.mkdir(parents=True, exist_ok=True)
        for name, child in files.items():
            child_prefix = f"{prefix}/{name}" if prefix else name
            _walk(child, child_prefix, dest, blob, data_offset)
        return

    path = dest / prefix
    path.parent.mkdir(parents=True, exist_ok=True)
    if node.get("unpacked"):
        return
    offset = int(node["offset"])
    size = int(node["size"])
    start = data_offset + offset
    path.write_bytes(blob[start : start + size])
    if node.get("executable"):
        os.chmod(path, 0o755)


def extract(asar_path: Path, dest: Path) -> None:
    blob = asar_path.read_bytes()
    # asar: uint32(4) + uint32(pickle_size) + pickle
    # pickle: uint32(payload_size) + uint32(json_len) + json + pad
    pickle_size = struct.unpack_from("<I", blob, 4)[0]
    header_buf = blob[8 : 8 + pickle_size]
    json_len = struct.unpack_from("<I", header_buf, 4)[0]
    header = json.loads(header_buf[8 : 8 + json_len])
    data_offset = 8 + pickle_size
    dest.mkdir(parents=True, exist_ok=True)
    _walk(header, "", dest, blob, data_offset)


def main() -> int:
    if len(sys.argv) != 3:
        print(f"usage: {sys.argv[0]} <archive.asar> <dest-dir>", file=sys.stderr)
        return 2
    extract(Path(sys.argv[1]), Path(sys.argv[2]))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
