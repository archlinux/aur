#!/usr/bin/env python3
"""Generate a cursors_scalable/ tree (GNOME Shell 50+ / GTK4 format) from an
Xcursor theme's cursors/ directory.

Each cursor becomes cursors_scalable/<name>/{<name>[-NN].svg, metadata.json};
the SVGs embed the largest Xcursor bitmap as a PNG data URI. Symlinked cursor
names are mirrored as directory symlinks.

Usage: xcursor-to-scalable.py THEME_DIR [THEME_DIR...]
"""
import base64
import json
import os
import struct
import sys
import zlib

XCURSOR_MAGIC = b"Xcur"
XCURSOR_IMAGE_TYPE = 0xFFFD0002


def read_xcursor(path):
    """Return {nominal_size: [frame, ...]}; frame = (w, h, xhot, yhot, delay, argb)."""
    with open(path, "rb") as f:
        data = f.read()
    if data[:4] != XCURSOR_MAGIC:
        raise ValueError("not an Xcursor file")
    _, _, ntoc = struct.unpack_from("<III", data, 4)
    sizes = {}
    for i in range(ntoc):
        typ, subtype, pos = struct.unpack_from("<III", data, 16 + i * 12)
        if typ != XCURSOR_IMAGE_TYPE:
            continue
        _, _, nominal, _, w, h, xhot, yhot, delay = struct.unpack_from("<9I", data, pos)
        pixels = data[pos + 36 : pos + 36 + w * h * 4]
        sizes.setdefault(nominal, []).append((w, h, xhot, yhot, delay, pixels))
    return sizes


def argb_to_png(w, h, pixels):
    """Premultiplied little-endian ARGB -> straight-alpha RGBA PNG."""
    rows = bytearray()
    for y in range(h):
        rows.append(0)  # filter: none
        row = pixels[y * w * 4 : (y + 1) * w * 4]
        for x in range(w):
            b, g, r, a = row[x * 4 : x * 4 + 4]
            if 0 < a < 255:
                r, g, b = (min(255, c * 255 // a) for c in (r, g, b))
            rows += bytes((r, g, b, a))

    def chunk(tag, body):
        return struct.pack(">I", len(body)) + tag + body + struct.pack(">I", zlib.crc32(tag + body))

    return (
        b"\x89PNG\r\n\x1a\n"
        + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0))
        + chunk(b"IDAT", zlib.compress(bytes(rows), 9))
        + chunk(b"IEND", b"")
    )


def convert_cursor(src, outdir, name):
    sizes = read_xcursor(src)
    if not sizes:
        raise ValueError("no images")
    nominal = max(sizes)
    os.makedirs(outdir, exist_ok=True)
    meta = []
    for i, (w, h, xhot, yhot, delay, pixels) in enumerate(sizes[nominal]):
        fname = f"{name}.svg" if i == 0 else f"{name}-{i:02d}.svg"
        png = base64.b64encode(argb_to_png(w, h, pixels)).decode()
        with open(os.path.join(outdir, fname), "w") as f:
            f.write(
                f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" viewBox="0 0 {w} {h}">'
                f'<image width="{w}" height="{h}" href="data:image/png;base64,{png}"/></svg>\n'
            )
        entry = {"filename": fname}
        if len(sizes[nominal]) > 1:
            entry["delay"] = delay
        # hotspot is expressed in nominal_size units
        entry["hotspot_x"] = round(xhot * nominal / w)
        entry["hotspot_y"] = round(yhot * nominal / h)
        entry["nominal_size"] = nominal
        meta.append(entry)
    with open(os.path.join(outdir, "metadata.json"), "w") as f:
        json.dump(meta, f, indent=4)
        f.write("\n")


def convert_theme(theme):
    src_dir = os.path.join(theme, "cursors")
    dst_dir = os.path.join(theme, "cursors_scalable")
    if not os.path.isdir(src_dir):
        return
    os.makedirs(dst_dir, exist_ok=True)
    names = sorted(os.listdir(src_dir))
    converted = links = 0
    for name in names:
        path = os.path.join(src_dir, name)
        if os.path.islink(path):
            continue
        try:
            convert_cursor(path, os.path.join(dst_dir, name), name)
            converted += 1
        except ValueError as e:
            print(f"  skip {name}: {e}", file=sys.stderr)
    for name in names:
        path = os.path.join(src_dir, name)
        if not os.path.islink(path):
            continue
        target = os.path.basename(os.path.realpath(path))
        if os.path.isdir(os.path.join(dst_dir, target)):
            link = os.path.join(dst_dir, name)
            if os.path.lexists(link):
                os.remove(link)
            os.symlink(target, link)
            links += 1
    print(f"{os.path.basename(theme)}: {converted} cursors, {links} aliases")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    for theme in sys.argv[1:]:
        convert_theme(theme.rstrip("/"))
