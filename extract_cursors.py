#!/usr/bin/env python3
"""Build an XCursor theme from the cursors of Apple's macOS Sequoia OTA image.

The arrow, I-beam and spinning wait cursor are the prerendered bitmaps (with Apple's
shadows) in SkyLight's CursorAsset; the others are the vector PDFs and hotspot plists
of HIServices, rendered per size with the shadow their plist describes.
Every downloaded file is checked against a pinned SHA-256.
"""
import argparse
import concurrent.futures
import hashlib
import io
import lzma
import os
import plistlib
import struct
import subprocess
import sys
import tempfile
import time
import urllib.request
import zipfile
from pathlib import Path

from PIL import Image, ImageFilter

# macOS Sequoia 15.8.3 (24H241) full OTA, the same image as macos-sequoia-fonts.
OTA_URL = ("https://updates.cdn-apple.com/2026FallFCS/2db371bc-ae91-458f-a169-2ea575bb2b7e/"
           "com_apple_MobileAsset_MacSoftwareUpdate/d0016a40184caa9a22a8c0bfb155556c288fb28d.zip")
OTA_SIZE = 15642867282
BLOCK = 8 * 1024 * 1024

SKYLIGHT = "System/Library/PrivateFrameworks/SkyLight.framework/Versions/A/Resources/CursorAsset"
HISERVICES = ("System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/"
              "HIServices.framework/Versions/A/Resources/cursors/")

