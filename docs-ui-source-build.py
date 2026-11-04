#!/usr/bin/env python3
"""Rebuild the Studio API documentation assets from the pinned source trees."""
import argparse
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('srcdir', type=Path)
parser.add_argument('project', type=Path)
a = parser.parse_args()
srcdir, project = a.srcdir.resolve(), a.project.resolve()
assets = project / 'studio/backend/assets/docs_ui'
sources = json.loads((srcdir / 'docs-ui-sources.json').read_text())['sources']


def sha(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def build(item):
    assert sha(srcdir / item['filename']) == item['archive_sha256']
    root = srcdir / item['archive_prefix']
    if item['name'] == 'swagger-ui':
        # The original lock omits Darwin-only fsevents required by its pinned
        # Chokidar/Jest development dependencies. Use the reviewed complete
        # lock, retaining every pre-existing version and source identity.
        shutil.copyfile(srcdir / 'docs-ui-swagger-package-lock.json', root / 'package-lock.json')
    metadata = json.loads((root / 'package.json').read_text())
    assert metadata['name'] == item['name'] and metadata['version'] == item['version']
    env = dict(os.environ, npm_config_cache=str(srcdir / 'docs-ui-npm-cache'),
               npm_config_audit='false', npm_config_fund='false',
               NODE_USE_ENV_PROXY='1', CI='1', HUSKY='0')
    # A source archive must never inherit the enclosing AUR repository's HEAD.
    env['GIT_CEILING_DIRECTORIES'] = str(srcdir)
    # The lock already pins the workerize-loader Git commit. Use HTTPS for
    # its ordinary public Git transport, without adding authentication.
    env.update(GIT_CONFIG_COUNT='2',
               GIT_CONFIG_KEY_0='url.https://github.com/.insteadOf',
               GIT_CONFIG_VALUE_0='ssh://git@github.com/',
               GIT_CONFIG_KEY_1='url.https://github.com/.insteadOf',
               GIT_CONFIG_VALUE_1='git@github.com:')
    commands = []

    def run(command, label):
        with (root / ('packaging-' + label + '.log')).open('w') as log:
            result = subprocess.run(command, cwd=root, env=env,
                                    stdout=log, stderr=subprocess.STDOUT)
        commands.append({'command': command, 'returncode': result.returncode})
        (root / 'packaging-commands.json').write_text(json.dumps(commands, indent=2) + '\n')
        result.check_returncode()

    install = ['npm', 'ci', '--ignore-scripts', '--no-audit', '--no-fund']
    if item['name'] == 'redoc':
        # npm 12 defaults to rejecting Git dependencies. This direct build
        # dependency is already fixed to an exact commit by the upstream lock.
        install.append('--allow-git=root')
    run(install, 'npm-ci')
    plugin = srcdir / 'docs-ui-webpack-inventory.cjs'
    if item['name'] == 'swagger-ui':
        shutil.rmtree(root / 'dist')
        for label in ['stylesheets', 'bundle']:
            config = root / 'webpack' / (label + '.js')
            addition = ('\nmodule.exports.plugins.push(new (require('
                        + json.dumps(str(plugin)) + '))('
                        + json.dumps(str(root / ('packaging-' + label + '-modules.json')))
                        + '));\n')
            with config.open('a') as stream:
                stream.write(addition)
        run(['npm', 'run', 'build-stylesheets'], 'stylesheets')
        run(['npm', 'run', 'build:bundle'], 'bundle')
        outputs = {'swagger-ui-bundle.js': root / 'dist/swagger-ui-bundle.js',
                   'swagger-ui.css': root / 'dist/swagger-ui.css',
                   'swagger-ui-bundle.js.LICENSE.txt': root / 'dist/swagger-ui-bundle.js.LICENSE.txt'}
        licenses = {'LICENSE.swagger-ui': root / 'LICENSE',
                    'NOTICE.swagger-ui': root / 'NOTICE'}
    else:
        shutil.rmtree(root / 'bundles', ignore_errors=True)
        config = root / 'webpack.config.ts'
        text = config.read_text()
        old = '  ].filter(Boolean),'
        assert text.count(old) == 1
        new = ('  ].filter(Boolean).concat(new (require(' + json.dumps(str(plugin))
               + '))(' + json.dumps(str(root / 'packaging-bundle-modules.json')) + ')),')
        config.write_text(text.replace(old, new))
        run(['npm', 'run', 'bundle:standalone'], 'bundle')
        outputs = {'redoc.standalone.js': root / 'bundles/redoc.standalone.js',
                   'redoc.standalone.js.LICENSE.txt': root / 'bundles/redoc.standalone.js.LICENSE.txt'}
        licenses = {'LICENSE.redoc': root / 'LICENSE'}
    records = {}
    for name, path in {**outputs, **licenses}.items():
        assert path.is_file() and path.stat().st_size > 0
        shutil.copyfile(path, assets / name)
        records[name] = {'sha256': sha(path), 'bytes': path.stat().st_size}
    return {'source': item, 'outputs': records, 'commands': commands,
            'lock_sha256': sha(root / 'package-lock.json')}


with ThreadPoolExecutor(max_workers=2) as executor:
    results = list(executor.map(build, sources))

manifest_path = assets / 'docs_ui_manifest.json'
manifest = json.loads(manifest_path.read_text())
manifest['files'] = {p.name: sha(p) for p in sorted(assets.iterdir())
                     if p.is_file() and p.name not in {'README.md', 'docs_ui_manifest.json'}}
for package in manifest['packages']:
    item = next(x for x in sources if x['name'] == package['package'].removesuffix('-dist'))
    assert package['version'] == item['version']
    package['source'] = item['archive_url']
    package['source_commit'] = item['commit']
manifest_path.write_text(json.dumps(manifest, indent=2) + '\n')
(project / 'docs-ui-source-build.json').write_text(json.dumps(results, indent=2) + '\n')
readme = assets / 'README.md'
text = readme.read_text()
old = 'The bytes are the published releases, unmodified, so they carry no Unsloth licence header.'
assert old in text
readme.write_text(text.replace(old, 'The JavaScript and CSS are rebuilt from the pinned upstream source commits in '
                              '`docs_ui_manifest.json`. Original upstream notices are retained.'))
print('DOCS_UI_PREFERRED_SOURCE_BUILD_PASS')
