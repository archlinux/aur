#!/usr/bin/env python3
"""Build, package and validate Apple Sequoia fonts with a standalone C extractor."""
from contextlib import contextmanager
from fontTools.ttLib import TTCollection, TTFont
from fontTools.ttLib.macUtils import getSFNTResIndices
import csv
import subprocess
import sys
from xml.sax.saxutils import escape
import re
import os
import unicodedata
import plistlib
import argparse
import concurrent.futures
import hashlib
from html.parser import HTMLParser
from pathlib import Path, PurePosixPath
import shutil
import urllib.request
import zipfile
import io
import lzma
import struct
import urllib.error
from collections import defaultdict
import xml.etree.ElementTree as ET

METADATA_DIR = Path(os.environ.get("FONT_METADATA_DIR", Path.cwd()/"metadata"))


# --- font files ---
@contextmanager
def open_fonts(path):
    with open(path, 'rb') as stream:
        signature = stream.read(4)
    collection = None
    fonts = []
    try:
        if signature == b'ttcf':
            collection = TTCollection(str(path), lazy=True)
            fonts = collection.fonts
        elif str(path).casefold().endswith('.dfont'):
            fonts = [TTFont(str(path), res_name_or_index=i, lazy=True)
                     for i in getSFNTResIndices(str(path))]
            if not fonts:
                raise ValueError(f'No sfnt resources in {path}')
        else:
            fonts = [TTFont(str(path), lazy=True)]
        yield fonts
    finally:
        if collection is not None:
            collection.close()
        else:
            for font in fonts:
                font.close()


# --- internal fontconfig ---
FONT_EXTENSIONS = {".ttf", ".ttc", ".otf", ".otc", ".dfont", ".woff", ".woff2", ".sfnt"}


def _split(value):
    return [part.strip() for part in value.split(",") if part.strip()]


def _fontconfig(path):
    result = subprocess.run(
        ["fc-scan", "--format", "%{index}\t%{family}\t%{style}\t%{fullname}\t%{postscriptname}\n", str(path)],
        text=True,
        capture_output=True,
    )
    if result.returncode or not result.stdout.strip():
        return None
    faces = []
    for line in result.stdout.splitlines():
        fields = (line.split("\t") + [""] * 5)[:5]
        if not any(fields):
            continue
        try:
            index = int(fields[0])
        except ValueError:
            return None
        faces.append({
            "index": index,
            "family": _split(fields[1]),
            "style": _split(fields[2]),
            "fullname": _split(fields[3]),
            "postscript": _split(fields[4]),
            "parser": "fontconfig",
        })
    return faces or None


def _fonttools(path):
    path = Path(path)
    faces = []
    with open_fonts(path) as fonts:
        for index, font in enumerate(fonts):
            names = font["name"].names if "name" in font else []

            def values(name_ids):
                found = []
                for record in names:
                    if record.nameID not in name_ids:
                        continue
                    try:
                        value = record.toUnicode().strip()
                    except Exception:
                        continue
                    if value and value not in found:
                        found.append(value)
                return found

            faces.append({
                "index": index,
                "family": values({1, 16, 21}),
                "style": values({2, 17, 22}),
                "fullname": values({4}),
                "postscript": values({6}),
                "parser": "fonttools",
            })
    if not faces:
        raise RuntimeError(f"fontTools found no faces in {path}")
    return faces


def scan_faces(path):
    faces = _fontconfig(path)
    return (faces, "fontconfig") if faces is not None else (_fonttools(path), "fonttools")


def scan_font(path):
    """Return name tuples using the shared Fontconfig/fontTools reader."""
    faces, parser = scan_faces(path)
    records = [tuple(','.join(face[key]) for key in ('family', 'style', 'fullname', 'postscript'))
               for face in faces]
    return records, parser == 'fonttools'


def names_text(faces):
    return "\n".join(value for face in faces for key in ("family", "style", "fullname", "postscript") for value in face[key])


def is_internal_family(value):
    value = value.strip()
    compact = "".join(value.casefold().split())
    system_names = {
        'systemfont', 'systemfontregular', 'systemfontbold',
        '系统字体', '系統字體', '系统字體', '系統字形',
        'システムフォント', '시스템서체', '시스템글꼴',
        'systemschrift', 'policesystème', 'fuentedelsistema',
        'fontdisistema', 'systeemlettertype',
    }
    return (value.startswith(".") or "pua" in compact or 'sfns' in compact
            or compact in system_names)


def is_internal_face(face):
    families = face["family"]
    return bool(families) and all(is_internal_family(name) for name in families)


def is_internal_file(faces):
    return bool(faces) and all(is_internal_face(face) for face in faces)


def generate_config(font_root, install_prefix, output, font7_report=None):
    font_root = Path(font_root)
    install_prefix = install_prefix.rstrip("/")
    aliases = set()
    rejected = set()
    for path in sorted(font_root.rglob("*")):
        if not path.is_file() or path.suffix.casefold() not in FONT_EXTENSIONS:
            continue
        faces, _parser = scan_faces(path)
        if is_internal_file(faces):
            raise RuntimeError(f"private-only font file was not removed: {path}")
        for face in faces:
            aliases.update(name for name in face["family"] if is_internal_family(name))
            if is_internal_face(face):
                relative = path.relative_to(font_root).as_posix()
                rejected.add((f"{install_prefix}/{relative}", face["index"]))

    duplicate_rejected = set()
    if font7_report is not None:
        with Path(font7_report).open() as stream:
            for row in csv.DictReader(stream, delimiter='\t'):
                if row['action'] != 'hide-face':
                    continue
                relative = Path(row['subset_file'])
                if relative.is_absolute() or '..' in relative.parts or relative.parts[0] != 'Download':
                    raise RuntimeError(f'Duplicate-face rules must stay inside Download: {relative}')
                if not (font_root/relative).is_file():
                    raise RuntimeError(f'Missing Font7 duplicate font: {relative}')
                duplicate_rejected.add((f'{install_prefix}/{relative.as_posix()}', int(row['subset_face_index'])))
    rejected.update(duplicate_rejected)
    lines = [
        '<?xml version="1.0"?>',
        '<!DOCTYPE fontconfig SYSTEM "fonts.dtd">',
        '<fontconfig>',
        '  <!-- Hide private macOS faces and proven duplicates inside Download only. -->',
    ]
    for family in sorted(aliases, key=str.casefold):
        lines.extend([
            '  <match target="scan">',
            f'    <test name="file" compare="contains"><string>{escape(install_prefix)}/</string></test>',
            f'    <test name="family" compare="eq"><string>{escape(family)}</string></test>',
            '    <edit name="family" mode="delete"/>',
            '  </match>',
        ])
    if rejected:
        lines.append('  <selectfont>')
        for filename, index in sorted(rejected):
            lines.extend([
                '    <rejectfont><pattern>',
                f'      <patelt name="file"><string>{escape(filename)}</string></patelt>',
                f'      <patelt name="index"><int>{index}</int></patelt>',
                '    </pattern></rejectfont>',
            ])
        lines.append('  </selectfont>')
    lines.append('</fontconfig>')
    output = Path(output)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(
        f"Fontconfig: hid {len(aliases)} private family names, "
        f"{len(rejected - duplicate_rejected)} internal faces and {len(duplicate_rejected)} Font7 duplicate faces; no source priorities"
    )


