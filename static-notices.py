# SPDX-License-Identifier: 0BSD
"""Keep original notices with exported static assets and record source identity."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sources, assets = map(Path, sys.argv[1:])
components = [
    ('bootstrap', '3.3.7', 'twbs/bootstrap',
     '0b9c4a4007c44201dce9a6cc1a38407005c26c86',
     ['LICENSE', 'docs/_includes/components/glyphicons.html',
      'less/mixins/hide-text.less', 'less/print.less']),
    ('normalize.css', '3.0.3', 'necolas/normalize.css',
     '2bdda84272650aedfb45d8abe11a6d177933a803', ['LICENSE.md']),
    ('normalize.css', '5.0.0', 'necolas/normalize.css',
     'f06565fe8e0e1ad1b88f2732719e28ed97bde40f', ['LICENSE.md']),
    ('jquery', '3.2.0', 'jquery/jquery',
     '63e5d534d1ebdb84ee99365c70a7521a86b4ee76', ['LICENSE.txt']),
    ('sizzle', '2.3.3', 'jquery/sizzle',
     '1fb882d7076593de74686f5656393869b44b6a66', ['LICENSE.txt']),
    ('html5-boilerplate', None, 'h5bp/html5-boilerplate',
     'aa0396eae757c9e03dda4e463fb0d4db5a5f82d7', ['readme.md']),
]
output = assets / 'third-party-licenses'
records = []
for name, version, repository, commit, notices in components:
    source = sources / f'{name}-{commit}'
    destination = output / f'{name}-{version or commit}'
    hashes = {}
    for notice in notices:
        path = destination / notice
        path.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source / notice, path)
        hashes[notice] = hashlib.sha256(path.read_bytes()).hexdigest()
    records.append(dict(name=name, version=version, commit=commit,
                        source=f'https://github.com/{repository}/tree/{commit}',
                        path=destination.name, notices=hashes))
assets_hashes = {str(path.relative_to(assets)): hashlib.sha256(path.read_bytes()).hexdigest()
                for directory in ('css', 'js', 'fonts')
                for path in sorted((assets / directory).iterdir()) if path.is_file()}
(output / 'manifest.json').write_text(json.dumps(dict(
    components=records, assets=assets_hashes,
    scope='Bootstrap and jQuery JavaScript and Bootstrap CSS rebuilt from pinned '
          'readable sources. Original normalize 5 CSS and Glyphicons font resources '
          'retained. HTML5 Boilerplate attribution follows the exact commit cited '
          'by Bootstrap hide-text.less.'), indent=2) + '\n')
