#!/usr/bin/env python3
"""Validate the dedicated Arch worker without executing it or loading its ABI."""
import json
from pathlib import Path
import re
import subprocess
import sys

root = Path(sys.argv[1])
required = {"libavcodec.so.63", "libavutil.so.61", "libswscale.so.10"}
allowed = required | {"libavformat.so.63"}
for name in ("lightos-codec-ffmpeg", "LICENSE", "README.md", "dependencies.txt", "ffmpeg-abi.txt", "abi.json",
             "licenses/dependencies.txt", "licenses/ffmpeg-runtime.txt"):
    path = root / name
    if not path.is_file() or path.is_symlink() or path.stat().st_size == 0:
        raise SystemExit(f"Missing regular Arch worker payload: {name}")
binary = root / "lightos-codec-ffmpeg"
header = subprocess.check_output(["readelf", "-h", binary], text=True)
if "Advanced Micro Devices X86-64" not in header:
    raise SystemExit("Expected an x86_64 Arch worker ELF")
dynamic = subprocess.check_output(["readelf", "-d", binary], text=True)
needed = re.findall(r"\(NEEDED\).*\[([^]]+)\]", dynamic)
actual = {name for name in needed if re.match(r"lib(?:av\w+|swscale)\.so", name)}
manifest = json.loads((root / "abi.json").read_text())
if manifest.get("platform") != "archlinux-x86_64" or not re.fullmatch(r"[0-9a-f]{40}", manifest.get("source_commit", "")):
    raise SystemExit("Expected Arch platform and exact worker source commit")
if len(sys.argv) > 2 and manifest["source_commit"] != sys.argv[2]:
    raise SystemExit("Arch worker source commit does not match the release tag")
if not required <= actual <= allowed or set(manifest["ffmpeg_sonames"]) != actual:
    raise SystemExit("Arch worker FFmpeg ABI does not match the package SONAME dependencies")
if set(manifest["needed"]) != set(needed):
    raise SystemExit("Arch worker ABI manifest does not match its ELF")
if any("libturbojpeg" in name for name in needed):
    raise SystemExit("Arch worker must retain its bundled JPEG encoder")
if "not found" in (root / "dependencies.txt").read_text():
    raise SystemExit("Arch worker build recorded unresolved runtime libraries")
