#!/usr/bin/env python3
"""Install exact matching WebKit helpers into a package staging root.

Metadata is pinned from Ubuntu's signed package indexes. The released library
must match the selected package byte-for-byte before any files are installed.
"""

import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import tempfile


def digest(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def install(bundle, deb, root, metadata, arch):
    source = json.loads(metadata.read_text())[arch]
    library = bundle / 'lib/libwebkit2gtk-4.1.so.0'
    if root.resolve() in (Path('/'), Path('/usr')):
        raise ValueError('Use a package staging root, not the live system')
    if digest(deb) != source['sha256']:
        raise ValueError('WebKit package checksum mismatch')
    if digest(library) != source['library_sha256']:
        raise ValueError('Release WebKit library does not match the pinned helper package')
    triplet = source['triplet']
    relative = Path('usr/lib') / triplet
    helper = relative / 'webkit2gtk-4.1'
    copyright = Path('usr/share/doc/libwebkit2gtk-4.1-0/copyright')
    with tempfile.TemporaryDirectory(prefix='pleazyng-webkit-') as temporary:
        temp = Path(temporary)
        archive = temp / 'data.tar.zst'
        with archive.open('wb') as stream:
            subprocess.run(['ar', 'p', str(deb.resolve()), 'data.tar.zst'], stdout=stream, check=True)
        subprocess.run(['tar', '--zstd', '--no-same-owner', '--wildcards', '-xf', str(archive), '-C', str(temp),
                        './' + str(helper), './' + str(relative / 'libwebkit2gtk-4.1.so.0.*'),
                        './' + str(copyright)], check=True)
        # Soname target spelling is not an ABI assumption: identify the single
        # library and verify its exact digest against both inputs.
        libraries = list((temp / relative).glob('libwebkit2gtk-4.1.so.0.*'))
        if len(libraries) != 1 or digest(libraries[0]) != source['library_sha256']:
            raise ValueError('Helper package library identity mismatch')
        for name in ('WebKitWebProcess', 'WebKitNetworkProcess', 'WebKitGPUProcess',
                     'injected-bundle/libwebkit2gtkinjectedbundle.so'):
            if not (temp / helper / name).is_file():
                raise ValueError(f'Missing WebKit component: {name}')
        shutil.copytree(temp / helper, root / helper, dirs_exist_ok=True)
        license_path = root / 'usr/share/licenses/pleazyng/webkit-copyright'
        license_path.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(temp / copyright, license_path)
    receipt = dict(source, architecture=arch)
    receipt['installed_files'] = {
        str(path.relative_to(root)): digest(path)
        for path in sorted((root / helper).rglob('*')) if path.is_file()
    }
    path = root / 'usr/share/pleazyng/webkit-runtime.json'
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(receipt, indent=2) + '\n')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--bundle', required=True, type=Path)
    parser.add_argument('--deb', required=True, type=Path)
    parser.add_argument('--root', required=True, type=Path)
    parser.add_argument('--arch', required=True, choices=['x64', 'arm64'])
    parser.add_argument('--metadata', type=Path, default=Path(__file__).with_name('webkit-runtime.json'))
    args = parser.parse_args()
    install(args.bundle, args.deb, args.root, args.metadata, args.arch)
