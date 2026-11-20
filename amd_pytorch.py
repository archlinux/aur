#!/usr/bin/env python3
"""Pick the newest ROCm line, then the newest torch/torchvision/torchaudio on top of it,
from AMD's gfx90a wheel index (PEP 503 simple index).

Modes:
  --print-version  print "<torch-ver>+rocm<rocm>" (used as nvchecker version string)
  --eval           print shell assignments TORCH_VER / TV_VER / TA_VER / ROCM_VER
  (default)        human readable table
"""

import argparse
import os
import re
import sys
import urllib.parse
import urllib.request

BASE = os.environ.get(
    "UNSLOTH_UPDATER_WHL_INDEX",
    "https://stable.repo.amd.com/rocm/pytorch/whl-next/",
).rstrip("/") + "/"
PKGS = ("torch", "torchvision", "torchaudio")


def vkey(v: str):
    """Comparable key: numeric chunks compare numerically, others lexically."""
    return tuple(
        (0, int(p), "") if p.isdigit() else (1, 0, p)
        for p in re.split(r"[._\-+]", v)
    )


def fetch_index(pkg: str):
    url = BASE + pkg + "/"
    with urllib.request.urlopen(url, timeout=60) as r:
        body = r.read().decode("utf-8", "replace")
    hrefs = re.findall(r'href="([^"]+\.whl)(?:#[^"]*)?"', body)
    wheels = set()
    for h in hrefs:
        name = urllib.parse.unquote(h.rsplit("/", 1)[-1])
        if not name.endswith("linux_x86_64.whl"):
            continue
        parts = name.split("-")
        if len(parts) < 5 or parts[0].replace("_", "-").lower() != pkg:
            continue
        wheels.add(parts[1])  # version incl. +local
    return wheels


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--print-version", action="store_true")
    ap.add_argument("--eval", action="store_true")
    args = ap.parse_args()

    # rocm -> pkg -> best base version
    by_rocm: dict = {}
    for pkg in PKGS:
        try:
            versions = fetch_index(pkg)
        except Exception as e:  # noqa: BLE001 - surface as hard error for nvchecker
            print(f"failed to read index for {pkg}: {e}", file=sys.stderr)
            return 1
        for v in versions:
            base, _, local = v.partition("+")
            m = re.match(r"rocm(\d[^+]*)$", local)
            if not m:
                continue
            rocm = m.group(1)
            cur = by_rocm.setdefault(rocm, {}).get(pkg)
            if cur is None or vkey(base) > vkey(cur):
                by_rocm[rocm][pkg] = base

    # newest ROCm line that carries all three packages
    for rocm in sorted(by_rocm, key=vkey, reverse=True):
        pkgs = by_rocm[rocm]
        if all(p in pkgs for p in PKGS):
            break
    else:
        print("no ROCm line provides torch/torchvision/torchaudio", file=sys.stderr)
        return 1

    full = {p: f"{pkgs[p]}+rocm{rocm}" for p in PKGS}

    if args.print_version:
        print(full["torch"])
    elif args.eval:
        print(f"ROCM_VER={rocm!r}")
        print(f"TORCH_VER={full['torch']!r}")
        print(f"TV_VER={full['torchvision']!r}")
        print(f"TA_VER={full['torchaudio']!r}")
    else:
        print(f"rocm={rocm} torch={full['torch']} torchvision={full['torchvision']} torchaudio={full['torchaudio']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
