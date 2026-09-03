#!/usr/bin/env python3
"""Extract, pack, or inject a file into an Electron asar archive."""
from __future__ import annotations

import hashlib
import json
import os
import shutil
import struct
import sys
import tempfile
from pathlib import Path

_BLOCK_SIZE = 4 * 1024 * 1024


def _read_header(blob: bytes) -> tuple[dict, int]:
    pickle_size = struct.unpack_from("<I", blob, 4)[0]
    header_buf = blob[8 : 8 + pickle_size]
    json_len = struct.unpack_from("<I", header_buf, 4)[0]
    header = json.loads(header_buf[8 : 8 + json_len])
    return header, 8 + pickle_size


def _walk_extract(
    node: dict, prefix: str, dest: Path, blob: bytes, data_offset: int
) -> None:
    files = node.get("files")
    if files is not None:
        target = dest / prefix if prefix else dest
        target.mkdir(parents=True, exist_ok=True)
        for name, child in files.items():
            child_prefix = f"{prefix}/{name}" if prefix else name
            _walk_extract(child, child_prefix, dest, blob, data_offset)
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
    header, data_offset = _read_header(blob)
    dest.mkdir(parents=True, exist_ok=True)
    _walk_extract(header, "", dest, blob, data_offset)


def unpacked_paths(asar_path: Path) -> set[str]:
    blob = asar_path.read_bytes()
    header, _ = _read_header(blob)
    found: set[str] = set()

    def walk(node: dict, prefix: str) -> None:
        files = node.get("files")
        if files is not None:
            for name, child in files.items():
                walk(child, f"{prefix}/{name}" if prefix else name)
            return
        if node.get("unpacked"):
            found.add(prefix)

    walk(header, "")
    return found


def _integrity(data: bytes) -> dict:
    blocks = [
        hashlib.sha256(data[i : i + _BLOCK_SIZE]).hexdigest()
        for i in range(0, max(len(data), 1), _BLOCK_SIZE)
    ]
    if not data:
        blocks = [hashlib.sha256(b"").hexdigest()]
    return {
        "algorithm": "SHA256",
        "hash": hashlib.sha256(data).hexdigest(),
        "blockSize": _BLOCK_SIZE,
        "blocks": blocks,
    }


def _pickle_string(payload: bytes) -> bytes:
    body = struct.pack("<I", len(payload)) + payload
    body += b"\x00" * ((4 - (len(body) % 4)) % 4)
    return struct.pack("<I", len(body)) + body


def pack(src: Path, asar_path: Path, unpacked: set[str]) -> None:
    files_header: dict = {"files": {}}
    blobs: list[bytes] = []
    offset = 0

    def ensure_dir(parts: list[str]) -> dict:
        node = files_header
        for part in parts:
            node = node["files"].setdefault(part, {"files": {}})
        return node

    for path in sorted(src.rglob("*")):
        if not path.is_file() or path.is_symlink():
            continue
        rel = path.relative_to(src).as_posix()
        data = path.read_bytes()
        entry: dict = {"size": len(data), "integrity": _integrity(data)}
        parent = ensure_dir(rel.split("/")[:-1]) if "/" in rel else files_header
        if rel in unpacked:
            entry["unpacked"] = True
        else:
            entry["offset"] = str(offset)
            blobs.append(data)
            offset += len(data)
        parent["files"][path.name] = entry

    header_json = json.dumps(files_header, separators=(",", ":")).encode()
    header_pickle = _pickle_string(header_json)
    prefix = struct.pack("<II", 4, len(header_pickle))
    asar_path.write_bytes(prefix + header_pickle + b"".join(blobs))


def inject_tray(asar_path: Path, unpacked_dir: Path, tray_path: Path) -> None:
    """Keep the asar packed. Add a main-process wrapper and rewrite package.json."""
    keep_unpacked = unpacked_paths(asar_path)
    with tempfile.TemporaryDirectory(prefix="asar-inject-") as tmp:
        dest = Path(tmp) / "app"
        extract(asar_path, dest)
        if unpacked_dir.is_dir():
            shutil.copytree(unpacked_dir, dest, dirs_exist_ok=True)
        tray_dest = dest / "dist" / "electron-main" / "linux-tray.cjs"
        shutil.copyfile(tray_path, tray_dest)
        pkg_path = dest / "package.json"
        data = json.loads(pkg_path.read_text())
        data["main"] = "dist/electron-main/linux-tray.cjs"
        pkg_path.write_text(json.dumps(data, indent=2) + "\n")
        pack(dest, asar_path, keep_unpacked)


def main() -> int:
    if len(sys.argv) == 3:
        extract(Path(sys.argv[1]), Path(sys.argv[2]))
        return 0
    if len(sys.argv) == 5 and sys.argv[1] == "inject-tray":
        inject_tray(Path(sys.argv[2]), Path(sys.argv[3]), Path(sys.argv[4]))
        return 0
    print(
        "usage:\n"
        f"  {sys.argv[0]} <archive.asar> <dest-dir>\n"
        f"  {sys.argv[0]} inject-tray <archive.asar> <asar.unpacked> <linux-tray.cjs>",
        file=sys.stderr,
    )
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