# key: (OTA payload number, path inside the image, SHA-256)
FILES = {
    'skylight': (32, SKYLIGHT,
        "6cffb07a0396082fd29a88bd1437a7fc0cb2eccffec3238a4627d23c17aa3e28"),
    'pointinghand.pdf': (42, HISERVICES + 'pointinghand/cursor.pdf',
        "8c59f02be443f2b6955c688d64eb184a2274e5d59be0aea85c8f3097b8575010"),
    'pointinghand.plist': (44, HISERVICES + 'pointinghand/info.plist',
        "5098b47ad90b59742643841bec5e3d73b5d2dc17a3b7bf269d740cd3fb763eac"),
    'openhand.pdf': (42, HISERVICES + 'openhand/cursor.pdf',
        "5ff4a7b3fa2d9f25c6ee18f725aafafea10305974abc7bc6a4600237ca532add"),
    'closedhand.pdf': (42, HISERVICES + 'closedhand/cursor.pdf',
        "e3d50fa698e6323d7359b5e10607a09f368dae876e87fcf9a215651fa52d91ed"),
    'closedhand.plist': (44, HISERVICES + 'closedhand/info.plist',
        "8f76af05b519ad2ca6e842470ec4396c0a465156df3f4b6f2960db83e5bbf3ac"),
    'copy.pdf': (43, HISERVICES + 'copy/cursor.pdf',
        "7d11280426ac36d0227d1c5c522568d9c73dc55e72740d667ba23613e5b1b762"),
    'copy.plist': (44, HISERVICES + 'copy/info.plist',
        "924dce6fcd90ddeca392621ce346a92ef113e8e2cb3b30641c6677903e638d42"),
    'makealias.pdf': (42, HISERVICES + 'makealias/cursor.pdf',
        "916d58d06cb8826731058fdd878e5852dcc29dcb9d86191f35d85bb6898ba7e8"),
    'makealias.plist': (44, HISERVICES + 'makealias/info.plist',
        "96daad0d119ed203c7fc417eb159f40910726cc4a8a04baf712d165e83cfb21a"),
    'notallowed.pdf': (43, HISERVICES + 'notallowed/cursor.pdf',
        "9e4f98ac0085d11f5ca70e3e369455b6855af7a92b5a0ca78d60498b43cb6c35"),
    'cross.pdf': (39, HISERVICES + 'cross/cursor.pdf',
        "8b5b52aea6d47053e93d6bd722ccd5994dfcfa3d7c78a5743bf4a575c2ecdf41"),
    'cross.plist': (0, HISERVICES + 'cross/info.plist',
        "569da88418d7311c348a67521544657e783e9346d511f3552db4086f3515972d"),
    'cell.pdf': (43, HISERVICES + 'cell/cursor.pdf',
        "226f3f866b295dce20c7c6b1c445fa06148ab3522320cb384ebc3060ed2348d3"),
    'cell.plist': (44, HISERVICES + 'cell/info.plist',
        "583f3458517a4a0fb7b348c0acf4cd8fcbae9ed7d833818a0f807971c9fe4b51"),
    'help.pdf': (43, HISERVICES + 'help/cursor.pdf',
        "d47bdc822c4241d8c283cf4f0ff3eb265d5728bb50e74328014bd6119c69aafa"),
    'help.plist': (44, HISERVICES + 'help/info.plist',
        "85b46044abbcc636ff1ab20b895ed1298706b629a7b24cba22269f376b0ca3e0"),
    'contextualmenu.pdf': (41, HISERVICES + 'contextualmenu/cursor.pdf',
        "e4e69e9eef4afad595539e0833e5f468653eaf70b3c36b64d1120bcfece5c51c"),
    'contextualmenu.plist': (44, HISERVICES + 'contextualmenu/info.plist',
        "bdd9e72a3e17936673b9fcebeeb525b0b336d8df207fab0e76e235f0017bfbbe"),
    'move.pdf': (43, HISERVICES + 'move/cursor.pdf',
        "75cfeeda8341d9248eba7933b0975cc6c85cf5b3f39689747fedc6d6d50b4c4b"),
    'move.plist': (44, HISERVICES + 'move/info.plist',
        "230a0d50e788cfe833b444e4167800105252e6317f111987e2c48b579023b74c"),
    'ibeamvertical.pdf': (43, HISERVICES + 'ibeamvertical/cursor.pdf',
        "93bf10bfc62bec1e1fd929230cb8157a372a7431cba4b9c3c296746ce9e5e80f"),
    'ibeamvertical.plist': (0, HISERVICES + 'ibeamvertical/info.plist',
        "a091020bf5f956805246d04eca55ac100c184865e47e0cb8bf5a69fddc96169d"),
    'busybutclickable.pdf': (43, HISERVICES + 'busybutclickable/cursor.pdf',
        "515d28ddc8ebb5d427ffef861a75ada5ef49dc26ae33f23a3935a78484f38899"),
    'busybutclickable.plist': (44, HISERVICES + 'busybutclickable/info.plist',
        "be44b7962fa8d39f9e9629cd2fea696b492b7940dad716334c6e475976f3e6c2"),
    'zoomin.pdf': (42, HISERVICES + 'zoomin/cursor.pdf',
        "47c8967baa84bff342c693dc8ddb0c248087d5ff136aedce6690d334a872bc26"),
    'zoomin.plist': (44, HISERVICES + 'zoomin/info.plist',
        "d9bbb76d1de270ee82566a2c9ed8a7c22c425e5dc5ddf35209c5395dedd7808f"),
    'zoomout.pdf': (42, HISERVICES + 'zoomout/cursor.pdf',
        "e374cdaf43245d3b19a14dad21374c903752c3ad810a24b6018476211ec840b2"),
    'resizenorth.pdf': (43, HISERVICES + 'resizenorth/cursor.pdf',
        "496644b2f63d558893a9c5f85382e8a7b8ffaa9a17d0a55b41cacc6460834654"),
    'resizesouth.pdf': (43, HISERVICES + 'resizesouth/cursor.pdf',
        "ec829f8a44bcf9e61869161feca87e0057c95c20d678f0672d6419b58053515d"),
    'resizeeast.pdf': (43, HISERVICES + 'resizeeast/cursor.pdf',
        "6ddfb0db00988f459a470ce259038a1e1a8fee41fcd7093460fe9a7fe26f5e01"),
    'resizeeast.plist': (44, HISERVICES + 'resizeeast/info.plist',
        "545b3826d66071aa9f4131df956115569f3d5da878bff9f008b7ac82a85ad426"),
    'resizewest.pdf': (43, HISERVICES + 'resizewest/cursor.pdf',
        "0d6dcf5db27e6fecc78c069d2e07905904ae51debad7c4c5c34cd98cf3a21063"),
    'resizenortheast.pdf': (43, HISERVICES + 'resizenortheast/cursor.pdf',
        "83b197f492eae8257b534c0ffbd54c40f7c988ebd79612ea2228a0742514e169"),
    'resizenortheast.plist': (44, HISERVICES + 'resizenortheast/info.plist',
        "acc6a8437eb2a852422ab830c8227e9a19d66cc00864e57735a93fea1ad02a9b"),
    'resizenorthwest.pdf': (43, HISERVICES + 'resizenorthwest/cursor.pdf',
        "3e3cde3e40c932be7c055ffbf390560aea03e12d4fb5e76e48918bcffd05559e"),
    'resizenorthwest.plist': (44, HISERVICES + 'resizenorthwest/info.plist',
        "405c580dbf3388d89a59156a440e186d5cb0006c4d594ab2723074e46b16d677"),
    'resizesoutheast.pdf': (43, HISERVICES + 'resizesoutheast/cursor.pdf',
        "45f164bc7cca09a442e4eb3ed3410470a8057fe56e1d995f4422297c0d7dce3e"),
    'resizesoutheast.plist': (44, HISERVICES + 'resizesoutheast/info.plist',
        "f3f1d31a1ad90b2a210bfdfe61c01f57f9b1aae39f714dc8cd642a78987c0482"),
    'resizesouthwest.pdf': (43, HISERVICES + 'resizesouthwest/cursor.pdf',
        "3e2237239de9e388fbbd5eb3d1181bd3770a585bb17b9d134d958de1f7b44410"),
    'resizesouthwest.plist': (44, HISERVICES + 'resizesouthwest/info.plist',
        "81597cd6f509698f5420d81f73c37e11acabcb177af39f4fe1a2e7887c8ab70d"),
    'resizenorthsouth.pdf': (43, HISERVICES + 'resizenorthsouth/cursor.pdf',
        "a666ae4a58ab7aa913974993aca4e2b1a0e489b02257606d18d1d37d14834168"),
    'resizeeastwest.pdf': (43, HISERVICES + 'resizeeastwest/cursor.pdf',
        "7ccdfb0e0f437b81a9bf8a1c7c85c10d83af6f6f8afae8420eb695a549622184"),
    'resizenortheastsouthwest.pdf': (43, HISERVICES + 'resizenortheastsouthwest/cursor.pdf',
        "feb82c7c2303ffa3e7d497afb2c8976bb4aeb17f833991fb427ad5dd7129d5a8"),
    'resizenorthwestsoutheast.pdf': (43, HISERVICES + 'resizenorthwestsoutheast/cursor.pdf',
        "0d9b9eebe40df642594c354766c6c55317396f41792b3b430020b51d1a903b48"),
    'resizeupdown.pdf': (41, HISERVICES + 'resizeupdown/cursor.pdf',
        "8d2a1d071ce14a39899f1adf7cba70768bd2176d6b180fb003e7c8c20f0ce5d4"),
    'resizeleftright.pdf': (41, HISERVICES + 'resizeleftright/cursor.pdf',
        "9d76be47f9ecb374da352386ed558b15a68c1266ccf7727b3dc83ab270951dc9"),
    'resizeleftright.plist': (44, HISERVICES + 'resizeleftright/info.plist',
        "13d1e08b49e0c66f93456e367ec03043ddcdd6b3decd26e6dc9f276c95e15b67"),
}

