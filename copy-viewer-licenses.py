# SPDX-License-Identifier: 0BSD
"""Retain notices for modules actually emitted into the viewer client."""
from pathlib import Path
import hashlib
import json
import re
import shutil
import sys

source = Path(sys.argv[1])
root = Path('q2view')
lock = json.loads((root / 'package-lock.json').read_text())['packages']
inventory = json.loads((root / '.runtime-modules.json').read_text())
assert inventory['ssr'] is False
assert inventory['output_directory'] == '.svelte-kit/output/client'
assert inventory['css_packages'] == ['node_modules/tailwindcss']
assert '@tailwind utilities;' in (root / 'src/app.css').read_text()
packages = {item['path']: item for item in inventory['packages']}
assert packages and all(item['modules'] for item in packages.values())
assert 'lib/index.js' in packages['node_modules/jszip']['modules']
assert not any(path.startswith('dist/') for path in packages['node_modules/jszip']['modules'])
packages['node_modules/tailwindcss'] = {'name': 'tailwindcss', 'version': lock['node_modules/tailwindcss']['version'], 'modules': ['CSS generated from src/app.css']}
output = Path('rachis_cli/assets/view/third-party-licenses')
output.mkdir(parents=True, exist_ok=True)
fallbacks = {'@citation-js/date': '0.5.1', '@citation-js/name': '0.4.2'}
index = []
for relative, item in sorted(packages.items()):
    assert relative.startswith('node_modules/') and '..' not in Path(relative).parts, relative
    package = root / relative
    assert package.resolve().is_relative_to((root / 'node_modules').resolve())
    metadata = json.loads((package / 'package.json').read_text())
    assert metadata['name'] == item['name'] and metadata['version'] == item['version']
    assert lock[relative]['version'] == item['version']
    destination = output / relative.removeprefix('node_modules/').replace('/', '__')
    destination.mkdir(exist_ok=True)
    shutil.copyfile(package / 'package.json', destination / 'package.json')
    notices = sorted(path for path in package.iterdir() if path.is_file()
                     and re.fullmatch(r'(licen[cs]e|copying|notice)(\.(txt|md|markdown))?', path.name, re.I))
    if metadata['name'] in fallbacks:
        assert metadata['version'] == fallbacks[metadata['name']]
        assert metadata['license'] == 'MIT' and metadata['author'] == 'Lars Willighagen'
        assert not notices
        shutil.copyfile(package / 'README.md', destination / 'README.md')
        shutil.copyfile(source / 'MIT.txt', destination / 'MIT-standard-text.txt')
        (destination / 'NOTICE.txt').write_text(
            'Upstream package.json declares the MIT license and names Lars Willighagen as author.\n'
            'Upstream supplies no separate copyright or license text. The original package.json\n'
            'and README are preserved here. MIT-standard-text.txt is the unmodified SPDX MIT\n'
            'template provided for reference, not an upstream copyright statement.\n')
    else:
        # isarray embeds its full original MIT grant in its README.
        if not notices and metadata['name'] == 'isarray' and metadata['version'] == '1.0.0':
            notices = [package / 'README.md']
            assert 'Permission is hereby granted' in notices[0].read_text()
        assert notices, ('Missing upstream notice', relative)
        for notice in notices:
            shutil.copyfile(notice, destination / notice.name)
    if metadata['name'] == 'pako':
        # The zlib-derived files retain additional original notices in source.
        shutil.copytree(package / 'lib/zlib', destination / 'zlib-source', dirs_exist_ok=True)
    if metadata['name'] == '@citation-js/plugin-csl':
        for name in ('locales.json', 'styles.json'):
            shutil.copyfile(package / 'lib-mjs' / name, destination / name)
        shutil.copyfile(source / 'CC-BY-SA-3.0.txt', destination / 'CC-BY-SA-3.0.txt')
    if metadata['name'] == 'citeproc':
        assert metadata['version'] == '2.4.63'
        grant = (package / 'LICENSE').read_text()
        assert '3 of the AGPL, or (at your option) any later version' in grant
        shutil.copyfile(source / 'AGPL-3.0-or-later.txt', destination / 'AGPL-3.0-or-later.txt')
        archive = source / 'citeproc-73bc1b44bc7d54d0bfec4e070fd27f5efe024ff9.tar.gz'
        assert hashlib.sha256(archive.read_bytes()).hexdigest() == 'da00c73384be59e634dbbab912345f0199fae2913f501aa9d08eef7ee1d8abd4'
        shutil.copyfile(archive, destination / 'corresponding-source.tar.gz')
        (destination / 'NOTICE.txt').write_text(
            'Distributed under the AGPL version 3 or later option in the unmodified upstream LICENSE.\n'
            'corresponding-source.tar.gz is the exact preferred-source archive at upstream commit\n'
            '73bc1b44bc7d54d0bfec4e070fd27f5efe024ff9, including src, build configuration and full terms.\n')
    index.append(dict(item, path=relative, resolved=lock[relative]['resolved'], integrity=lock[relative]['integrity'],
                      notices=[{'file': str(p.relative_to(output)), 'sha256': hashlib.sha256(p.read_bytes()).hexdigest()}
                               for p in sorted(destination.rglob('*')) if p.is_file()]))
(output / 'runtime-sources.json').write_text(json.dumps(index, indent=2) + '\n')
shutil.copyfile(root / 'package-lock.json', output / 'package-lock.json')
print('Preserved viewer runtime notices for', len(index), 'locked packages')
