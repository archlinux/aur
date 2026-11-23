#!/usr/bin/env python3
"""
Flatpak bundle unpacker - verified against the actual IENT/YUView v2.16 structure.

Extracts from a .flatpak bundle: the main program ELF, all bundled .so files,
icons, desktop file, metadata and other resources.

Verified layout (YUView v2.16):
    - header: "flatpak\\0" + version(uint16 LE) + GVariant fields (ref/metadata/appdata/icon)
    - followed by several xz streams; the largest is the OSTree objects stream
        (dirtree index + file contents)
    - file contents hold ELF, PNG, desktop, XML, README, etc. stored contiguously

Usage: python3 yufpak_unpack.py <input.flatpak> [output_dir]
Requires: Python 3 standard library only
"""
import lzma
import struct
import os
import sys
import re

XZ_MAGIC = b"\xfd7zXZ\x00"
ELF_MAGIC = b"\x7fELF"
PNG_MAGIC = b"\x89PNG\r\n\x1a\n"

def find_all(data, needle):
    out, pos = [], 0
    while True:
        i = data.find(needle, pos)
        if i < 0:
            break
        out.append(i)
        pos = i + 1
    return out

def decompress_xz(data, off):
    """Incrementally decompress the xz stream at off, stop at eof; ignore non-xz tail data."""
    dec = lzma.LZMADecompressor(format=lzma.FORMAT_XZ)
    tail = data[off:]
    out = bytearray()
    try:
        for i in range(0, len(tail), 65536):
            out += dec.decompress(tail[i:i + 65536])
            if dec.eof:
                break
    except lzma.LZMAError:
        pass
    return bytes(out)

def elf_bits(data, off):
    if off + 64 > len(data) or data[off:off + 4] != ELF_MAGIC:
        return None
    return data[off + 4]  # 1=32bit, 2=64bit

def phdrs(data, off):
    cls = elf_bits(data, off)
    if cls is None:
        return []
    if cls == 2:
        e_phoff = struct.unpack_from("<Q", data, off + 32)[0]
        e_phentsize = struct.unpack_from("<H", data, off + 54)[0]
        e_phnum = struct.unpack_from("<H", data, off + 56)[0]
    else:
        e_phoff = struct.unpack_from("<I", data, off + 28)[0]
        e_phentsize = struct.unpack_from("<H", data, off + 42)[0]
        e_phnum = struct.unpack_from("<H", data, off + 44)[0]
    res = []
    for i in range(e_phnum):
        p = off + e_phoff + i * e_phentsize
        if p + (56 if cls == 2 else 32) > len(data):
            break
        if cls == 2:
            res.append((struct.unpack_from("<I", data, p)[0],
                        struct.unpack_from("<Q", data, p + 8)[0],
                        struct.unpack_from("<Q", data, p + 32)[0]))
        else:
            res.append((struct.unpack_from("<I", data, p)[0],
                        struct.unpack_from("<I", data, p + 4)[0],
                        struct.unpack_from("<I", data, p + 16)[0]))
    return res

def elf_size(data, off):
    """Take the max of the PT_LOAD segment end and the section header table end (both matter here)."""
    cls = elf_bits(data, off)
    if cls is None:
        return None
    segs = [p for p in phdrs(data, off) if p[0] == 1]  # PT_LOAD
    end = max((p[1] + p[2] for p in segs), default=0)
    if cls == 2:
        e_shoff = struct.unpack_from("<Q", data, off + 40)[0]
        e_shentsize = struct.unpack_from("<H", data, off + 58)[0]
        e_shnum = struct.unpack_from("<H", data, off + 60)[0]
    else:
        e_shoff = struct.unpack_from("<I", data, off + 32)[0]
        e_shentsize = struct.unpack_from("<H", data, off + 46)[0]
        e_shnum = struct.unpack_from("<H", data, off + 48)[0]
    if e_shoff and e_shentsize and e_shnum:
        sh_end = e_shoff + e_shentsize * e_shnum
        if off + sh_end <= len(data):
            end = max(end, sh_end)
    return end or None

def has_interp(data, off):
    return any(p[0] == 3 for p in phdrs(data, off))  # PT_INTERP

def elf_needed(data, off):
    """Read DT_NEEDED (simplified: search library names directly in the file blob)."""
    size = elf_size(data, off) or 0
    blob = data[off:off + size]
    libs = set()
    for m in re.findall(rb"(?:lib[A-Za-z0-9_.+-]+\.so(?:\.\d+)*)", blob):
        s = m.decode("ascii", "ignore")
        if s not in ("libc.so.6", "libm.so.6", "libgcc_s.so.1", "libstdc++.so.6"):
            libs.add(s)
    return sorted(libs)

def carve_png(data, start):
    i = data.find(PNG_MAGIC, start)
    if i < 0:
        return None
    j = data.find(b"IEND", i)
    return data[i:j + 8] if j > 0 else None