# --- font policy ---
OS_FONT_PREFIXES = (
    'System/Library/Fonts/',
    'System/Library/PrivateFrameworks/FontServices.framework/Versions/A/Resources/Fonts/ApplicationSupport/',
)
INSTALL_FONT_ROOTS = {'Platform', 'Download', 'Library', 'FontServices'}


def allowed_system_font(relative):
    return relative.startswith(OS_FONT_PREFIXES)


# --- font selection ---
def norm(text):
    return "".join(ch for ch in unicodedata.normalize("NFKD", text).casefold() if ch.isalnum())


def canonicalize_row(text):
    text = re.sub(r"\s+\([^)]*\)$", "", text.strip())
    text = re.sub(r"\s+\d+(?:\.\d+)*(?:\s+[A-Za-z]\w*)?$", "", text)
    text = re.sub(r"\s+\d+(?:\.\d+)*x(?:-\d+)?$", "", text, flags=re.IGNORECASE)
    text = re.sub(r"\s*\d+(?:\.\d+)*d\d+(?:e\d+)?$", "", text)
    text = re.sub(r"\s+UNKNOWN$", "", text, flags=re.IGNORECASE)
    alias = None
    if text == "DFKaiShu-SB-Estd-BF":
        # Font7/Font8 catalog metadata declares this PostScript alias for BiauKaiTC.
        text = "BiauKaiTC Regular"
        alias = "DFKaiShu-SB-Estd-BF catalog alias -> BiauKaiTC Regular"
    elif text.startswith("Brill Italic "):
        text = "Brill " + text[len("Brill Italic "):]
        alias = "Brill Italic display family -> Brill face family/style"
    elif text.startswith("Brill Roman "):
        text = "Brill " + text[len("Brill Roman "):]
        alias = "Brill Roman display family -> Brill face family/style"
    elif text == "STIX Two Text Italic Italic":
        text = "STIX Two Text Italic"
        alias = "STIX Two Text legacy display row repeats Italic style"
    elif text.startswith("November Bangla Traditional Regular "):
        text = "November Bangla Traditional " + text[len("November Bangla Traditional Regular "):]
        alias = "November Bangla Traditional legacy display name"
    return text.strip(), alias


def names_for_font(path):
    records, fallback = scan_font(path)
    keys = set()
    for fields in records:
        values = [part.strip() for field in fields for part in field.split(",") if part.strip()]
        keys.update(norm(value) for value in values)
        families = [part.strip() for part in fields[0].split(",") if part.strip()]
        styles = [part.strip() for field in fields[1:3] for part in field.split(",") if part.strip()]
        for family in families:
            for style in styles:
                keys.add(norm(f"{family} {style}"))
                keys.add(norm(f"{style} {family}"))
    return keys, fallback


def website_rows():
    return [row.strip() for filename in ("installed-downloadable-fonts.txt", "document-fonts.txt")
            for row in (METADATA_DIR/filename).read_text().splitlines()
            if row.strip() and "noto" not in row.casefold()]


def website_keys():
    return {norm(canonicalize_row(row)[0]) for row in website_rows()}


def catalog_face_keys(face):
    family = face.get("FontFamilyName", "")
    style = face.get("FontStyleName", "")
    values = [face.get("PostScriptFontName", ""), family+" "+style,
              family+" "+face.get("PreferredStyleName", style)]
    for display in face.get("DisplayNames", {}).values():
        values.extend((display, display+" "+style))
    return {norm(value) for value in values if value}


# --- font asset catalog ---
def selection():
    targets = {norm(canonicalize_row(row)[0]): row for row in website_rows()}
    best = {}
    catalog = 'Font7.xml'
    for asset in plistlib.loads((METADATA_DIR/catalog).read_bytes())['Assets']:
        keys = set()
        for face in asset.get('FontInfo4', []):
            family = face.get('FontFamilyName', '')
            if not family or is_internal_family(family) or 'noto' in family.casefold():
                continue
            keys.update(catalog_face_keys(face))
        # Catalog mastering metadata is available before any font download.
        rank = (int(asset.get('_MasteredVersion', 0)), int(asset.get('_CompatibilityVersion', 0)),
                -int(asset['_DownloadSize']), asset['__RelativePath'])
        for key in keys & targets.keys():
            if key not in best or rank > best[key][0]:
                best[key] = (rank, asset)
    assets = {}
    for key, (_rank, asset) in sorted(best.items()):
        filename = Path(asset['__RelativePath']).name
        families = sorted({f['FontFamilyName'] for f in asset.get('FontInfo4', []) if f.get('FontFamilyName')})
        assets[filename] = dict(catalog=catalog, filename=filename, size=str(asset['_DownloadSize']),
                                sha1=asset['_Measurement'].hex(),
                                url=asset['__BaseURL']+asset['__RelativePath'], families=','.join(families))
    if not assets:
        raise RuntimeError('No Font7 assets match the downloaded Apple website lists')
    return assets


def selected_assets():
    return sorted(selection().values(), key=lambda row: row['filename'])


# --- font assets ---
def digest(path, algorithm):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, algorithm).hexdigest()


PAGE_URL = 'https://support.apple.com/en-ie/120414'
CATALOG_URL = 'https://mesu.apple.com/assets/macos/com_apple_MobileAsset_Font7/com_apple_MobileAsset_Font7.xml'


class FontListParser(HTMLParser):
    """Read list items only within Apple's two named font sections."""
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.sections = {'default': [], 'document': []}
        self.section = None
        self.item = None

    def handle_starttag(self, tag, attrs):
        if tag == 'h2':
            section = dict(attrs).get('id')
            self.section = section if section in self.sections else None
        elif tag == 'li' and self.section:
            if self.item is not None:
                raise RuntimeError('Unexpected nested list in Apple font section')
            self.item = []

    def handle_data(self, data):
        if self.item is not None:
            self.item.append(data)

    def handle_endtag(self, tag):
        if tag == 'li' and self.item is not None:
            text = ' '.join(''.join(self.item).split())
            if text:
                self.sections[self.section].append(text)
            self.item = None


def fetch_metadata(url):
    request = urllib.request.Request(url, headers={'User-Agent': 'macos-sequoia-fonts-local/4'})
    for attempt in range(3):
        try:
            with urllib.request.urlopen(request, timeout=90) as response:
                return response.read()
        except Exception:
            if attempt == 2:
                raise


