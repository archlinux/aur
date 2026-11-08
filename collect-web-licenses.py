"""Preserve upstream notices omitted by Next.js standalone file tracing."""

import json
import os
from pathlib import Path
import shutil
import sys


def collect(source, web, destination):
    source, web, destination = map(Path, (source, web, destination))
    copied = 0
    for manifest in sorted((web / 'node_modules').rglob('package.json')):
        relative = manifest.relative_to(web / 'node_modules')
        metadata = json.loads(manifest.read_text())
        candidates = (source / 'packages/web/node_modules' / relative,
                      source / 'node_modules' / relative)
        original = None
        for candidate in candidates:
            if candidate.is_file():
                other = json.loads(candidate.read_text())
                if all(metadata.get(key) == other.get(key) for key in ('name', 'version')):
                    original = candidate.parent
                    break
        if original is None:
            raise ValueError(f'Cannot locate matching upstream package for {relative}')
        for directory, children, files in os.walk(original):
            # Nested dependencies have their own manifest when they are shipped.
            children[:] = [name for name in children if name != 'node_modules']
            for name in files:
                notice = Path(directory) / name
                within = notice.relative_to(original)
                upper = name.upper()
                if not (upper.startswith(('LICENSE', 'LICENCE', 'COPYING', 'NOTICE', 'COPYRIGHT', 'README',
                                          'THIRD_PARTY', 'THIRDPARTY')) or '.LICENSE' in upper or
                        any(part.upper() in ('LICENSES', 'LICENCES', 'NOTICES') for part in within.parts[:-1])):
                    continue
                target = destination / relative.parent / within
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(notice, target)
                copied += 1
    return copied


if __name__ == '__main__':
    print(f'Preserved {collect(*sys.argv[1:])} web dependency notice files')
