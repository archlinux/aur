#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
修复 Clash Nyanpasu v1.6.1 AppImage 内置 clash-rs (v0.3.1) 的启动 SIGSEGV。

原因：打包时 linuxdeploy 用 patchelf 给二进制注入 RUNPATH=$ORIGIN/../lib，
patchelf 把静态 PIE 的 .dynamic 段搬到了文件末尾（vaddr 0x15832a0），并用
0x58 ('X') 覆盖了原位置（vaddr 0x1246530）。但静态 PIE 中 glibc 的 _DYNAMIC
引用（GOT[0] 及启动代码里的 RIP 相对地址）仍指向旧地址，于是启动时
_dl_relocate_static_pie 读到一堆 0x58，l_info[DT_SYMTAB] 为空，空指针解引用
崩溃。

修复：把新 .dynamic（去掉 patchelf 添加的 DT_RUNPATH 项）写回 0x1246530 的
空洞（正好 0x150 字节 = 21 项），恢复自洽。

用法:
    python3 fix-clash-rs.py <clash-rs 路径>

只对 v0.3.1（BuildID e45b40e79b251faf93afb85ff413c4d654ef1124）有效，
脚本会先校验特征字节，不匹配则拒绝修改。
"""
import hashlib
import os
import shutil
import struct
import sys

V2O = 0x2000                # 第二 RW 段 vaddr -> 文件偏移
OLD_DYN_VADDR = 0x1246530   # 原始 .dynamic 位置（现在是 0x58 填充）
NEW_DYN_VADDR = 0x15832a0   # patchelf 移动后的 .dynamic
HOLE_SIZE = 0x150           # 原 .dynamic 大小 = 21 项
NEW_DYN_V2O = 0x32B000      # 最后一段 vaddr -> 文件偏移


def fix(path: str) -> None:
    with open(path, "rb") as f:
        data = bytearray(f.read())

    old_off = OLD_DYN_VADDR - V2O
    new_off = NEW_DYN_VADDR - NEW_DYN_V2O

    if data[old_off:old_off + HOLE_SIZE] != b"\x58" * HOLE_SIZE:
        sys.exit("拒绝修改：0x1246530 处不是预期的 0x58 空洞，此文件可能已修复或版本不符")

    entries = []
    off = new_off
    for _ in range(64):
        tag, val = struct.unpack_from("<QQ", data, off)
        entries.append((tag, val))
        off += 16
        if tag == 0:
            break
    else:
        sys.exit("拒绝修改：末尾 .dynamic 未找到 DT_NULL 结束项")

    if entries[0][0] != 0x1D:  # DT_RUNPATH
        sys.exit(f"拒绝修改：末尾 .dynamic 首项不是 DT_RUNPATH (0x1d)，而是 {entries[0][0]:#x}")

    restored = [e for e in entries if e[0] != 0x1D]
    buf = b"".join(struct.pack("<QQ", t, v) for t, v in restored)
    if len(buf) != HOLE_SIZE:
        sys.exit(f"拒绝修改：还原后 {len(buf)} 字节，与空洞 {HOLE_SIZE} 字节不符")

    backup = path + ".orig"
    if not os.path.exists(backup):
        shutil.copy2(path, backup)
        print(f"原文件已备份到 {backup}")

    data[old_off:old_off + HOLE_SIZE] = buf
    with open(path, "wb") as f:
        f.write(data)

    with open(path, "rb") as f:
        sha = hashlib.sha256(f.read()).hexdigest()
    print(f"修复完成: {path}")
    print(f"sha256 = {sha}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    fix(sys.argv[1])
