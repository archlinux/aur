#!/usr/bin/env python3
"""Extract selected macOS system sounds from Apple's Sequoia OTA and build a sound theme.

Only the OTA ZIP members that hold the wanted files are read, with HTTP Range, and
each stream is abandoned once its files have been found. Every file is checked
against a pinned SHA-256 before it is used.
"""
import argparse
import concurrent.futures
import hashlib
import io
import lzma
import struct
import subprocess
import sys
import time
import urllib.request
import zipfile
from pathlib import Path

# macOS Sequoia 15.8.3 (24H241) full OTA, the same image as macos-sequoia-fonts.
OTA_URL = ("https://updates.cdn-apple.com/2026FallFCS/2db371bc-ae91-458f-a169-2ea575bb2b7e/"
           "com_apple_MobileAsset_MacSoftwareUpdate/d0016a40184caa9a22a8c0bfb155556c288fb28d.zip")
OTA_SIZE = 15642867282
BLOCK = 8 * 1024 * 1024

CORE = "System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/"
TONES = "System/Library/PrivateFrameworks/ToneLibrary.framework/Versions/A/Resources/"
MAIL = "System/Applications/Mail.app/Contents/Resources/"

# key: (OTA payload number, path inside the image, SHA-256)
FILES = {
    'Basso': (41, 'System/Library/Sounds/Basso.aiff',
        "c41b33729b4d7f895073578adb7192bc41571ccec855c6b12d8127a464b05445"),
    'Blow': (38, 'System/Library/Sounds/Blow.aiff',
        "65a0c069511d5a01cf791635e0b3a9dc3f335caf67f5d3579cc0a6c6232f9818"),
    'Bottle': (40, 'System/Library/Sounds/Bottle.aiff',
        "f25c241c230859db895ba46d85c83269652fb318140a6963f233d17dd65a8874"),
    'Frog': (40, 'System/Library/Sounds/Frog.aiff',
        "318a9af15546772bb0ce2bdebc2cd250ae7130d680dbf49835f1cc5960267f99"),
    'Funk': (38, 'System/Library/Sounds/Funk.aiff',
        "e80aff72e57ed223c3d8c8db45db33de99ba92604ddf66b6bd63da8d4c947fbd"),
    'Glass': (38, 'System/Library/Sounds/Glass.aiff',
        "b337d8e01066c30de2f296763609b7e488bb3c6ea817aa875ee999d708433cf9"),
    'Hero': (38, 'System/Library/Sounds/Hero.aiff',
        "93c4c6dab387914ee903e3dbb6932b821928ac26b2254abf8f5642d7cb886b2c"),
    'Morse': (40, 'System/Library/Sounds/Morse.aiff',
        "a78478575060091de47287b23bd8149e5f67d233b21ce771c5b34e2e1805a47f"),
    'Ping': (38, 'System/Library/Sounds/Ping.aiff',
        "c401532c8f53a31203ecce724dcbb6b0167158137536e8fcc1930dfcb75cccfa"),
    'Pop': (40, 'System/Library/Sounds/Pop.aiff',
        "ab2ac3ffee11e4a6c33f89717cd7d1f961834bd80252521b1dc4adee1cbbb85d"),
    'Purr': (40, 'System/Library/Sounds/Purr.aiff',
        "3770ff805cf82b7808db972a257e7c9ccca0065ab7cd8eaf148a8df33baeb903"),
    'Sosumi': (38, 'System/Library/Sounds/Sosumi.aiff',
        "f005fdc5ac36488d41891e04e9d66269db95af652b0c6b398fcdb0009f14308d"),
    'Submarine': (38, 'System/Library/Sounds/Submarine.aiff',
        "cbb01d8c8032f0be6e41e60362b51a0e14cb267069a49f4c5bfa97a28a5cb5dd"),
    'Tink': (42, 'System/Library/Sounds/Tink.aiff',
        "b634e9c03bdce413533a51fc32d8a631b39a8621b1ee8f9ab1825b6ca0431702"),
    'empty-trash': (39, CORE + 'finder/empty trash.aif',
        "575573a367cf40d241227fad9ada1154bcdfc13cb98fc22f4ec5d361a5c01c2d"),
    'move-to-trash': (37, CORE + 'finder/move to trash.aif',
        "a5a485a447ff2659a1094a9b29762541685a5c4a55b465899a8d283d276fbc9d"),
    'volume-mount': (37, CORE + 'system/Volume Mount.aif',
        "f07cda78c1ee25c5ef048523b1498a2dd59e44afdedc81b0f61bda050992d0c4"),
    'volume-unmount': (39, CORE + 'system/Volume Unmount.aif',
        "0988dd73abda21b62ddec8e2c7361d5ee1ca5793ba4858b69a734f1568df55f0"),
    'grab': (39, CORE + 'system/Grab.aif',
        "b81ab305c54039dbdb7ab400a5e1a542b45ac16f3e3a04e4b4dee321456f8ddd"),
    'screen-capture': (39, CORE + 'system/Screen Capture.aif',
        "75ad70232a4d8c64efa427a157b9fce9f3ab2984f4897b63b18b7349e4b33d0f"),
    'sent-message': (40, CORE + 'system/SentMessage.caf',
        "33a7b80016de5723277f35b0fe4cb5b33fcbe7bf4738680e97f069d6cfc7e8e0"),
    'burn-complete': (39, CORE + 'system/burn complete.aif',
        "c29f806eaaddc3f9a5ceabe102fe492aa5471a68fa8ee9c4b8775cfa8d44587a"),
    'volume': (45, 'System/Library/LoginPlugins/BezelServices.loginPlugin/Contents/Resources/volume.aiff',
        "05ba51fa4d37ffc383b8427a0cf08da688761a6afb97df7e828a763efbdc8ff2"),
    'connect-power': (40, 'System/Library/CoreServices/PowerChime.app/Contents/Resources/connect_power.aif',
        "524cd6236cb4986cdc9eacd3594b66d0259d459b5a3ac0c7f2872c2760827928"),
    'new-mail': (37, MAIL + 'New Mail.aiff',
        "dd52bbe1e36553fbe282c5b8036492c2ec4f7e5355541fe8eb6ab2a3059a6b7a"),
    'mail-sent': (37, MAIL + 'Mail Sent.aiff',
        "fb03bad343d643daf8c11397a22422f47a3fb71b97b2a9e8d0282595e8c3da6e"),
    'received-message': (41, TONES + 'AlertTones/ReceivedMessage.caf',
        "169b1d1818f640db411aa349eb218e9f9b7eb902ba2c28d3595e1530022d84ca"),
    'radar': (42, TONES + 'Ringtones/Radar.m4r',
        "d5f917c513e96f77ab510fcaf206f6eb0253a9385c1c4be6309d6f48ca072307"),
    'reflection': (40, TONES + 'Ringtones/Reflection.m4r',
        "2f33e643c3cc58ce2b30a39d33b55f7077f93061a7767349b50a6b42602f6ea1"),
}