# Nominal XCursor sizes. Size 24 is drawn at one pixel per macOS point.
SIZES = (24, 30, 36, 48, 72, 96)

# CursorAsset ids of the bitmap cursors: id -> (primary name, aliases)
BITMAPS = {
    0: ("default", "left_ptr arrow top_left_arrow"),
    1: ("text", "xterm ibeam"),
    7: ("wait", "watch"),
}

# HIServices directory -> (primary name, aliases). Names are the freedesktop ones plus the
# legacy X11, Qt and hashed names that toolkits still ask for.
VECTORS = {
    "busybutclickable": ("progress", "left_ptr_watch half-busy 00000000000000020006000e7e9ffc3f "
                         "08e8e1c95fe2fc01f976f1e063a24ccd 3ecb610c1bf2410f44200f48c40d3599"),
    "pointinghand": ("pointer", "hand2 pointing_hand 9d800788f1b08800ae810202380a0822 e29285e634086352946a0e7090d73106"),
    "openhand": ("openhand", "grab hand1"),
    "closedhand": ("closedhand", "grabbing dnd-move fcf21c00b30f7e3f83fe0dfd12e71cff"),
    "copy": ("copy", "dnd-copy 1081e37283d90000800003c07f3ef6bf 6407b0e94181790501fd1e167b474872 "
             "b66166c04f8c3109214a4fbd64a50fc8"),
    "makealias": ("alias", "link dnd-link 3085a0e285430894940527032f8b26df 640fb0e74195791501fd1ed57b41487f "
                  "a2a266d0498c3104214a47bd64ab0fc8"),
    "notallowed": ("not-allowed", "forbidden crossed_circle circle no-drop dnd-no-drop 03b6e0fcb3499374a867c041f52298f0"),
    "cross": ("crosshair", "cross tcross cross_reverse diamond_cross"),
    "cell": ("cell", "plus"),
    "help": ("help", "question_arrow whats_this left_ptr_help d9ce0ab605698f320427677b458ad60b "
             "5c6cd98b3f3ebcb1f9c7f1c204630408"),
    "contextualmenu": ("context-menu", ""),
    "move": ("move", "fleur all-scroll size_all 4498f0e0c1937ffe01fd06f973665830 9081237383d90e509aa00f00170e968f"),
    "ibeamvertical": ("vertical-text", ""),
    "zoomin": ("zoom-in", "f41c0e382c94c0958e07017e42b00462"),
    "zoomout": ("zoom-out", "f41c0e382c97c0938e07017e42800402"),
    "resizenorth": ("n-resize", "top_side"),
    "resizesouth": ("s-resize", "bottom_side"),
    "resizeeast": ("e-resize", "right_side"),
    "resizewest": ("w-resize", "left_side"),
    "resizenortheast": ("ne-resize", "top_right_corner"),
    "resizenorthwest": ("nw-resize", "top_left_corner"),
    "resizesoutheast": ("se-resize", "bottom_right_corner"),
    "resizesouthwest": ("sw-resize", "bottom_left_corner"),
    "resizenorthsouth": ("ns-resize", "size_ver sb_v_double_arrow v_double_arrow 00008160000006810000408080010102"),
    "resizeeastwest": ("ew-resize", "size_hor sb_h_double_arrow h_double_arrow 028006030e0e7ebffc7f7070c0600140"),
    "resizenortheastsouthwest": ("nesw-resize", "size_bdiag fd_double_arrow fcf1c3c7cd4491d801f1e1c78f100000"),
    "resizenorthwestsoutheast": ("nwse-resize", "size_fdiag bd_double_arrow c7088f0f3e6c8088236ef8e1e3e70000"),
    "resizeupdown": ("row-resize", "split_v 2870a09082c103050810ffdffffe0204"),
    "resizeleftright": ("col-resize", "split_h 043a9f68147c53184671403ffa811cc5 14fef782d02440884392942c11205230"),
}

