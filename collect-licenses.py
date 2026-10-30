#!/usr/bin/env python3
"""Package exact locked crate sources and their supplied notices, without network."""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import shutil
import tarfile
import tomllib


def collect(metadata, lock, cargo_home, notices, sources):
    locked = {(p['name'], p['version']): p for p in lock['package']}
    inventory = []
    for package in sorted(metadata['packages'], key=lambda p: (p['name'], p['version'])):
        if package['source'] is None:  # Pivra's source archive is packaged separately.
            continue
        if not package['source'].startswith('registry+'):
            raise ValueError('Unreviewed non-registry dependency: ' + package['id'])
        key = (package['name'], package['version'])
        checksum = locked[key].get('checksum')
        if not checksum or not package.get('license'):
            raise ValueError('Missing locked checksum/license: ' + package['id'])
        stem = '-'.join(key)
        archives = list((cargo_home / 'registry' / 'cache').glob('*/' + stem + '.crate'))
        matches = [p for p in archives if hashlib.sha256(p.read_bytes()).hexdigest() == checksum]
        if not matches:
            raise ValueError('No checksum-matched source archive: ' + stem)
        archive = matches[0]
        dest = notices / stem
        dest.mkdir(parents=True, exist_ok=False)
        included = []
        with tarfile.open(archive) as upstream:
            for member in upstream.getmembers():
                path = PurePosixPath(member.name)
                if path.is_absolute() or '..' in path.parts or not path.parts or path.parts[0] != stem:
                    raise ValueError('Unsafe archive name: ' + member.name)
                if not member.isfile():
                    continue  # Never follow source-archive links while extracting notices.
                name = path.name.lower()
                if not (name.startswith(('license', 'licence', 'copying', 'notice', 'copyright', 'authors'))
                        or name in ('cargo.toml', 'cargo.toml.orig', 'readme', 'readme.md')):
                    continue
                if member.size > 4 * 1024 * 1024:
                    raise ValueError('Oversized notice: ' + member.name)
                relative = Path(*path.parts[1:])
                target = dest / relative
                target.parent.mkdir(parents=True, exist_ok=True)
                stream = upstream.extractfile(member)
                if stream is None:
                    raise ValueError('Unreadable notice: ' + member.name)
                target.write_bytes(stream.read())
                target.chmod(0o644)
                included.append(str(relative))
        # Complete archive preserves inline copyright/terms, not just named LICENSEs.
        sources.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(archive, sources / archive.name)
        (sources / archive.name).chmod(0o644)
        inventory.append({'name': key[0], 'version': key[1], 'license': package['license'],
                          'registry': package['source'], 'sha256': checksum,
                          'source_archive': archive.name, 'notice_files': included})
    expected = {key for key, p in locked.items() if p.get('source', '').startswith('registry+')}
    actual = {(p['name'], p['version']) for p in inventory}
    if actual != expected:
        raise ValueError('Metadata does not cover the entire locked registry graph')
    notices.mkdir(parents=True, exist_ok=True)
    output = notices / 'inventory.json'
    output.write_text(json.dumps(inventory, indent=2) + '\n')
    output.chmod(0o644)
    return len(inventory)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for key in ('metadata', 'lock', 'cargo-home', 'notices', 'sources'):
        parser.add_argument('--' + key, required=True, type=Path)
    args = parser.parse_args()
    count = collect(json.loads(args.metadata.read_text()), tomllib.loads(args.lock.read_text()),
                    args.cargo_home, args.notices, args.sources)
    print(f'Packaged {count} checksum-verified locked crate sources and notices')


if __name__ == '__main__':
    main()
