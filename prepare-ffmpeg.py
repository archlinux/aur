#!/usr/bin/env python3
"""Stage makepkg's declared archive, preserving upstream's integrity gates."""
import hashlib
import json
from pathlib import Path
import shutil
import sys
import tarfile

root, archive = (Path(p).resolve() for p in sys.argv[1:])
manifest = json.loads((root / 'tools/ffmpeg_manifest_linux.json').read_text())
source = manifest['source']
if archive.name != source['asset'] or hashlib.file_digest(archive.open('rb'), 'sha256').hexdigest() != source['sha256']:
    raise SystemExit('Upstream FFmpeg pin changed: review and update the declared source first.')
destination = root / 'FTHRcapture_linux/third_party/ffmpeg'
shutil.rmtree(destination, ignore_errors=True)
destination.mkdir(parents=True)
with tarfile.open(archive) as tar:
    prefix = archive.name.removesuffix('.tar.xz') + '/'
    for member in tar:
        if member.isdir() and member.name == prefix.rstrip('/'):
            continue
        if not member.name.startswith(prefix):
            raise SystemExit(f'Unexpected archive root: {member.name}')
        member.name = member.name[len(prefix):]
        if not member.name or member.name.split('/')[0] not in {'bin', 'include', 'lib', 'LICENSE.txt'}:
            continue
        if member.mode & 0o6000:
            raise SystemExit('Privileged permissions in FFmpeg archive')
        tar.extract(member, destination, filter='data')

lib = destination / 'lib'
for name, digest in manifest['shipped_files_sha256'].items():
    if hashlib.file_digest((lib / name).open('rb'), 'sha256').hexdigest() != digest:
        raise SystemExit(f'Upstream FFmpeg library checksum mismatch: {name}')
sys.path.insert(0, str(root / 'tools'))
from fetch_third_party import _ensure_linux_ffmpeg_aliases
_ensure_linux_ffmpeg_aliases(lib, manifest['soname_map'])

# BtbN's pkg-config prefix is a cross-build path. Rewrite only that metadata;
# the checksummed runtime library bytes remain unchanged.
for pc in (lib / 'pkgconfig').glob('*.pc'):
    lines = pc.read_text().splitlines()
    if not any(line.startswith('prefix=') for line in lines):
        raise SystemExit(f'Missing pkg-config prefix: {pc}')
    pc.write_text('\n'.join(f'prefix={destination}' if line.startswith('prefix=') else line
                            for line in lines) + '\n')
print(f'Verified and staged pinned LGPL FFmpeg: {manifest["version"]}')