# A few cursors ship without info.plist; take the hotspot of their sibling (points).
HOTSPOTS = {"openhand": (16, 16), "notallowed": (5, 5), "zoomout": (8, 7), "resizeupdown": (12, 12)}
DEFAULT_SHADOW = {"shadowcolor": [0, 0, 0, 0.5], "blur": 0.8, "shadowoffsetx": 0, "shadowoffsety": -1}

# AppleArchive header field sub-types: (kind, size); 'P' is a string with a uint16 length.
AA_FIELDS = {'*': ('flag', 0), '1': ('uint', 1), '2': ('uint', 2), '4': ('uint', 4), '8': ('uint', 8),
             'A': ('blob', 2), 'B': ('blob', 4), 'C': ('blob', 8), 'F': ('hash', 4), 'G': ('hash', 20),
             'H': ('hash', 32), 'I': ('hash', 48), 'J': ('hash', 64), 'S': ('time', 8), 'T': ('time', 12)}


def http_range(url, start, end):
    request = urllib.request.Request(url, headers={"Range": f"bytes={start}-{end}",
                                                   "User-Agent": "macos-sequoia-cursor-theme/1"})
    for attempt in range(5):
        try:
            with urllib.request.urlopen(request, timeout=90) as response:
                if response.status != 206:
                    raise RuntimeError(f"Range request returned HTTP {response.status}")
                total = int(response.headers["Content-Range"].rsplit("/", 1)[1])
                data = response.read()
            if len(data) != end - start + 1:
                raise RuntimeError("short range response")
            return data, total
        except Exception:
            if attempt == 4:
                raise
            time.sleep(2 ** attempt)


