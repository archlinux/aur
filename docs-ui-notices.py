#!/usr/bin/env python3
"""Retain upstream notices for the source-built Swagger UI and ReDoc assets."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil

parser = argparse.ArgumentParser()
parser.add_argument('frontend', type=Path)
parser.add_argument('source_root', type=Path)
a = parser.parse_args()
frontend = a.frontend.resolve()
srcdir = a.source_root.resolve()
components = json.loads((srcdir / 'docs-ui-sources.json').read_text())['sources']
inventories = []
for item in components:
    root = srcdir / item['archive_prefix']
    for path in sorted(root.glob('packaging-*-modules.json')):
        inventories.append((path, json.loads(path.read_text())))
assert len(inventories) == 3
extra = json.loads((srcdir / 'docs-ui-notice-sources.json').read_text())
output = frontend / 'dist/third-party-notices/docs-ui'
output.mkdir(parents=True, exist_ok=True)
notice_name = re.compile(r'(?i)(?:^|[._-])(licen[sc]es?|copying|notices?|copyrights?|legal|third.?party|authors|ofl|ufl)(?:$|[._-])')
full_grant = re.compile(r'(?i)permission is hereby granted|redistribution and use in source')
comment = re.compile(r'/\*.*?\*/|(?:^[ \t]*//[^\n]*(?:\n|$))+', re.S | re.M)
embedded_grant = re.compile(r'(?i)copyright|permission is hereby granted|redistribution and use in source|SPDX-License-Identifier')


def sha(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def notice_files(root):
    for directory, dirs, files in os.walk(root):
        dirs[:] = [n for n in dirs if n not in {'node_modules', '.git'}]
        for name in files:
            path = Path(directory) / name
            if path.is_symlink():
                assert path.resolve().is_relative_to(srcdir)
            if any(notice_name.search(part) for part in path.relative_to(root).parts):
                yield path
            elif name.lower().startswith('readme') and path.stat().st_size < 200000:
                if full_grant.search(path.read_text(errors='replace')):
                    yield path


def retain_embedded_notices(root, dest):
    found = {}
    for directory, dirs, files in os.walk(root):
        dirs[:] = [n for n in dirs if n not in {'node_modules', '.git'}]
        for name in files:
            path = Path(directory) / name
            if path.suffix not in {'.js', '.mjs', '.cjs', '.ts', '.tsx', '.css', '.scss'}:
                continue
            assert path.resolve().is_relative_to(srcdir)
            text = path.read_text(errors='replace')
            for block in comment.findall(text):
                if not embedded_grant.search(block):
                    continue
                raw = block.encode()
                digest = hashlib.sha256(raw).hexdigest()
                entry = found.setdefault(digest, {'sha256': digest, 'sources': []})
                entry['sources'].append({'path': str(path.relative_to(root)), 'sha256': sha(path)})
                target = dest / 'embedded-notices' / (digest + '.txt')
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(raw)
                entry['path'] = str(target.relative_to(output))
    return list(found.values())


packages = {}
modules = {row['resource'].split('?')[0] for _, inventory in inventories
           for chunk in inventory['chunks'] for row in chunk['modules']}
for name in sorted(modules):
    path = Path(name)
    assert path.resolve().is_relative_to(srcdir), name
    if 'node_modules' not in path.parts or not path.is_file():
        continue
    root = path.parent
    while root != srcdir:
        candidate = root / 'package.json'
        if candidate.is_file():
            metadata = json.loads(candidate.read_text())
            if metadata.get('name') and metadata.get('version'):
                break
        root = root.parent
    assert root != srcdir, name
    packages.setdefault(root, []).append(str(path.relative_to(root)))

def retain_package(root, dest_name, module_names, context):
    metadata = json.loads((root / 'package.json').read_text())
    name, version = metadata['name'], metadata['version']
    dest = output / dest_name
    dest.mkdir()
    shutil.copyfile(root / 'package.json', dest / 'package-metadata.json')
    for readme in root.glob('*'):
        if readme.is_file() and readme.name.lower().startswith('readme'):
            shutil.copyfile(readme, dest / readme.name)
    files = []
    for original in sorted(notice_files(root)):
        rel = original.relative_to(root)
        target = dest / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(original, target)
        files.append({'source': str(original.relative_to(srcdir)),
                      'path': str(target.relative_to(output)), 'sha256': sha(target)})
    additions = [x for x in extra['sources'] if name in x['packages']
                 and version in x['packages'][name]]
    for item in additions:
        original = srcdir / item['filename']
        assert sha(original) == item['sha256']
        if 'declared_license' in item:
            assert metadata.get('license') == item['declared_license']
        if 'package_metadata_sha256' in item:
            assert sha(root / 'package.json') == item['package_metadata_sha256'][name]
        prefix = 'standard-terms-' if item['role'] == 'standard_license_template' else 'upstream-'
        target = dest / (prefix + item['filename'])
        shutil.copyfile(original, target)
        files.append({'source_url': item['url'], 'path': str(target.relative_to(output)),
                      'sha256': sha(target), 'scope': item['scope'], 'role': item['role']})
    assert files, ('Missing original notice or explicit source review', name, version)
    return {'name': name, 'version': version,
                    'package_path': str(root.relative_to(srcdir)), 'context': context,
                    'license': metadata.get('license'), 'modules': module_names,
                    'metadata_sha256': sha(dest / 'package-metadata.json'), 'notices': files,
                    'embedded_notices': retain_embedded_notices(root, dest)}


records = []
for index, (root, module_names) in enumerate(sorted(packages.items())):
    records.append(retain_package(root, 'emitted-' + str(index), module_names,
                                  'actual source-built documentation bundle module'))

# Keep the complete original notice sets of rebuilt source components as well.
# This covers nested copyright/font notices that are absent from npm tarballs.
component_notices = []
for item in components:
    root = srcdir / item['archive_prefix']
    dest = output / ('source-component-' + str(item['index']))
    files = []
    for original in sorted(notice_files(root)):
        target = dest / original.relative_to(root)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(original, target)
        files.append({'source': str(original.relative_to(root)),
                      'path': str(target.relative_to(output)), 'sha256': sha(target)})
    assert files, item['name']
    component_notices.append({'source': item, 'notices': files,
                              'embedded_notices': retain_embedded_notices(root, dest)})

# A component's own bundler may already have combined its dependencies before
# Vite reads the rebuilt output. Preserve its runtime dependency notices too.
# This is a conservative dependency closure, not a claim that every listed
# dependency contributed code to the final browser bundle.
dependency_notices = []
seen = set()


def resolve_dependency(root, name):
    for ancestor in [root, *root.parents]:
        if not ancestor.is_relative_to(srcdir):
            break
        candidate = ancestor / 'node_modules' / name
        if (candidate / 'package.json').is_file():
            result = candidate.resolve()
            assert result.is_relative_to(srcdir)
            return result
    candidate = frontend / 'node_modules' / name
    assert (candidate / 'package.json').is_file(), (root, name)
    assert candidate.resolve().is_relative_to(srcdir)
    return candidate.resolve()


def dependency_closure(root, component):
    metadata = json.loads((root / 'package.json').read_text())
    for name in metadata.get('dependencies', {}):
        child = resolve_dependency(root, name)
        if child in seen:
            continue
        seen.add(child)
        # Workspace packages share the complete source-component license set.
        if 'node_modules' not in child.relative_to(srcdir).parts:
            dependency_closure(child, component)
            continue
        dependency_notices.append(retain_package(
            child, 'component-dependency-' + str(len(dependency_notices)), [],
            {'runtime_dependency_of': component, 'consumer': metadata['name']}))
        dependency_closure(child, component)


for item in components:
    dependency_closure(srcdir / item['archive_prefix'], item['name'])

result = {'emitted_packages': records, 'source_component_notices': component_notices,
          'source_component_runtime_dependency_notices': dependency_notices,
          'webpack_inventories': [{'source': str(path.relative_to(srcdir)), 'sha256': sha(path)}
                                  for path, _ in inventories],
          'source_build_mapping_sha256': sha(frontend.parent.parent / 'docs-ui-source-build.json')}
(output / 'runtime-sources.json').write_text(json.dumps(result, indent=2) + '\n')
shutil.copyfile(frontend.parent.parent / 'docs-ui-source-build.json', output / 'source-built-components.json')
print('DOCS_UI_BUNDLED_ORIGINAL_NOTICES_PASS', len(records))