def refresh_metadata():
    parser = FontListParser()
    parser.feed(fetch_metadata(PAGE_URL).decode('utf-8'))
    parser.close()
    # Fail visibly on a changed page layout, rather than silently building a partial set.
    if len(parser.sections['default']) < 1000 or len(parser.sections['document']) < 100:
        raise RuntimeError('Apple font-list sections are missing or unexpectedly short')
    catalog = fetch_metadata(CATALOG_URL)
    if not plistlib.loads(catalog).get('Assets'):
        raise RuntimeError('Apple Font7 catalog contains no assets')
    METADATA_DIR.mkdir(parents=True, exist_ok=True)
    (METADATA_DIR/'Font7.xml').write_bytes(catalog)
    for section, filename in [('default', 'installed-downloadable-fonts.txt'), ('document', 'document-fonts.txt')]:
        rows = parser.sections[section]
        (METADATA_DIR/filename).write_text('\n'.join(rows)+'\n')
        print(f'Fetched Apple {section} font list: {len(rows)} rows', flush=True)
    rows = selected_assets()
    print(f'Selected {len(rows)} Font7 assets from the current Apple catalog', flush=True)


def fetch(row, cache):
    target = cache/row['filename']

    def valid(path):
        return (path.is_file() and path.stat().st_size == int(row['size'])
                and digest(path, 'sha1') == row['sha1'])

    if valid(target):
        return target
    temporary = target.with_suffix('.zip.part')
    for attempt in range(3):
        try:
            request = urllib.request.Request(row['url'], headers={'User-Agent': 'macos-sequoia-fonts-local/3'})
            with urllib.request.urlopen(request, timeout=90) as source, temporary.open('wb') as out:
                shutil.copyfileobj(source, out, length=1024*1024)
            if not valid(temporary):
                raise RuntimeError(f"Asset size/checksum mismatch: {row['filename']}")
            temporary.replace(target)
            return target
        except Exception:
            temporary.unlink(missing_ok=True)
            if attempt == 2:
                raise


def download(cache):
    rows = selected_assets()
    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
        for index, path in enumerate(pool.map(lambda row: fetch(row, cache), rows), 1):
            if index % 20 == 0 or index == len(rows):
                print(f'Verified/downloaded Font7 asset {index}/{len(rows)}: {path.name}', flush=True)


def unpack(cache, output):
    rows = selected_assets()
    for index, row in enumerate(rows, 1):
        asset_root = output/'Font7'/Path(row['filename']).stem
        asset_root.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(cache/row['filename']) as archive:
            for item in archive.infolist():
                path = PurePosixPath(item.filename)
                if path.is_absolute() or '..' in path.parts or path.suffix.casefold() not in FONT_EXTENSIONS:
                    continue
                destination = asset_root/path.name
                if destination.exists():
                    raise RuntimeError(f'Asset filename collision: {destination}')
                with archive.open(item) as source, destination.open('wb') as out:
                    shutil.copyfileobj(source, out, length=1024*1024)
        if index % 20 == 0 or index == len(rows):
            print(f'Unpacked Font7 asset {index}/{len(rows)}', flush=True)


# --- extract sequoia ota ---
OTA_URL = "https://updates.cdn-apple.com/2026FallFCS/ad22d07e-0d68-4679-9375-99a5c4fc95ae/com_apple_MobileAsset_MacSoftwareUpdate/a30f5f5e5659a0760382124bee535d7ac33cb51f.zip"
OTA_SIZE = 15640056810
BLOCK = 8 * 1024 * 1024