class HTTPRangeFile(io.RawIOBase):
    """Seekable range reader with a one-block cache, enough for zipfile."""

    def __init__(self, url, expected_size):
        self.url, self.position, self.start, self.cache = url, 0, -1, b""
        _, self.size = http_range(url, 0, 0)
        if self.size != expected_size:
            raise RuntimeError(f"OTA size changed: expected {expected_size}, got {self.size}")

    def readable(self):
        return True

    def seekable(self):
        return True

    def tell(self):
        return self.position

    def seek(self, offset, whence=io.SEEK_SET):
        base = {io.SEEK_SET: 0, io.SEEK_CUR: self.position, io.SEEK_END: self.size}[whence]
        self.position = min(max(base + offset, 0), self.size)
        return self.position

    def read(self, count=-1):
        if count < 0:
            count = self.size - self.position
        pieces = []
        while count > 0 and self.position < self.size:
            start = self.position // BLOCK * BLOCK
            if start != self.start:
                self.cache, _ = http_range(self.url, start, min(start + BLOCK, self.size) - 1)
                self.start = start
            piece = self.cache[self.position - start:self.position - start + count]
            pieces.append(piece)
            self.position += len(piece)
            count -= len(piece)
        return b"".join(pieces)


def extract_payload(number, wanted):
    """Return {path: bytes} for the wanted paths of one payload member."""
    archive = zipfile.ZipFile(HTTPRangeFile(OTA_URL, OTA_SIZE))
    found, buffer = {}, bytearray()
    with archive.open(f"AssetData/payloadv2/payload.{number:03d}") as member:
        if member.read(12)[:4] != b"pbzx":
            raise RuntimeError(f"payload.{number:03d}: invalid PBZX header")

        def take(count, keep):
            out = bytearray()
            while count:
                if not buffer:
                    header = member.read(16)
                    raw, packed = struct.unpack(">QQ", header) if len(header) == 16 else (0, 0)
                    if raw == packed == 0:
                        break
                    block = member.read(packed)
                    buffer.extend(block if packed == raw else lzma.decompress(block, format=lzma.FORMAT_XZ))
                chunk = bytes(buffer[:count])
                del buffer[:len(chunk)]
                count -= len(chunk)
                if keep:
                    out.extend(chunk)
            return bytes(out)

        while len(found) < len(wanted):
            head = take(6, True)
            if len(head) < 6:
                break
            if head[:4] != b"YAA1":
                raise RuntimeError(f"payload.{number:03d}: unexpected archive entry header")
            fields = take(struct.unpack("<H", head[4:6])[0] - 6, True)
            position, path, kind, blobs = 0, None, None, []
            while position < len(fields):
                key, sub = fields[position:position + 3].decode("latin1"), chr(fields[position + 3])
                position += 4
                if sub == "P":
                    length = struct.unpack("<H", fields[position:position + 2])[0]
                    if key == "PAT":
                        path = fields[position + 2:position + 2 + length].decode("utf-8", "replace")
                    position += 2 + length
                    continue
                field, width = AA_FIELDS[sub]
                value = int.from_bytes(fields[position:position + width], "little")
                position += width
                if field == "uint" and key == "TYP":
                    kind = chr(value)
                elif field == "blob":
                    blobs.append((key, value))
            for key, length in blobs:
                keep = key == "DAT" and kind == "F" and path in wanted
                data = take(length, keep)
                if keep:
                    found[path] = data
    return found


def local_name(key, path):
    return "CursorAsset" if key == "skylight" else key


def download(originals):
    originals.mkdir(parents=True, exist_ok=True)
    by_payload = {}
    for key, (number, path, digest) in FILES.items():
        target = originals / local_name(key, path)
        if target.is_file() and hashlib.sha256(target.read_bytes()).hexdigest() == digest:
            continue
        by_payload.setdefault(number, {})[path] = (target, digest)
    with concurrent.futures.ThreadPoolExecutor(4) as pool:
        jobs = {pool.submit(extract_payload, number, set(wanted)): number
                for number, wanted in by_payload.items()}
        for job in concurrent.futures.as_completed(jobs):
            number = jobs[job]
            found = job.result()
            for path, (target, digest) in by_payload[number].items():
                if path not in found:
                    raise RuntimeError(f"payload.{number:03d}: {path} not found")
                if hashlib.sha256(found[path]).hexdigest() != digest:
                    raise RuntimeError(f"{path}: SHA-256 mismatch")
                target.write_bytes(found[path])
            print(f"payload.{number:03d}: extracted {len(by_payload[number])} files", flush=True)