def text_at(data, marker, maxlen=4096):
    i = data.find(marker)
    if i < 0:
        return None
    end = i
    while end < min(i + maxlen, len(data)):
        b = data[end]
        if b == 0 or (b < 0x20 and b not in (9, 10, 13)):
            break
        end += 1
    return data[i:end].decode("utf-8", "replace").rstrip() + "\n"

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 yufpak_unpack.py <input.flatpak> [output_dir]")
        sys.exit(1)
    src = os.path.abspath(sys.argv[1])
    if not os.path.isfile(src):
        print(f"Error: file not found: {src}")
        sys.exit(1)
    out = os.path.abspath(sys.argv[2]) if len(sys.argv) > 2 else os.path.join(os.path.dirname(src), "yuview_unpacked")
    os.makedirs(out, exist_ok=True)

    data = open(src, "rb").read()
    print(f"[1/5] {src} ({len(data):,} bytes)")
    print(f"      magic={data[:8]!r} version={struct.unpack_from('<H', data, 8)[0]}")

    # Take the largest xz stream as the payload
    xs = find_all(data, XZ_MAGIC)
    print(f"[2/5] found {len(xs)} xz streams: {[hex(x) for x in xs]}")
    payload = b""
    for x in xs:
        d = decompress_xz(data, x)
        if len(d) > len(payload):
            payload = d
    print(f"      payload = {len(payload):,} bytes")
    if not payload:
        print("Error: xz decompression failed")
        sys.exit(1)

    # Extract all ELF objects
    print("[3/5] extracting ELF ...")
    elfs = []
    for off in find_all(payload, ELF_MAGIC):
        size = elf_size(payload, off)
        if not size or size < 1024:
            continue
        blob = payload[off:off + size]
        interp = has_interp(payload, off)
        name = "YUView" if interp else f"lib_{off}.so"
        # Guess the private library name from nearby strings
        if not interp:
            context = payload[max(0, off - 512):off]
            m = re.findall(rb"([A-Za-z0-9_.+-]+\.so(?:\.\d+)*)", context)
            if m:
                name = m[-1].decode("ascii", "ignore")
        path = os.path.join(out, name)
        open(path, "wb").write(blob)
        elfs.append((name, size, interp, elf_needed(payload, off)))
        print(f"      {name:24} {size:>9,} bytes  {'[executable]' if interp else '[library]'}  needs={elf_needed(payload, off)}")

    # Extract text resources
    print("[4/5] extracting resources ...")
    meta = text_at(data, b"[Application]")
    if meta:
        open(os.path.join(out, "metadata"), "w", encoding="utf-8").write(meta)
        print("      metadata")
    desk = text_at(payload, b"[Desktop Entry]")
    if desk:
        # Cut off trailing binary residue (including 0x7f DEL / ELF magic)
        lines = []
        for line in desk.splitlines():
            if any(ord(c) < 32 or ord(c) == 127 for c in line):
                break
            lines.append(line)
        desk = "\n".join(lines) + "\n"
        open(os.path.join(out, "YUView.desktop"), "w", encoding="utf-8").write(desk)
        print("      YUView.desktop")
    # All non-empty PNGs outside ELF ranges (skip embedded resources), deduplicated by size
    elf_ranges = []
    for off in find_all(payload, ELF_MAGIC):
        s = elf_size(payload, off)
        if s:
            elf_ranges.append((off, off + s))
    seen_sizes = {}
    for p in find_all(payload, PNG_MAGIC):
        if any(a <= p < b for a, b in elf_ranges):
            continue
        png = carve_png(payload, p)
        if not png or len(png) < 256:
            continue
        # Read width/height from IHDR (PNG: magic 8B + 4B len + "IHDR" + 4B w + 4B h)
        w = struct.unpack_from(">I", png, 16)[0]
        h = struct.unpack_from(">I", png, 20)[0]
        if (w, h) not in seen_sizes:
            seen_sizes[(w, h)] = png
    for (w, h), png in seen_sizes.items():
        open(os.path.join(out, f"icon_{w}x{h}.png"), "wb").write(png)
    print(f"      PNG icons: {len(seen_sizes)} -> {[f'{w}x{h}' for w, h in seen_sizes]}")
    # Split the two XML types: mime-info (application/YUView) and appdata (<component>)
    for m in find_all(payload, b"<?xml"):
        t = text_at(payload, payload[m:m+8192], maxlen=20000) if False else None
        end = payload.find(b"\x00", m)
        if end < 0:
            end = m + 20000
        raw = payload[m:end]
        # Cut at the first non-printable byte after the root element opens
        e = m
        while e < min(end, m + 30000):
            b = payload[e]
            if b == 0 or (b < 32 and b not in (9, 10, 13)):
                break
            e += 1
        txt = payload[m:e].decode("utf-8", "replace")
        if "<mime-info" in txt or "<mime-type" in txt:
            open(os.path.join(out, "yuview.mime.xml"), "w", encoding="utf-8").write(txt)
            print("      yuview.mime.xml")
        elif "<component" in txt:
            open(os.path.join(out, "yuview.appdata.xml"), "w", encoding="utf-8").write(txt)
            print("      yuview.appdata.xml")

    print("[5/5] done. output dir:", out)
    print("\nExtracted ELF summary:")
    for name, size, interp, needs in elfs:
        print(f"  {name:24} {size:>9,} B  {'executable' if interp else 'shared library'}  {', '.join(needs)}")
    print("\nDependencies needed to run/package on Arch:")
    print("  pacman -S qt6-base           # libQt6{Core,Gui,Widgets,Network,Xml}.so.6")
    print("  libde265 is shipped in the bundle (already extracted)")

if __name__ == "__main__":
    main()
