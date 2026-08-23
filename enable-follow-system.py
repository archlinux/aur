#!/usr/bin/env python3
"""Linux follow-system: settings checkbox + libframe NativeTheme offset.

No webpage scripts. Theme apply happens in the browser process
(LarkThemeImpl / DarkModeManagerLinux / this package's LD_PRELOAD).
"""
from __future__ import annotations

import argparse
import hashlib
import json
import struct
import sys
from pathlib import Path

GATE_OLD = b"supportFollowSystem:n"
GATE_NEW = b"supportFollowSystem:1"

# LarkThemeImpl::OnNativeThemeUpdated:
#   movzbl 0x40(%rsi), %r8d ; mov %r8d, 0x70(%rdi)
# Chromium 131 stores use_dark_colors at NativeTheme+0x69.
LIBFRAME_OLD = bytes.fromhex("440fb6464044894770")
LIBFRAME_NEW = bytes.fromhex("440fb6466944894770")


def _walk(d: dict, prefix: str = ""):
    for k, v in d.items():
        path = f"{prefix}/{k}" if prefix else k
        if isinstance(v, dict) and "files" in v:
            yield from _walk(v["files"], path)
        else:
            yield path, v


def _load_index(data: bytes) -> tuple[int, dict]:
    pickle_size = struct.unpack_from("<I", data, 4)[0]
    data_start = 8 + pickle_size
    raw = data[16 : 8 + pickle_size]
    joff = raw.find(b'{"files"')
    if joff < 0:
        raise RuntimeError("asar json header not found")
    raw = raw[joff:]
    raw = raw[: raw.rfind(b"}") + 1]
    return data_start, json.loads(raw)


def patch_setting_asar(path: Path, dry_run: bool = False) -> None:
    data = bytearray(path.read_bytes())
    if GATE_OLD not in data:
        if GATE_NEW in data:
            print(f"setting checkbox already patched: {path}")
            return
        raise RuntimeError(f"checkbox gate not found in {path}")

    data_start, idx = _load_index(data)
    target = None
    for name, meta in _walk(idx["files"]):
        off = int(meta.get("offset", "0"))
        size = int(meta.get("size", 0))
        blob = bytes(data[data_start + off : data_start + off + size])
        if GATE_OLD in blob:
            target = (name, off, size, meta, blob)
            break
    if target is None:
        raise RuntimeError("checkbox gate not found inside setting.asar")

    name, off, size, meta, blob = target
    if blob.count(GATE_OLD) != 1:
        raise RuntimeError(f"{name}: expected 1 gate, got {blob.count(GATE_OLD)}")
    patched = blob.replace(GATE_OLD, GATE_NEW, 1)
    if len(patched) != len(blob):
        raise RuntimeError("setting.asar patch must be same size")

    print(f"setting.asar: {name}")
    if dry_run:
        return

    data[data_start + off : data_start + off + size] = patched
    old_hash = (meta.get("integrity") or {}).get("hash")
    if old_hash:
        new_hash = hashlib.sha256(patched).hexdigest()
        header = bytes(data[:data_start]).replace(old_hash.encode(), new_hash.encode())
        if len(header) != data_start:
            raise RuntimeError("setting.asar integrity replace failed")
        data[:data_start] = header
    path.write_bytes(data)
    print(f"patched checkbox {path}")


def patch_libframe(path: Path, dry_run: bool = False) -> None:
    data = path.read_bytes()
    n_old = data.count(LIBFRAME_OLD)
    n_new = data.count(LIBFRAME_NEW)
    if n_old == 0 and n_new == 1:
        print(f"libframe NativeTheme offset already patched: {path}")
        return
    if n_old == 0:
        print(f"warn: libframe theme pattern not found (non-x86_64?): {path}")
        return
    if n_old != 1:
        raise RuntimeError(f"{path}: expected 1 NativeTheme pattern, got {n_old}")
    print(f"libframe.so: NativeTheme+0x40 -> +0x69")
    if dry_run:
        return
    path.write_bytes(data.replace(LIBFRAME_OLD, LIBFRAME_NEW, 1))
    again = path.read_bytes()
    if again.count(LIBFRAME_NEW) != 1 or LIBFRAME_OLD in again:
        raise RuntimeError("libframe patch verify failed")
    print(f"patched {path}")


def patch_tree(root: Path, dry_run: bool = False) -> int:
    if root.name == "webcontent":
        feishu = root.parent
        webcontent = root
    else:
        feishu = root
        webcontent = root / "webcontent"
    setting = webcontent / "setting.asar"
    libframe = feishu / "libframe.so"
    if setting.is_file():
        patch_setting_asar(setting, dry_run=dry_run)
    else:
        print(f"warn: missing {setting}")
    if libframe.is_file():
        patch_libframe(libframe, dry_run=dry_run)
    else:
        print(f"warn: missing {libframe}")
    return 0


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument(
        "target",
        type=Path,
        help="opt/bytedance/feishu, webcontent/, setting.asar, or libframe.so",
    )
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    target: Path = args.target
    if not target.exists():
        print(f"not found: {target}", file=sys.stderr)
        return 1
    if target.is_dir():
        return patch_tree(target, dry_run=args.dry_run)
    if target.name == "setting.asar":
        patch_setting_asar(target, dry_run=args.dry_run)
        return 0
    if target.name == "libframe.so":
        patch_libframe(target, dry_run=args.dry_run)
        return 0
    print("pass feishu dir / webcontent / setting.asar / libframe.so", file=sys.stderr)
    return 1


if __name__ == "__main__":
    sys.exit(main())