# --- SkyLight bitmaps -------------------------------------------------------------

def skylight_cursors(path):
    """Parse CursorAsset's `_cursors` table: {id: (points_w, points_h, delay_s, {scale: [(frame, hot)]})}."""
    data = path.read_bytes()
    offset, size = struct.unpack(">II", data[16:24])       # first slice of the fat binary
    image = data[offset:offset + size]
    position, table = 32, None
    for _ in range(struct.unpack("<I", image[16:20])[0]):
        command, length = struct.unpack("<II", image[position:position + 8])
        if command == 0x19:                                  # LC_SEGMENT_64
            for i in range(struct.unpack("<I", image[position + 64:position + 68])[0]):
                section = position + 72 + 80 * i
                if image[section:section + 32] == b"__const".ljust(16, b"\0") + b"__DATA_CONST".ljust(16, b"\0"):
                    table = struct.unpack("<I", image[section + 48:section + 52])[0]
        position += length
    if table is None:
        raise RuntimeError("CursorAsset: cursor table not found")

    def pointer(at):                                         # chained-fixup rebase: low bits are the target
        return struct.unpack("<Q", image[at:at + 8])[0] & 0xffffffff

    cursors = {}
    for index in range(64):
        cursor_id = struct.unpack("<Q", image[table + 16 * index:table + 16 * index + 8])[0]
        record = pointer(table + 16 * index + 8)
        if not record:
            break
        width, height = struct.unpack("<dd", image[record:record + 16])
        if cursor_id not in BITMAPS:
            continue
        frames = pointer(record + 32)
        delay = struct.unpack("<f", image[record + 40:record + 44])[0]
        scales = {}
        for rep in range(struct.unpack("<Q", image[record + 48:record + 56])[0]):
            at = pointer(record + 56 + 8 * rep)
            pw, ph = struct.unpack("<QQ", image[at:at + 16])
            hot = struct.unpack("<dd", image[at + 16:at + 32])
            scale = round(pw / width)
            if (pw, ph) != (round(width * scale), round(height * scale)):
                raise RuntimeError(f"CursorAsset: unexpected bitmap size for cursor {cursor_id}")
            images = []
            for frame in range(frames):
                raw = image[at + 32 + frame * pw * ph * 4:at + 32 + (frame + 1) * pw * ph * 4]
                # premultiplied BGRA -> Pillow's premultiplied RGBa
                images.append(Image.frombytes("RGBa", (pw, ph), raw, "raw", "BGRa"))
            scales[scale] = (images, hot)
        cursors[cursor_id] = (width, height, delay, scales)
    missing = set(BITMAPS) - set(cursors)
    if missing:
        raise RuntimeError(f"CursorAsset: cursors {missing} not found")
    return cursors


def bitmap_frames(cursor, size):
    width, height, delay, scales = cursor
    scale = size / 24
    target = (round(width * scale), round(height * scale))
    # Apple's own bitmap when there is one at this scale, otherwise downsample the next larger one.
    source = min((s for s in scales if s >= scale), default=max(scales))
    images, (hx, hy) = scales[source]
    frames = [i if i.size == target else i.resize(target, Image.LANCZOS) for i in images]
    return frames, (round(hx / source * scale), round(hy / source * scale))


# --- HIServices vector cursors ----------------------------------------------------

def render_pdf(pdf, scale, workdir):
    out = workdir / "page"
    subprocess.run(["pdftocairo", "-png", "-singlefile", "-transp", "-r", str(72 * scale), str(pdf), str(out)],
                   check=True)
    with Image.open(out.with_suffix(".png")) as page:
        return page.convert("RGBA").convert("RGBa")


