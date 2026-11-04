#!/usr/bin/env python3
"""Build the pinned frontend libraries from readable upstream source archives."""
import argparse
import concurrent.futures
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess

p = argparse.ArgumentParser()
p.add_argument('source_root', type=Path)
p.add_argument('frontend', type=Path)
a = p.parse_args()
srcdir = a.source_root.resolve()
frontend = a.frontend.resolve()
manifest = json.loads((srcdir / 'frontend-sources.json').read_text())
components = {x['name']: x for x in manifest['sources']}
node_modules = frontend / 'node_modules'
work = srcdir / 'frontend-source-work'
work.mkdir(exist_ok=True)

def sha(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()

def source(item):
    archive = srcdir / item['filename']
    assert sha(archive) == item['archive_sha256']
    path = srcdir / item['archive_prefix']
    assert path.is_dir() and path.resolve().is_relative_to(srcdir)
    return path

# These two lock snapshots correct incomplete upstream development lockfiles.
# Their exact complete contents are declared, checksum-verified package inputs.
for name, lock in [('@dagrejs/dagre', 'dagre'), ('dexie', 'dexie')]:
    shutil.copyfile(srcdir / f'frontend-{lock}-package-lock.json',
                    source(components[name]) / 'package-lock.json')

# A release archive has no Git history. Supply the pinned release identity to
# upstream's normal gulp build instead of silently producing version X.Y.0.
for name in ['pdfjs-dist', 'pdfjs-dist-unpdf']:
    item = components[name]
    path = source(item) / 'gulpfile.mjs'
    text = path.read_text()
    start = text.index('function createBuildNumber(done) {')
    end = text.index('\nfunction buildDefaultPreferences(', start)
    assert 'git log --format=oneline' in text[start:end]
    value = {'version': item['version'], 'build': int(item['version'].split('.')[-1]),
             'commit': item['selected_ref'][:7]}
    replacement = ('function createBuildNumber(done) {\n'
        '  createStringSource("version.json", JSON.stringify('
        + json.dumps(value) + ', null, 2))\n'
        '    .pipe(gulp.dest(BUILD_DIR)).on("end", done);\n}\n')
    path.write_text(text[:start] + replacement + text[end:])

ci = ['npm', 'ci', '--ignore-scripts', '--no-audit', '--no-fund']
commands = {
    '@dagrejs/dagre': [ci, ['npm', 'run', 'build']],
    'dayjs': [ci, ['env', 'BABEL_ENV=build', 'node', 'build'], ['npm', 'run', 'babel']],
    'dexie': [ci, ['npm', 'run', 'build']],
    'katex': [['corepack', 'yarn', 'install', '--immutable'], ['corepack', 'yarn', 'build']],
    'roughjs': [ci, ['npm', 'run', 'build']],
    'streamdown': [['corepack', 'pnpm', 'install', '--frozen-lockfile', '--ignore-scripts'],
                   ['corepack', 'pnpm', 'build:packages']],
    'remend': [['corepack', 'pnpm', 'install', '--frozen-lockfile', '--ignore-scripts'],
               ['corepack', 'pnpm', '--filter', 'remend', 'build']],
    'pdfjs-dist': [ci, ['npx', '--no-install', 'gulp', 'generic', 'types']],
    'pdfjs-dist-unpdf': [ci, ['npx', '--no-install', 'gulp', 'generic', 'types']],
    'unpdf': [['corepack', 'pnpm', 'install', '--frozen-lockfile', '--ignore-scripts'],
              ['corepack', 'pnpm', 'build:pdfjs'], ['corepack', 'pnpm', 'build']],
}

def replace(src, dest):
    assert src.exists(), src
    if dest.is_symlink() or dest.is_file():
        dest.unlink()
    elif dest.exists():
        shutil.rmtree(dest)
    if src.is_dir():
        shutil.copytree(src, dest)
    else:
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(src, dest)


def build(name):
    item = components[name]
    path = source(item)
    env = os.environ.copy()
    env.update(npm_config_cache=str(work / 'npm' / str(item['index'])),
               npm_config_audit='false', npm_config_fund='false', CI='1',
               PUPPETEER_SKIP_DOWNLOAD='true', PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD='1',
               COREPACK_HOME=str(work / 'corepack'), COREPACK_ENABLE_DOWNLOAD_PROMPT='0',
               NODE_USE_ENV_PROXY='1')
    for key in ['http_proxy', 'https_proxy', 'no_proxy']:
        if key in env:
            env[key.upper()] = env[key]
    if name in {'katex', 'streamdown', 'unpdf', 'remend'}:
        manager = 'yarn' if name == 'katex' else 'pnpm'
        bindir = work / ('bin-' + name)
        bindir.mkdir(exist_ok=True)
        shim = bindir / manager
        shim.write_text('#!/bin/sh\nexec corepack ' + manager + ' "$@"\n')
        shim.chmod(0o755)
        env['PATH'] = str(bindir) + ':' + env['PATH']
        if name == 'katex':
            for key in ['http_proxy', 'https_proxy']:
                if key in env:
                    env['YARN_' + key.upper()] = env[key]
    for cmd in commands[name]:
        if name == 'unpdf' and cmd[-1] == 'build:pdfjs':
            dep = (path / 'node_modules/pdfjs-dist').resolve()
            assert dep.is_relative_to(path)
            pdf = source(components['pdfjs-dist-unpdf'])
            replace(pdf / 'build/generic/build', dep / 'build')
            replace(pdf / 'build/types', dep / 'types')
        subprocess.run(cmd, cwd=path, env=env, check=True)
    return name

with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:
    list(pool.map(build, [name for name in commands if name != 'unpdf']))
build('unpdf')

# Replace every copy at the exact frozen version. Keep package exports and
# dependency metadata, so the upstream application resolves its usual paths.
lock = json.loads((frontend / 'package-lock.json').read_text())['packages']
installed = {}
for rel, row in lock.items():
    if not rel.startswith('node_modules/') or row.get('link'):
        continue
    path = frontend / rel
    if not (path / 'package.json').is_file():
        continue
    metadata = json.loads((path / 'package.json').read_text())
    installed.setdefault(metadata['name'], []).append((path, metadata['version']))

records = []
def install_files(name, version, root, paths, item):
    matches = installed.get(name, [])
    assert matches, name
    for dest, actual in matches:
        assert actual == version, (name, actual, version)
        files = {}
        for rel in paths:
            replace(root / rel, dest / rel)
            target = dest / rel
            for f in sorted(target.rglob('*')) if target.is_dir() else [target]:
                if f.is_file():
                    files[str(f.relative_to(dest))] = sha(f)
        records.append({'package': name, 'version': version,
                        'node_modules_path': str(dest.relative_to(frontend)),
                        'source': item, 'files': files})

for name, paths in {
    '@dagrejs/dagre': ['dist'],
    'dayjs': ['dayjs.min.js', 'esm', 'locale', 'plugin'],
    'dexie': ['dist'],
    'katex': ['dist'],
    'roughjs': ['bundled'],
    'unpdf': ['dist'],
}.items():
    item = components[name]
    install_files(name, item['version'], source(item), paths, item)

item = components['streamdown']
for pkg in sorted((source(item) / 'packages').iterdir()):
    if not (pkg / 'package.json').is_file():
        continue
    metadata = json.loads((pkg / 'package.json').read_text())
    # The application lock overrides remend to 1.3.1. Its distinct source is
    # built below, while the original Streamdown workspace remains unmodified.
    if metadata['name'] == 'remend':
        continue
    if metadata['name'] in installed:
        paths = ['dist']
        if (pkg / 'styles.css').is_file():
            paths.append('styles.css')
        install_files(metadata['name'], metadata['version'], pkg, paths, item)

item = components['remend']
install_files('remend', item['version'], source(item) / 'packages/remend', ['dist'], item)

item = components['pdfjs-dist']
root = source(item)
for dest, version in installed.get('pdfjs-dist', []):
    assert version == item['version'], version
    files = {}
    for rel, build_rel in [('build', 'build/generic/build'), ('web', 'build/generic/web'),
                           ('types', 'build/types')]:
        replace(root / build_rel, dest / rel)
        for f in sorted((dest / rel).rglob('*')):
            if f.is_file():
                files[str(f.relative_to(dest))] = sha(f)
    records.append({'package': 'pdfjs-dist', 'version': version,
                    'node_modules_path': str(dest.relative_to(frontend)),
                    'source': item, 'files': files})

# JSZip already publishes readable source. Use that source with its browser
# stream adapter, bypassing only the minified browser bundle redirection.
item = components['jszip']
install_files('jszip', item['version'], source(item), ['lib'], item)
for dest, version in installed['jszip']:
    path = dest / 'package.json'
    metadata = json.loads(path.read_text())
    assert metadata['browser'].pop('./lib/index') == './dist/jszip.min.js'
    path.write_text(json.dumps(metadata, indent=2) + '\n')
(frontend / '.source-built-components.json').write_text(json.dumps(records, indent=2) + '\n')
