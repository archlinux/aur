#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
# Fix ELF load command alignment in libtorch_cpu.so (all known paths).
# Pre-built ROCm/CUDA binaries sometimes ship zero-length LOAD segments with
# misaligned p_offset.  glibc rejects these at dlopen() with:
#   "Inappropriate ioctl for device"
# The fix is idempotent — skip segments already aligned.
# Runs during package install/upgrade (pacman -U) and via pacman hook on
# libtorch/libtorch-cuda/libtorch-rocm upgrades.

import os
import struct
import sys

PATHS = [
    "/opt/libtorch-cuda/lib/libtorch_cpu.so",
    "/opt/libtorch-rocm/lib/libtorch_cpu.so",
    "/opt/libtorch/lib/libtorch_cpu.so",
    "/opt/libtorch-cpu/lib/libtorch_cpu.so",
]

def fix_elf(path):
    if not os.path.isfile(path):
        return
    if not os.access(path, os.W_OK):
        print(f"  skipping {path} (not writable)")
        return

    with open(path, "r+b") as f:
        f.seek(32)
        e_phoff = struct.unpack("<Q", f.read(8))[0]
        f.seek(56)
        e_phnum = struct.unpack("<H", f.read(2))[0]
        fixed = 0
        for i in range(e_phnum):
            entry_off = e_phoff + i * 56
            f.seek(entry_off)
            fields = struct.unpack("<IIQQQQQQ", f.read(56))
            p_type, p_flags, p_offset, p_vaddr, p_paddr, p_filesz, p_memsz, p_align = fields
            if p_type != 1 or p_filesz or p_memsz:
                continue
            if (p_vaddr - p_offset) & (p_align - 1) == 0:
                continue
            f.seek(entry_off + 8)
            f.write(struct.pack("<Q", p_vaddr))
            print(f"  segment {i}: p_offset 0x{p_offset:x} -> 0x{p_vaddr:x}")
            fixed += 1
        if fixed:
            print(f"  fixed {fixed} ELF segment(s) in {path}")
        else:
            print(f"  no issues in {path}")

def main():
    print("audacity-openvino: checking ELF alignment in libtorch_cpu.so")
    any_found = False
    for p in PATHS:
        if os.path.isfile(p):
            any_found = True
            fix_elf(p)
    if not any_found:
        print("  no libtorch_cpu.so found on any known path")
    print("done")

if __name__ == "__main__":
    main()