# freedesktop / KDE event name -> key in FILES. Events macOS has no sound for are left
# to the inherited themes.
EVENTS = {
    "bell-window-system": "Tink",       # "Boop", the macOS default alert
    "bell": "Tink",
    "theme-demo": "Hero",
    "dialog-information": "Glass",
    "dialog-question": "Ping",
    "dialog-warning": "Funk",
    "dialog-warning-auth": "Funk",
    "dialog-error": "Basso",
    "dialog-error-serious": "Sosumi",
    "dialog-error-critical": "Sosumi",
    "trash-empty": "empty-trash",
    "item-deleted": "move-to-trash",
    "audio-volume-change": "volume",
    "power-plug": "connect-power",
    "device-added": "volume-mount",
    "device-removed": "volume-unmount",
    "camera-shutter": "grab",
    "screen-capture": "screen-capture",
    "message-new-instant": "received-message",
    "message-sent-instant": "sent-message",
    "message-new-email": "new-mail",
    "message-sent-email": "mail-sent",
    "complete-media-burn": "burn-complete",
    "alarm-clock-elapsed": "radar",
    "phone-incoming-call": "reflection",
}

# Alert sounds under the names macOS shows since Big Sur (the files keep the old names).
# Installed besides the theme so they can be picked for individual notifications.
ALERTS = {
    "Boop": "Tink", "Breeze": "Blow", "Bubble": "Pop", "Crystal": "Glass", "Funky": "Funk",
    "Heroine": "Hero", "Jump": "Frog", "Mezzo": "Basso", "Pebble": "Bottle", "Pluck": "Purr",
    "Pong": "Morse", "Sonar": "Ping", "Sonumi": "Sosumi", "Submerge": "Submarine",
}

# AppleArchive header field sub-types: (kind, size); 'P' is a string with a uint16 length.
AA_FIELDS = {'*': ('flag', 0), '1': ('uint', 1), '2': ('uint', 2), '4': ('uint', 4), '8': ('uint', 8),
             'A': ('blob', 2), 'B': ('blob', 4), 'C': ('blob', 8), 'F': ('hash', 4), 'G': ('hash', 20),
             'H': ('hash', 32), 'I': ('hash', 48), 'J': ('hash', 64), 'S': ('time', 8), 'T': ('time', 12)}


def http_range(url, start, end):
    request = urllib.request.Request(url, headers={"Range": f"bytes={start}-{end}",
                                                   "User-Agent": "macos-sequoia-sound-theme/1"})
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


def download(originals):
    originals.mkdir(parents=True, exist_ok=True)
    by_payload = {}
    for key, (number, path, digest) in FILES.items():
        target = originals / (key + Path(path).suffix)
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
            print(f"payload.{number:03d}: extracted {len(by_payload[number])} sounds", flush=True)


def encode(source, destination):
    # libcanberra only plays Ogg Vorbis and plain PCM WAV, not AIFF/CAF/AAC.
    subprocess.run(["ffmpeg", "-nostdin", "-v", "error", "-y", "-i", str(source), "-map", "0:a:0",
                    "-map_metadata", "-1", "-c:a", "libvorbis", "-q:a", "6",
                    "-fflags", "+bitexact", "-flags:a", "+bitexact", str(destination)], check=True)


def build(originals, stage):
    sources = {key: originals / (key + Path(path).suffix) for key, (_, path, _) in FILES.items()}
    for directory, table in (("stereo", EVENTS), ("alerts", ALERTS)):
        (stage / directory).mkdir(parents=True, exist_ok=True)
        for name, key in table.items():
            encode(sources[key], stage / directory / f"{name}.oga")
    print(f"Built {len(EVENTS)} theme events and {len(ALERTS)} alert sounds", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("originals", type=Path, help="directory for the extracted Apple files")
    parser.add_argument("stage", type=Path, help="directory to receive stereo/ and alerts/")
    args = parser.parse_args()
    download(args.originals)
    build(args.originals, args.stage)


if __name__ == "__main__":
    sys.exit(main())