class HTTPRangeFile(io.RawIOBase):
    """Seekable, bounded-memory HTTP range reader for Python's zipfile module."""
    def __init__(self, url):
        self.url = url
        self.position = 0
        self.cache_start = -1
        self.cache = b""
        req = urllib.request.Request(url, headers={"Range": "bytes=0-0", "User-Agent": "macos-sequoia-fonts-local/1"})
        with urllib.request.urlopen(req, timeout=60) as response:
            if response.status != 206:
                raise RuntimeError(f"Apple CDN did not honor Range request (HTTP {response.status})")
            content_range = response.headers.get("Content-Range", "")
            try:
                self.size = int(content_range.rsplit("/", 1)[1])
            except (IndexError, ValueError) as exc:
                raise RuntimeError(f"Invalid Content-Range from Apple CDN: {content_range!r}") from exc
            if response.read(1) != b"P":
                raise RuntimeError("Unexpected OTA ZIP header")
        if self.size != OTA_SIZE:
            raise RuntimeError(f"OTA size changed: expected {OTA_SIZE}, got {self.size}")

    def readable(self):
        return True

    def seekable(self):
        return True

    def tell(self):
        return self.position

    def seek(self, offset, whence=os.SEEK_SET):
        if whence == os.SEEK_SET:
            new = offset
        elif whence == os.SEEK_CUR:
            new = self.position + offset
        elif whence == os.SEEK_END:
            new = self.size + offset
        else:
            raise ValueError("invalid whence")
        if new < 0:
            raise ValueError("negative seek position")
        self.position = min(new, self.size)
        return self.position

    def _block(self, start):
        end = min(start + BLOCK, self.size) - 1
        req = urllib.request.Request(self.url, headers={
            "Range": f"bytes={start}-{end}",
            "User-Agent": "macos-sequoia-fonts-local/1",
        })
        last_error = None
        for attempt in range(5):
            try:
                with urllib.request.urlopen(req, timeout=90) as response:
                    if response.status != 206:
                        raise RuntimeError(f"Range request returned HTTP {response.status}")
                    data = response.read()
                if len(data) != end - start + 1:
                    raise RuntimeError(f"short range response at {start}: got {len(data)} bytes")
                self.cache_start, self.cache = start, data
                return
            except Exception as exc:
                last_error = exc
        raise RuntimeError(f"failed to fetch OTA range {start}-{end}: {last_error}")

    def read(self, size=-1):
        if size is None or size < 0:
            size = self.size - self.position
        size = min(size, self.size - self.position)
        pieces = []
        remaining = size
        while remaining:
            block_start = (self.position // BLOCK) * BLOCK
            if block_start != self.cache_start:
                self._block(block_start)
            offset = self.position - self.cache_start
            take = min(remaining, len(self.cache) - offset)
            if take <= 0:
                break
            pieces.append(self.cache[offset:offset + take])
            self.position += take
            remaining -= take
        return b"".join(pieces)


def decode_pbzx(source, destination):
    header = source.read(12)
    if len(header) != 12 or header[:4] != b"pbzx":
        raise RuntimeError(f"invalid PBZX header: {header[:12]!r}")
    with destination.open("wb") as out:
        while True:
            header = source.read(16)
            if not header:
                break
            if len(header) != 16:
                raise RuntimeError("truncated PBZX chunk header")
            raw_size, compressed_size = struct.unpack(">QQ", header)
            if raw_size == compressed_size == 0:
                break
            block = source.read(compressed_size)
            if len(block) != compressed_size:
                raise RuntimeError("truncated PBZX block")
            raw = block if compressed_size == raw_size else lzma.decompress(block, format=lzma.FORMAT_XZ)
            if len(raw) != raw_size:
                raise RuntimeError("PBZX decoded block size mismatch")
            out.write(raw)


def extract_system_fonts(output, extractor, local_archive=None):
    # Font-bearing members of the fixed 15.8.1 / 24H32 OTA build.
    payloads = (4, 7, 11, 12, 16, 21, 23, 26, 30, 31, 34, 35, 37, 39, 40, 41, 42, 43, 44)
    output.mkdir(parents=True, exist_ok=True)
    if local_archive:
        archive = zipfile.ZipFile(local_archive)
        print(f"Using cached Apple Sequoia OTA ZIP: {local_archive}", flush=True)
    else:
        source = HTTPRangeFile(OTA_URL)
        archive = zipfile.ZipFile(source)
        print("Range-reading Apple Sequoia OTA ZIP (whole ZIP is not downloaded)", flush=True)
    work = output.parent / "payload-work"
    work.mkdir(parents=True, exist_ok=True)
    try:
        for index, number in enumerate(payloads, 1):
            name = f"payload.{number:03d}"
            member = f"AssetData/payloadv2/{name}"
            pbzx = work / f"{name}.pbzx"
            with archive.open(member) as src, pbzx.open("wb") as dst:
                for block in iter(lambda: src.read(1024 * 1024), b""):
                    dst.write(block)
            # zipfile verifies the ZIP member CRC while streaming to EOF.
            if pbzx.stat().st_size != archive.getinfo(member).file_size:
                raise RuntimeError(f"{member}: ZIP member size mismatch")
            yaa = work / f"{name}.yaa"
            with pbzx.open("rb") as src:
                decode_pbzx(src, yaa)
            result = subprocess.run([str(extractor), str(yaa), str(output)],
                                    check=True, text=True, capture_output=True)
            print(f"Sequoia payload {index}/{len(payloads)}: {result.stdout.strip()}", flush=True)
            pbzx.unlink()
            yaa.unlink()
    finally:
        archive.close()
    print("Finished extracting Sequoia system-image fonts", flush=True)


# --- filter fonts ---
def filter_fonts(root):
    removed_application_private = removed_noto = removed_sfns = removed_internal = kept = 0
    removed_unlisted = 0
    requested = website_keys()
    fonttools_fallbacks = []
    for path in list(root.rglob("*")):
        if not path.is_file() or path.suffix.casefold() not in FONT_EXTENSIONS:
            continue
        relative_parts = path.relative_to(root).parts
        outside_system_allowlist = relative_parts[0] == 'Sequoia-System' and not allowed_system_font('/'.join(relative_parts[1:]))
        is_app_bundled = any(part.endswith(".app") for part in relative_parts)
        if (
            outside_system_allowlist
            or is_app_bundled
        ):
            path.unlink()
            removed_application_private += 1
            continue
        if "noto" in path.name.casefold():
            path.unlink()
            removed_noto += 1
            continue
        if path.stem.casefold().startswith("sfns"):
            path.unlink()
            removed_sfns += 1
            continue
        try:
            faces, parser = scan_faces(path)
        except Exception as exc:
            raise SystemExit(str(exc))
        if parser == "fonttools":
            fonttools_fallbacks.append(str(path.relative_to(root)))
        names = names_text(faces).splitlines()
        if any("noto" in name.casefold() for name in names):
            path.unlink()
            removed_noto += 1
            continue
        if any("sfns" in name.casefold().replace(" ", "") for name in names):
            path.unlink()
            removed_sfns += 1
            continue
        if is_internal_file(faces):
            path.unlink()
            removed_internal += 1
            continue
        if relative_parts[:2] == ('Font-Book', 'Font7') and not names_for_font(path)[0] & requested:
            path.unlink()
            removed_unlisted += 1
            continue
        kept += 1

    for directory, dirs, files in os.walk(root, topdown=False):
        parent = Path(directory)
        for name in dirs + files:
            normalized = unicodedata.normalize("NFC", name)
            if name == normalized:
                continue
            source, target = parent / name, parent / normalized
            if target.exists():
                raise SystemExit(f"NFC path collision: {source} -> {target}")
            source.rename(target)
        if parent != root and not any(parent.iterdir()):
            parent.rmdir()

    print(
        f"kept={kept}; removed_application_private={removed_application_private}; "
        f"removed_noto={removed_noto}; removed_sfns={removed_sfns}; "
        f"removed_internal_only={removed_internal}; removed_unlisted_font7={removed_unlisted}; "
        f"fonttools_fallback_files={len(fonttools_fallbacks)}"
    )
    for path in fonttools_fallbacks:
        print(f"fonttools fallback: {path}")


# --- font dedup ---
def normalize(value):
    return unicodedata.normalize("NFC", " ".join(value.split())).casefold()


def names(font, ids):
    result = set()
    for record in font["name"].names if "name" in font else ():
        if record.nameID not in ids:
            continue
        try:
            value = record.toUnicode().strip()
        except Exception:
            continue
        if value:
            result.add(value)
    return result


def unicode_coverage(font):
    coverage = set()
    if "cmap" not in font:
        return frozenset()
    for subtable in font["cmap"].tables:
        if subtable.isUnicode():
            coverage.update(subtable.cmap)
    return frozenset(coverage)


def postscript_identities(face):
    """Include explicit named instances when looking up a variable superset."""
    return face['postscript_names'] | frozenset(face.get('instance_postscript_names', ()))


def version_key(value):
    """Read numeric and Apple d/a/b/fc/f ... e version strings conservatively."""
    match = re.match(
        r'^(?:version\s*)?(\d+)(?:\.(\d{1,9}))?(?:\.(\d+))?'
        r'(?:(fc|d|a|b|f)(\d+)(?:e(\d+))?)?(?=$|[\s;,(])',
        value.strip(), re.IGNORECASE,
    )
    if not match:
        return None
    major, fraction, patch, stage, build, edit = match.groups()
    return [int(major), int((fraction or '0').ljust(9, '0')), int(patch or 0),
            {'d': 0, 'a': 1, 'b': 2, 'fc': 3, 'f': 4, '': 5}[(stage or '').lower()],
            int(build or 0), int(edit or 0)]


def scan_face(path, index, font):
    raw_families = names(font, {1, 16, 21})
    raw_styles = names(font, {2, 17, 22})
    families = frozenset(
        normalize(value)
        for value in raw_families
        if not is_internal_family(value)
    )
    styles = frozenset(normalize(value) for value in raw_styles)
    coverage = unicode_coverage(font)
    if not families or not styles or not coverage:
        return {"path": path, "index": index, "eligible": False,
                "public_unreadable": bool(families)}
    version = (font['name'].getDebugName(5) or '').strip()
    revision = float(font['head'].fontRevision) if 'head' in font else 0
    return {
        "path": path,
        "index": index,
        "eligible": True,
        "families": families,
        "styles": styles,
        "full_names": frozenset(normalize(value) for value in names(font, {4})),
        "postscript_names": frozenset(normalize(value) for value in names(font, {6})),
        "variable": 'fvar' in font,
        "instance_postscript_names": sorted({
            normalize(value)
            for instance in (font['fvar'].instances if 'fvar' in font else ())
            if instance.postscriptNameID != 0xffff
            for value in names(font, {instance.postscriptNameID})
        }),
        "coverage": coverage,
        "revision": revision,
        "version": version,
        "version_key": version_key(version) or version_key(f'{revision:.9f}'),
    }


def scan_file(path):
    with open_fonts(path) as fonts:
        return [scan_face(path, index, font) for index, font in enumerate(fonts)]


def same_face_name(candidate, complete):
    if candidate.get('variable', False):
        # A single static face cannot replace an entire variable face. Even
        # between variable faces, preserve every explicit named instance.
        if not complete.get('variable', False):
            return False
        if not frozenset(candidate.get('instance_postscript_names', ())) <= postscript_identities(complete):
            return False
    if candidate['postscript_names'].intersection(postscript_identities(complete)):
        return True
    if candidate['postscript_names'] and complete['postscript_names']:
        # A shared localized alias is insufficient: Hiragino Sans CNS and TC
        # share some localized names but remain distinct public families.
        # Permit different PostScript spellings only when all public family
        # names and all full names agree (as in the CY dfont/SFNT pairs).
        if candidate['families'] != complete['families']:
            return False
        if not candidate['full_names'] or candidate['full_names'] != complete['full_names']:
            return False
    if not candidate["families"].intersection(complete["families"]):
        return False
    if not candidate["styles"].intersection(complete["styles"]):
        return False
    # Public family/style/full names can agree even when old dfont and modern
    # SFNT containers use different PostScript spellings (Geneva/Helvetica CY).
    left, right = candidate['full_names'], complete['full_names']
    if left and right and not left.intersection(right):
        return False
    return True


def terminal_supersets(face_key, edges, by_key, cache):
    if face_key in cache:
        return cache[face_key]
    supersets = edges.get(face_key, ())
    if not supersets:
        result = ()
    else:
        result_list = []
        for superset_key in supersets:
            next_faces = terminal_supersets(superset_key, edges, by_key, cache)
            if next_faces:
                result_list.extend(next_faces)
            else:
                result_list.append(by_key[superset_key])
        result = tuple({(face["path"], face["index"]): face for face in result_list}.values())
    cache[face_key] = result
    return result


def preferred_superset(faces, root):
    return min(faces, key=lambda face: (-len(face['coverage']), preference(face, root)))


def preference(face, root):
    relative = face['path'].relative_to(root).as_posix()
    version = face.get('version_key') or version_key(f"{face['revision']:.9f}")
    return (tuple(-part for part in version), -face['revision'], relative, face['index'])


def deduplicate_font7(root, report_path):
    if root.parts[-2:] != ("Font-Book", "Font7"):
        raise RuntimeError("Deduplication is restricted to Font-Book/Font7")
    all_by_file = {}
    eligible = []
    paths = sorted(
        path for path in root.rglob("*")
        if path.is_file() and path.suffix.casefold() in FONT_EXTENSIONS
    )
    for path in paths:
        try:
            faces = scan_file(path)
        except Exception as exc:
            raise RuntimeError(f"Cannot audit {path.relative_to(root)}: {exc}") from exc
        all_by_file[path] = faces
        eligible.extend(face for face in faces if face["eligible"])

    by_key = {(face["path"], face["index"]): face for face in eligible}
    buckets = defaultdict(list)
    for face in eligible:
        for postscript in postscript_identities(face):
            buckets[('postscript', postscript)].append(face)
        for family in face["families"]:
            for style in face["styles"]:
                buckets[(family, style)].append(face)

    edges = defaultdict(list)
    tested = set()
    for bucket in buckets.values():
        for candidate in bucket:
            candidate_key = (candidate["path"], candidate["index"])
            for complete in bucket:
                complete_key = (complete["path"], complete["index"])
                if candidate_key == complete_key or not candidate["coverage"] <= complete["coverage"]:
                    continue
                if candidate['coverage'] == complete['coverage'] and preference(candidate, root) <= preference(complete, root):
                    continue
                pair = (candidate_key, complete_key)
                if pair in tested:
                    continue
                tested.add(pair)
                if same_face_name(candidate, complete):
                    edges[candidate_key].append(complete_key)

    terminal_cache = {}
    replacement = {}
    for face_key in edges:
        terminals = terminal_supersets(face_key, edges, by_key, terminal_cache)
        if terminals:
            replacement[face_key] = preferred_superset(terminals, root)

    remove_paths = set()
    for path, faces in all_by_file.items():
        if not faces:
            continue
        # Internal-only sibling faces do not prevent deleting a redundant TTC.
        face_keys = [(path, face["index"]) for face in faces if face['eligible']]
        if not face_keys or any(not face['eligible'] and face.get('public_unreadable', False) for face in faces):
            continue
        if all(key in replacement and replacement[key]["path"] != path for key in face_keys):
            remove_paths.add(path)

    rows = []
    hidden_faces = []
    for face_key, complete in sorted(replacement.items(), key=lambda item: (item[0][0].as_posix(), item[0][1])):
        path, index = face_key
        action = "delete-file" if path in remove_paths else "hide-face"
        if action == "hide-face":
            hidden_faces.append((path.relative_to(root).as_posix(), index))
        rows.append({
            "action": action,
            "subset_file": path.relative_to(root).as_posix(),
            "subset_face_index": index,
            "superset_file": complete["path"].relative_to(root).as_posix(),
            "superset_face_index": complete["index"],
            "subset_codepoints": len(by_key[face_key]["coverage"]),
            "superset_codepoints": len(complete["coverage"]),
            "subset_version": by_key[face_key]['version'],
            "superset_version": complete['version'],
        })

    for path in sorted(remove_paths):
        path.unlink()
    for directory, _dirs, _files in os.walk(root, topdown=False):
        parent = Path(directory)
        if parent != root and not any(parent.iterdir()):
            parent.rmdir()

    report_path.parent.mkdir(parents=True, exist_ok=True)
    with report_path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(
            stream,
            fieldnames=("action", "subset_file", "subset_face_index", "superset_file", "superset_face_index", "subset_codepoints", "superset_codepoints", "subset_version", "superset_version"),
            delimiter="\t",
            lineterminator="\n",
        )
        writer.writeheader()
        writer.writerows(rows)
    print(f"subset duplicates: removed_files={len(remove_paths)}; hidden_faces={len(hidden_faces)}; report={report_path}")


# --- font inventory ---
def relative_path(value):
    path = PurePosixPath(value)
    if not value or path.is_absolute() or '..' in path.parts or any(c in value for c in '\t\r\n'):
        raise ValueError(f'Invalid relative path: {value!r}')
    return value


def font_paths(root):
    return sorted(path for path in root.rglob('*')
                  if path.is_file() and path.suffix.casefold() in FONT_EXTENSIONS)


def file_hash(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def read_rows(path, fields):
    with path.open(newline='', encoding='utf-8') as stream:
        reader = csv.reader(stream, delimiter='\t', strict=True)
        if next(reader, None) != fields:
            raise ValueError(f'Invalid header in {path}')
        rows = list(reader)
    if any(len(row) != len(fields) for row in rows):
        raise ValueError(f'Invalid row in {path}')
    return rows


def inventory_snapshot(root, reference):
    paths = font_paths(root)
    with reference.open('w', newline='', encoding='utf-8') as stream:
        writer = csv.writer(stream, delimiter='\t', lineterminator='\n')
        writer.writerow(('source_file', 'size', 'sha256'))
        for path in paths:
            writer.writerow((relative_path(path.relative_to(root).as_posix()),
                             path.stat().st_size, file_hash(path)))
    print(f'Source file reference: {len(paths)} fonts with SHA256')


def inventory_check(root, reference, path_report):
    mapping, targets = {}, set()
    for source, target in read_rows(path_report, ['source_file', 'installed_file']):
        relative_path(source)
        relative_path(target)
        if source in mapping or target in targets:
            raise ValueError(f'Duplicate source/target: {source}')
        mapping[source] = target
        targets.add(target)
    sources = set()
    for source, size, expected_hash in read_rows(reference, ['source_file', 'size', 'sha256']):
        relative_path(source)
        if not re.fullmatch(r'[0-9]+', size) or not re.fullmatch(r'[0-9a-fA-F]{64}', expected_hash):
            raise ValueError(f'Invalid source inventory row: {source}')
        if source not in mapping or source in sources:
            raise ValueError(f'Missing/duplicate source: {source}')
        sources.add(source)
        path = root/mapping[source]
        if not path.is_file() or path.stat().st_size != int(size):
            raise ValueError(f'Font missing or size changed: {path}')
        if file_hash(path) != expected_hash.lower():
            raise ValueError(f'Font contents changed: {path}')
    if sources != mapping.keys():
        raise ValueError('Source map differs from the inventory')
    actual = {path.relative_to(root).as_posix() for path in font_paths(root)}
    if actual != targets:
        raise ValueError(f'Installed fonts differ from the source map: {sorted(actual ^ targets)}')
    print(f'Retained source files preserved byte for byte: {len(sources)}/{len(sources)}')


# --- organize fonts ---
PREFIXES = (
    ('Apple-Developer', 'Platform'),
    ('Sequoia-System/System/Library/Fonts', 'Library'),
    ('Sequoia-System/System/Library/PrivateFrameworks/FontServices.framework/Versions/A/Resources/Fonts/ApplicationSupport', 'FontServices'),
)


def destination(relative):
    for source, target in PREFIXES:
        prefix = Path(source)
        if relative.is_relative_to(prefix):
            return Path(target)/relative.relative_to(prefix)
    if relative.parts[:2] == ('Font-Book', 'Font7'):
        return Path('Download')/relative.name
    raise RuntimeError(f'Unexpected font source: {relative}')


def organize_fonts(root, path_report, dedup_report):
    groups = defaultdict(list)
    for path in sorted(root.rglob('*')):
        if path.is_file() and path.suffix.casefold() in FONT_EXTENSIONS:
            relative = path.relative_to(root)
            groups[destination(relative)].append(relative)
    mapping = {}
    for target, sources in groups.items():
        if len(sources) == 1:
            mapping[sources[0]] = target
            continue
        if target.parent != Path('Download'):
            raise RuntimeError(f'Installation path collision: {target}: {sources}')
        for source in sources:
            # Asset IDs distinguish versions without judging names or coverage.
            mapping[source] = target.with_name(f'{target.stem}-{source.parent.name}{target.suffix}')
    if len(set(mapping.values())) != len(mapping):
        raise RuntimeError('Flattened font filenames are not unique')
    for target in mapping.values():
        if (root/target).exists():
            raise RuntimeError(f'Installation target already exists: {root/target}')
    for source, target in mapping.items():
        path = root/target
        path.parent.mkdir(parents=True, exist_ok=True)
        (root/source).rename(path)
    for directory, _dirs, _files in os.walk(root, topdown=False):
        path = Path(directory)
        if path != root and not any(path.iterdir()):
            path.rmdir()
    with dedup_report.open() as stream:
        reader = csv.DictReader(stream, delimiter='\t')
        fields, rows = list(reader.fieldnames), list(reader)
    for row in rows:
        for key in ('subset_file', 'superset_file'):
            source = Path('Font-Book/Font7')/row[key]
            row['source_'+key] = source.as_posix()
            if source in mapping:
                row[key] = mapping[source].as_posix()
            elif key == 'superset_file' or row['action'] == 'hide-face':
                raise RuntimeError(f'Font7 dedup report references missing file: {source}')
            else:
                row[key] = source.as_posix()
    with dedup_report.open('w') as stream:
        writer = csv.DictWriter(stream, fieldnames=fields+['source_subset_file', 'source_superset_file'],
                                delimiter='\t', lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)
    with path_report.open('w') as stream:
        writer = csv.writer(stream, delimiter='\t', lineterminator='\n')
        writer.writerow(('source_file', 'installed_file'))
        writer.writerows((source.as_posix(), target.as_posix()) for source, target in sorted(mapping.items()))
    counts = {name: sum(path.parts[0] == name for path in mapping.values())
              for name in ('Platform', 'Download', 'Library', 'FontServices')}
    print(f'Preserved font sources: {counts}; flattened filename collisions: {sum(len(v)>1 for v in groups.values())}')


# --- audit fonts ---
def load_keys(root):
    keys = set()
    files = 0
    fallback_paths = []
    for path in root.rglob("*"):
        if path.is_file() and path.suffix.casefold() in FONT_EXTENSIONS:
            files += 1
            font_keys, fallback = names_for_font(path)
            keys.update(font_keys)
            if fallback:
                fallback_paths.append(str(path.relative_to(root)))
    return files, keys, fallback_paths


def list_rows(path):
    return [line.strip() for line in path.read_text().splitlines() if line.strip()]


def audit_fonts(root):
    files, keys, fallback_paths = load_keys(root)
    print(f"Font files scanned: {files}")
    for path in fallback_paths:
        print(f"Fontconfig-unreadable; names read with fontTools: {path}")
    total_noto = 0
    total_missing = 0
    for label, filename in (
        ("Installed or downloadable", "installed-downloadable-fonts.txt"),
        ("Document-support", "document-fonts.txt"),
    ):
        rows = list_rows(METADATA_DIR / filename)
        target = [row for row in rows if "noto" not in row.casefold()]
        total_noto += len(rows) - len(target)
        missing = []
        aliases = {}
        for row in target:
            canonical, alias = canonicalize_row(row)
            if norm(canonical) not in keys:
                missing.append(row)
            elif alias:
                aliases[alias] = aliases.get(alias, 0) + 1
        print(f"{label}: {len(target) - len(missing)}/{len(target)} non-Noto rows matched; {len(rows)-len(target)} Noto rows excluded")
        for alias, count in sorted(aliases.items()):
            print(f"  resolved by face-name alias ({count}): {alias}")
        if missing:
            total_missing += len(missing)
            print(f"Unmatched {label} rows:")
            for row in missing:
                print(f"  {row}")
    print(f"Noto rows excluded from coverage target: {total_noto}")
    if total_missing:
        raise SystemExit(f'Apple Sequoia list has {total_missing} unmatched non-Noto rows')


# --- validate package ---
def validate_package(root, source_reference):
    files = 0
    families = set()
    bad = []
    fallback_paths = []
    actual_roots = {path.name for path in root.iterdir() if path.is_dir()}
    if actual_roots != INSTALL_FONT_ROOTS:
        raise SystemExit(f'Unexpected font directory layout: {actual_roots}')
    if any(path.is_dir() for path in (root/'Download').iterdir()):
        raise SystemExit('Download must be flat: subdirectories found')
    for path in root.rglob("*"):
        if not path.is_file() or path.suffix.casefold() not in FONT_EXTENSIONS:
            continue
        files += 1
        relative_parts = path.relative_to(root).parts
        outside_allowlist = relative_parts[0] not in INSTALL_FONT_ROOTS or len(relative_parts) < 2
        app_bundled = any(part.endswith(".app") for part in relative_parts)
        if outside_allowlist or app_bundled or 'Subsets' in relative_parts:
            bad.append(f"application/framework-private font remains: {path}")
        if "noto" in str(path).casefold() or path.stem.casefold().startswith("sfns"):
            bad.append(str(path))
        try:
            records, fallback = scan_font(path)
        except RuntimeError as exc:
            raise SystemExit(str(exc))
        if fallback:
            fallback_paths.append(str(path.relative_to(root)))
        private_faces, _parser = scan_faces(path)
        if is_internal_file(private_faces):
            bad.append(f"private-only font file remains: {path}")
        for record in records:
            for family in record[:1]:
                for value in family.split(","):
                    value = value.strip()
                    families.add(value)
                    compact = value.casefold().replace(" ", "")
                    if "noto" in compact or "sfns" in compact:
                        bad.append(f"{path} [{value}]")
    if bad:
        print("Excluded families found:", *bad, sep="\n  ", file=sys.stderr)
        raise SystemExit(1)
    needed = ("New York", "SF Pro", "SF Compact", "SF Mono", "SF Arabic", "SF Armenian", "SF Georgian", "SF Hebrew")
    missing = [name for name in needed if not any(name.casefold() in family.casefold() for family in families)]
    if missing:
        raise SystemExit("Missing official Apple SF families: " + ", ".join(missing))

    config = Path("/etc/fonts/conf.d/90-macos-sequoia-internal.conf")
    if not config.is_file():
        raise SystemExit(f"missing packaged system Fontconfig rules: {config}")
    rules = ET.parse(config).getroot()
    visible = subprocess.check_output(
        ["fc-list", "--format", "%{file}\t%{index}\t%{family}\n"], text=True
    )
    visible_faces = set()
    visible_families = set()
    for line in visible.splitlines():
        filename, index, family_text = (line.split("\t") + ["", "", ""])[:3]
        if not filename.startswith(str(root) + "/"):
            continue
        visible_faces.add((filename, index))
        for family in (part.strip() for part in family_text.split(",")):
            if not family:
                continue
            visible_families.add(family)
            if is_internal_family(family):
                bad.append(f"private family still visible in Fontconfig: {filename} [{family}]")
    selectors = set()
    for pattern in rules.findall("./selectfont/rejectfont/pattern"):
        filename = pattern.findtext('./patelt[@name="file"]/string')
        index = pattern.findtext('./patelt[@name="index"]/int')
        if filename is None or index is None:
            raise SystemExit("malformed internal-face Fontconfig reject pattern")
        selectors.add((filename, index))
    leaked = selectors & visible_faces
    if leaked:
        bad.extend(f"internal face remains visible: {filename} index={index}" for filename, index in sorted(leaked))
    for public_name in ("Apple Color Emoji", "New York", "SF Arabic"):
        if not any(public_name.casefold() in family.casefold() for family in visible_families):
            bad.append(f"public family was lost: {public_name}")
    if bad:
        raise SystemExit("Fontconfig/package validation failed:\n  " + "\n  ".join(bad[:30]))
    licenses = Path("/usr/share/licenses/macos-sequoia-fonts")
    expected_licenses = {"NY-License.rtf", "SF-Pro-License.rtf", "SF-Compact-License.rtf", "SF-Mono-License.rtf", "SF-Arabic-License.rtf", "SF-Armenian-License.rtf", "SF-Georgian-License.rtf", "SF-Hebrew-License.rtf"}
    missing_licenses = sorted(name for name in expected_licenses if not (licenses / name).is_file())
    if missing_licenses:
        raise SystemExit("Missing Apple font license texts: " + ", ".join(missing_licenses))
    assets = selected_assets()
    print(f'Validated website-selected Font7 assets: {len(assets)}')
    docs = Path('/usr/share/doc/macos-sequoia-fonts')
    expected_docs = {'installed-downloadable-fonts.txt', 'document-fonts.txt'}
    if {path.name for path in docs.iterdir()} != expected_docs or not all((docs/name).is_file() for name in expected_docs):
        raise SystemExit('Package documentation must contain exactly the two font-list TXT files')
    for name in expected_docs:
        if (docs/name).read_bytes() != (source_reference/'metadata'/name).read_bytes():
            raise SystemExit(f'Packaged font list differs from the build input: {name}')
    inventory_check(root, source_reference/'source-fonts.tsv', source_reference/'font-paths.tsv')
    print(f"Validated {files} font files; no Noto/SFNS or private-only files; system Fontconfig hides private names/faces; New York and all seven official SF families and their license texts are present.")
    for path in fallback_paths:
        print(f"Fontconfig-unreadable; names read with fontTools: {path}")




def compile_extractor(srcdir, work):
    library = srcdir/'neoaa/src/lib'
    shutil.rmtree(srcdir/'neoaa', ignore_errors=True)
    shutil.copytree(srcdir/'libneoaa', library, symlinks=True)
    compression = library/'libNeoAppleArchive/compression'
    for name in ('lzfse', 'libzbitmap'):
        shutil.rmtree(compression/name, ignore_errors=True)
        shutil.copytree(srcdir/name, compression/name, symlinks=True)
    subprocess.run(['make', '-C', str(library), 'CC=gcc', 'EXCLUDE_AEA_SUPPORT=1',
                    'CFLAGS=-fPIC -Os -Wall -pedantic -Wextra -DEXCLUDE_AEA_SUPPORT=1 '
                    '-Ibuild/lzfse/include -Ibuild/libzbitmap/include', 'output'], check=True)
    source = srcdir/'extract_font_files.c'
    extractor = work/'extract_font_files'
    subprocess.run(['gcc', '-O2', '-DEXCLUDE_AEA_SUPPORT=1',
                    f'-I{library}/libNeoAppleArchive',
                    f'-I{library}/build/lzfse/include', f'-I{library}/build/libzbitmap/include',
                    str(source), f'-L{library}/build/usr/lib', f'-L{library}/build/lzfse/lib',
                    f'-L{library}/build/libzbitmap/lib', '-o', str(extractor),
                    '-lNeoAppleArchive', '-llzfse', '-lzbitmap', '-lz'], check=True)
    return extractor


def extract_apple_dmgs(srcdir, output, licenses):
    for product in ('SF-Pro', 'SF-Compact', 'SF-Mono', 'SF-Arabic', 'SF-Armenian',
                    'SF-Georgian', 'SF-Hebrew', 'NY'):
        work = srcdir/f'dmg-{product}'
        shutil.rmtree(work, ignore_errors=True)
        xar, payload_root = work/'xar', work/'payload'
        for directory in (xar, payload_root, output/product, licenses):
            directory.mkdir(parents=True, exist_ok=True)
        subprocess.run(['7z', 'x', '-y', f'-o{work}', str(srcdir/f'{product}.dmg')],
                       check=True, stdout=subprocess.DEVNULL)
        package = next((p for p in sorted(work.rglob('*.pkg')) if p.is_file()), None)
        if package is None:
            raise RuntimeError(f'No installer package found in {product} DMG')
        subprocess.run(['bsdtar', '-xf', str(package), '-C', str(xar)], check=True)
        license_file = next(xar.rglob('Resources/English.lproj/License.rtf'), None)
        if license_file is None or not license_file.stat().st_size:
            raise RuntimeError(f'No English license found in {product} package')
        shutil.copy2(license_file, licenses/f'{product}-License.rtf')
        payload = next((p for p in xar.rglob('Payload') if p.is_file()), None)
        if payload is None or not payload.stat().st_size:
            raise RuntimeError(f'No installer payload found in {product} package')
        subprocess.run(['bsdtar', '-xf', str(payload), '-C', str(payload_root)], check=True)
        fonts = payload_root/'Library/Fonts'
        if not fonts.is_dir():
            raise RuntimeError(f'No Library/Fonts in {product} payload')
        paths = font_paths(fonts)
        if not paths:
            raise RuntimeError(f'No fonts found in {product} payload')
        for path in paths:
            destination = output/product/path.name
            if destination.exists():
                raise RuntimeError(f'DMG font filename collision: {destination}')
            shutil.copy2(path, destination)
        shutil.rmtree(work)


def build_fonts(srcdir):
    global METADATA_DIR
    srcdir = srcdir.resolve()
    METADATA_DIR = srcdir/'metadata'
    work, stage, licenses = srcdir/'work', srcdir/'stage', srcdir/'apple-font-licenses'
    for directory in (work, stage, licenses):
        shutil.rmtree(directory, ignore_errors=True)
        directory.mkdir(parents=True)
    for name in ('Sequoia-System', 'Font-Book', 'Apple-Developer'):
        (stage/name).mkdir()
    extractor = compile_extractor(srcdir, work)
    archive = os.environ.get('SEQUOIA_OTA_ZIP')
    if archive and not Path(archive).is_file():
        raise RuntimeError(f'Cannot read SEQUOIA_OTA_ZIP={archive}')
    extract_system_fonts(stage/'Sequoia-System', extractor, Path(archive) if archive else None)
    refresh_metadata()
    cache_home = Path(os.environ.get('XDG_CACHE_HOME', Path.home()/'.cache'))
    cache = Path(os.environ.get('FONTCACHE', cache_home/'macos-sequoia-fonts-assets'))
    cache.mkdir(parents=True, exist_ok=True)
    download(cache)
    unpack(cache, stage/'Font-Book')
    extract_apple_dmgs(srcdir, stage/'Apple-Developer', licenses)
    filter_fonts(stage)
    deduplicate_font7(stage/'Font-Book/Font7', srcdir/'font7-dedup.tsv')
    inventory_snapshot(stage, srcdir/'source-fonts.tsv')
    organize_fonts(stage, srcdir/'font-paths.tsv', srcdir/'font7-dedup.tsv')
    inventory_check(stage, srcdir/'source-fonts.tsv', srcdir/'font-paths.tsv')
    audit_fonts(stage)
    if reference := os.environ.get('FONT_VALIDATION_OUT'):
        reference = Path(reference)
        reference.mkdir(parents=True, exist_ok=True)
        shutil.copytree(METADATA_DIR, reference/'metadata', dirs_exist_ok=True)
        for name in ('source-fonts.tsv', 'font-paths.tsv'):
            shutil.copy2(srcdir/name, reference/name)
    print(f'Final font-file count: {len(font_paths(stage))}', flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest='command', required=True)
    build_parser = commands.add_parser('build', help='Build fonts from makepkg sources')
    build_parser.add_argument('srcdir', type=Path)
    config_parser = commands.add_parser('fontconfig', help='Generate package Fontconfig rules')
    config_parser.add_argument('root', type=Path)
    config_parser.add_argument('output', type=Path)
    config_parser.add_argument('font7_report', type=Path)
    validate_parser = commands.add_parser('validate', help='Validate the installed package')
    validate_parser.add_argument('root', type=Path)
    validate_parser.add_argument('--source-reference', type=Path, required=True)
    audit_parser = commands.add_parser('audit', help='Check Apple website font coverage')
    audit_parser.add_argument('root', type=Path)
    args = parser.parse_args()
    if args.command == 'build':
        build_fonts(args.srcdir)
    elif args.command == 'fontconfig':
        generate_config(args.root, '/usr/share/fonts/macos-sequoia', args.output, args.font7_report)
    elif args.command == 'validate':
        validate_package(args.root, args.source_reference)
    else:
        audit_fonts(args.root)


if __name__ == '__main__':
    main()
