# SPDX-License-Identifier: 0BSD
"""Retain original notices for bundled client modules and generated CSS."""
import hashlib
import json
from pathlib import Path
import re
import shutil

root = Path.cwd()
inventory = json.loads(Path('.runtime-modules.json').read_text())
lock = json.loads(Path('package-lock.json').read_text())['packages']
assert inventory['ssr'] is False and inventory['packages']
paths = {item['path'] for item in inventory['packages']}
paths.update(inventory['css_packages'])
output = Path('build/third-party-licenses')
records = []
for relative in sorted(paths):
    package = Path(relative)
    assert package.parts[0] == 'node_modules' and '..' not in package.parts
    assert package.resolve().is_relative_to(root / 'node_modules')
    metadata = json.loads((package / 'package.json').read_text())
    source = lock[relative]
    assert metadata['version'] == source['version']
    assert source['resolved'].startswith('https://registry.npmjs.org/')
    notices = sorted(p for p in package.iterdir() if p.is_file()
                     and re.match(r'^(licen[cs]e|copying|notice)([.-]|$)', p.name, re.I))
    assert notices, f'Missing original license notice: {relative}'
    destination = output / relative
    destination.mkdir(parents=True)
    hashes = {}
    for notice in notices:
        shutil.copyfile(notice, destination / notice.name)
        hashes[notice.name] = hashlib.sha256(notice.read_bytes()).hexdigest()
    records.append(dict(name=metadata['name'], version=metadata['version'],
                        license=metadata.get('license'), path=relative,
                        source=source['resolved'], integrity=source['integrity'],
                        notices=hashes))
(output / 'manifest.json').write_text(json.dumps(records, indent=2) + '\n')