def add_shadow(frame, info, scale, pad):
    red, green, blue, alpha = info["shadowcolor"]
    canvas = Image.new("RGBA", (frame.width + 2 * pad, frame.height + 2 * pad))
    # Quartz's y axis points up, so a negative offset moves the shadow down.
    at = (pad + round(info.get("shadowoffsetx", 0) * scale), pad - round(info.get("shadowoffsety", 0) * scale))
    mask = Image.new("L", canvas.size)
    mask.paste(frame.getchannel("a"), at)
    mask = mask.filter(ImageFilter.GaussianBlur(info.get("blur", 0) * scale / 2))
    shadow = Image.new("RGBA", canvas.size, (round(red * 255), round(green * 255), round(blue * 255), 0))
    shadow.putalpha(mask.point(lambda value: round(value * alpha)))
    canvas.alpha_composite(shadow)
    canvas.alpha_composite(frame.convert("RGBA"), (pad, pad))
    return canvas.convert("RGBa")


def vector_frames(name, originals, size, workdir):
    plist = originals / f"{name}.plist"
    info = plistlib.loads(plist.read_bytes()) if plist.is_file() else {}
    shadow = info if "shadowcolor" in info else DEFAULT_SHADOW
    scale = size / 24
    page = render_pdf(originals / f"{name}.pdf", scale, workdir)
    count = int(info.get("frames", 1))
    # Animations are frames stacked top to bottom on one page.
    step = page.height / count
    frames = [page.crop((0, round(i * step), page.width, round(i * step) + round(step))) for i in range(count)]
    if "hotx" in info:
        hot = (info["hotx"], info["hoty"])
    else:
        # Symmetric cursors without a plist point with their centre.
        hot = HOTSPOTS.get(name, (page.width / scale / 2, step / scale / 2))
    pad = max(1, round(3 * scale))
    frames = [add_shadow(f, shadow, scale, pad) for f in frames]
    return frames, (round(hot[0] * scale) + pad, round(hot[1] * scale) + pad), float(info.get("delay", 0))


# --- XCursor ------------------------------------------------------------------------

def write_xcursor(path, images):
    """images: (nominal size, premultiplied RGBa image, xhot, yhot, delay in ms)."""
    chunk_type = 0xfffd0002
    position = 16 + 12 * len(images)
    toc, chunks = [], []
    for nominal, image, xhot, yhot, delay in images:
        width, height = image.size
        xhot, yhot = min(max(xhot, 0), width - 1), min(max(yhot, 0), height - 1)
        pixels = image.tobytes("raw", "BGRa")                # XCursor wants premultiplied ARGB, little endian
        chunk = struct.pack("<9I", 36, chunk_type, nominal, 1, width, height, xhot, yhot, delay) + pixels
        toc.append(struct.pack("<3I", chunk_type, nominal, position))
        chunks.append(chunk)
        position += len(chunk)
    path.write_bytes(b"Xcur" + struct.pack("<3I", 16, 0x10000, len(images)) + b"".join(toc) + b"".join(chunks))


def build(originals, stage):
    cursors = stage / "cursors"
    cursors.mkdir(parents=True, exist_ok=True)
    skylight = skylight_cursors(originals / "CursorAsset")
    jobs = []                                              # (primary name, aliases, images)
    for cursor_id, (primary, aliases) in BITMAPS.items():
        images = []
        for size in SIZES:
            frames, hot = bitmap_frames(skylight[cursor_id], size)
            delay = round(skylight[cursor_id][2] * 1000) if len(frames) > 1 else 0
            images += [(size, frame, *hot, delay) for frame in frames]
        jobs.append((primary, aliases, images))
    with tempfile.TemporaryDirectory() as temporary:
        for name, (primary, aliases) in VECTORS.items():
            images = []
            for size in SIZES:
                frames, hot, delay = vector_frames(name, originals, size, Path(temporary))
                images += [(size, frame, *hot, round(delay * 1000)) for frame in frames]
            jobs.append((primary, aliases, images))
    for primary, aliases, images in jobs:
        write_xcursor(cursors / primary, images)
        for alias in aliases.split():
            link = cursors / alias
            link.unlink(missing_ok=True)
            os.symlink(primary, link)
    names = sum(1 + len(aliases.split()) for _, aliases, _ in jobs)
    print(f"Built {len(jobs)} cursors under {names} names", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("originals", type=Path, help="directory for the extracted Apple files")
    parser.add_argument("stage", type=Path, help="directory to receive cursors/")
    args = parser.parse_args()
    download(args.originals)
    build(args.originals, args.stage)


if __name__ == "__main__":
    sys.exit(main())
