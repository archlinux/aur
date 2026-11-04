#!/usr/bin/env python3
"""Build the pinned native OXC modules used by Studio, without npm binaries."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tarfile
import tomllib

parser = argparse.ArgumentParser()
parser.add_argument('srcdir', type=Path)
parser.add_argument('project', type=Path)
args = parser.parse_args()
srcdir, project = args.srcdir.resolve(), args.project.resolve()
manifest = json.loads((srcdir / 'oxc-sources.json').read_text())
notice_manifest = json.loads((srcdir / 'oxc-notices.json').read_text())
tool = project / 'studio/backend/core/data_recipe/oxc-validator'
runtime = tool / 'node_modules'
notice_root = tool / 'third-party-notices/oxc'
report_path = project / 'oxc-source-build.json'
report = {'sources': manifest['sources'], 'packages': [], 'commands': [],
          'bundled_js_packages': [], 'conservative_rust_source_notices': []}


def sha(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def save_report():
    report_path.write_text(json.dumps(report, indent=2) + '\n')


env = dict(os.environ, NODE_USE_ENV_PROXY='1', CI='1', HUSKY='0',
           COREPACK_HOME=str(srcdir / 'oxc-corepack-cache'),
           COREPACK_ENABLE_DOWNLOAD_PROMPT='0',
           CARGO_HOME=str(srcdir / 'oxc-cargo-cache'),
           CARGO_NET_OFFLINE='true',
           CARGO_TERM_COLOR='never',
           CARGO_TARGET_DIR=str(srcdir / 'oxc-cargo-target'),
           npm_config_store_dir=str(srcdir / 'oxc-pnpm-store'),
           npm_config_enable_pre_post_scripts='true',
           GIT_CEILING_DIRECTORIES=str(srcdir))
shim = srcdir / 'oxc-tool-bin'
shim.mkdir(exist_ok=True)
env['PATH'] = str(shim) + os.pathsep + env['PATH']
env.pop('NODE_PATH', None)


def run(command, cwd, label):
    logfile = srcdir / ('oxc-' + label + '.log')
    with logfile.open('w') as log:
        result = subprocess.run(command, cwd=cwd, env=env,
                                stdout=log, stderr=subprocess.STDOUT)
    report['commands'].append({'command': command, 'cwd': str(cwd),
                               'returncode': result.returncode,
                               'log': str(logfile.relative_to(srcdir)),
                               'log_sha256': sha(logfile)})
    save_report()
    result.check_returncode()


for generated in [runtime, notice_root]:
    # These two directories are generated exclusively by this source builder.
    # Never follow a replaced directory or escape the extracted project.
    assert not generated.is_symlink() and generated.resolve().is_relative_to(project)
    existed = generated.exists()
    if existed:
        assert generated.is_dir()
        shutil.rmtree(generated)
    generated.mkdir(parents=True)
    assert not any(generated.iterdir())
    report.setdefault('generated_directories', []).append({
        'path': str(generated.relative_to(project)),
        'previous_directory_removed': existed, 'initial_empty': True})
# Only this builder's confined target directory may be discarded on a retry.
# A clean target makes the three build logs a complete compilation inventory.
target = srcdir / 'oxc-cargo-target'
assert not target.is_symlink() and target.parent.resolve() == srcdir
target_existed = target.exists()
if target_existed:
    assert target.is_dir()
    shutil.rmtree(target)
target.mkdir()
assert not any(target.iterdir())
report['cargo_target'] = {'path': target.name, 'previous_directory_removed': target_existed,
                          'initial_empty': True}
run(['corepack', 'enable', '--install-directory', str(shim), 'pnpm'], srcdir, 'corepack')

roots = {}
for source in manifest['sources']:
    assert sha(srcdir / source['filename']) == source['archive_sha256']
    root = srcdir / source['archive_prefix']
    roots[source['index']] = root
    assert sha(root / 'Cargo.lock') == source['cargo_lock_sha256']
    assert sha(root / 'pnpm-lock.yaml') == source['pnpm_lock_sha256']
    assert sha(root / 'LICENSE') == source['license_sha256']
    assert json.loads((root / 'package.json').read_text())['packageManager'] == 'pnpm@' + source['pnpm_version']
    for component in source['components']:
        assert sha(root / component['path'] / 'package.json') == component['metadata_sha256']
    filters = ['oxc-parser...', 'oxc-transform...'] if source['index'] == 0 else ['oxlint-app...']
    command = ['corepack', 'pnpm']
    for name in filters:
        command += ['--filter', name]
    command += ['install', '--frozen-lockfile', '--ignore-scripts']
    run(command, root, str(source['index']) + '-install')
    assert sha(root / 'pnpm-lock.yaml') == source['pnpm_lock_sha256']

# The added bundler plugin only records modules actually emitted into the main
# oxlint runtime. The original optimization and native-binding behavior remain.
oxlint_root = roots[1] / 'apps/oxlint'
config = oxlint_root / 'tsdown.config.ts'
source = next(x for x in manifest['sources'] if x['index'] == 1)
with tarfile.open(srcdir / source['filename']) as archive:
    member = archive.getmember(source['archive_prefix'] + '/apps/oxlint/tsdown.config.ts')
    assert member.isfile()
    original_config = archive.extractfile(member).read()
text = original_config.decode()
old = 'const plugins = [inlineSearchPlugin, replaceGlobalsPlugin];'
assert text.count(old) == 1
inventory_file = oxlint_root / 'packaging-runtime-modules.json'
plugin = '''{
  name: "packaging-runtime-inventory",
  generateBundle(_options, bundle) {
    const chunks = Object.values(bundle).filter(x => x.type === "chunk").map(x => ({
      file: x.fileName,
      modules: Object.entries(x.modules).filter(([, m]) => m.renderedLength > 0)
        .map(([id, m]) => ({id, renderedLength: m.renderedLength}))
    }));
    packagingWriteFile(INVENTORY, JSON.stringify({chunks}, null, 2) + "\\n");
  }
}'''.replace('INVENTORY', json.dumps(str(inventory_file)))
instrumented_config = ('import {writeFileSync as packagingWriteFile} from "node:fs";\n' +
    text.replace(old, 'const plugins = [inlineSearchPlugin, replaceGlobalsPlugin, ' + plugin + '];')).encode()
assert config.read_bytes() in [original_config, instrumented_config]
config.write_bytes(instrumented_config)


def copy_file(source, destination):
    assert source.is_file() and source.resolve().is_relative_to(srcdir), source
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(source, destination)
    assert sha(source) == sha(destination)


def copy_declared_source(name, digest, destination):
    # makepkg may link a declared source from srcdir to its source cache.
    # Accept only the exact declared filename and verified content here.
    assert Path(name).name == name
    source = srcdir / name
    assert source.is_file() and sha(source) == digest
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(source, destination)
    assert sha(destination) == digest


def copy_package_files(package_root, destination, metadata):
    copy_file(package_root / 'package.json', destination / 'package.json')
    for pattern in metadata['files']:
        matches = list(package_root.glob(pattern))
        assert matches, (package_root, pattern)
        for path in matches:
            paths = list(path.rglob('*')) if path.is_dir() else [path]
            for item in paths:
                if item.is_file():
                    assert item.suffix not in {'.node', '.wasm'}, item
                    copy_file(item, destination / item.relative_to(package_root))


for package in manifest['packages']:
    root = roots[package['source_index']]
    package_root = root / package['path']
    metadata = json.loads((package_root / 'package.json').read_text())
    assert metadata['version'] == package['version']
    # Native artifacts are never sourced from the npm dependency store.
    for path in package_root.rglob('*.node'):
        if 'node_modules' not in path.relative_to(package_root).parts:
            path.unlink()
    if package['name'] == 'oxlint':
        shutil.rmtree(package_root / 'dist', ignore_errors=True)
    try:
        run(['corepack', 'pnpm', 'run', 'build'], package_root, package['name'] + '-build')
    finally:
        if package['name'] == 'oxlint':
            config.write_bytes(original_config)
    native = package_root / package['native_directory'] / package['native_filename']
    assert native.is_file() and native.open('rb').read(4) == b'\x7fELF'
    destination = runtime / package['name']
    if package['name'] == 'oxlint':
        published = root / 'npm/oxlint'
        published_metadata = json.loads((published / 'package.json').read_text())
        assert published_metadata['name'] == 'oxlint' and published_metadata['version'] == package['version']
        copy_file(published / 'package.json', destination / 'package.json')
        for path in (package_root / 'dist').rglob('*'):
            if path.is_file():
                assert path.suffix != '.wasm'
                copy_file(path, destination / 'dist' / path.relative_to(package_root / 'dist'))
        for name in ['README.md', 'configuration_schema.json', 'bin/oxlint']:
            copy_file(published / name, destination / name)
    else:
        copy_package_files(package_root, destination, metadata)
        copy_file(native, destination / package['native_directory'] / native.name)
    copy_file(root / 'LICENSE', destination / 'LICENSE')
    actual_native = list(destination.rglob('*.node'))
    assert len(actual_native) == 1 and sha(actual_native[0]) == sha(native)
    report['packages'].append(dict(package, native_sha256=sha(native),
        installed_native=str(actual_native[0].relative_to(project)),
        outputs=[{'path': str(p.relative_to(destination)), 'sha256': sha(p), 'bytes': p.stat().st_size}
                 for p in sorted(destination.rglob('*')) if p.is_file()]))
    assert sha(root / 'Cargo.lock') == manifest['sources'][package['source_index']]['cargo_lock_sha256']
    save_report()

# Parser's public declaration dependency is part of the same pinned source.
types_root = roots[0] / 'npm/oxc-types'
types_metadata = json.loads((types_root / 'package.json').read_text())
assert types_metadata['name'] == '@oxc-project/types' and types_metadata['version'] == '0.155.0'
copy_package_files(types_root, runtime / '@oxc-project/types', types_metadata)
copy_file(roots[0] / 'LICENSE', runtime / '@oxc-project/types/LICENSE')

# The unchanged Linux validator uses the standard npm bin entry. Recreate its
# relative local link while retaining the exact upstream Node launcher bytes.
(runtime / '.bin').mkdir()
(runtime / 'oxlint/bin/oxlint').chmod(0o755)
(runtime / '.bin/oxlint').symlink_to('../oxlint/bin/oxlint')
assert (runtime / '.bin/oxlint').resolve() == runtime / 'oxlint/bin/oxlint'
report['runtime_bin'] = {'path': str((runtime / '.bin/oxlint').relative_to(project)),
                         'target': '../oxlint/bin/oxlint',
                         'sha256': sha(runtime / 'oxlint/bin/oxlint')}

notice_pattern = re.compile(r'(?i)(?:^|[._-])(licen[sc]es?|copying|notices?|copyrights?|authors|legal)(?:$|[._-])')


def notices(root, dest):
    found = []
    for directory, dirs, files in os.walk(root):
        dirs[:] = [d for d in dirs if d not in {'node_modules', '.git', 'target'}]
        for name in files:
            path = Path(directory) / name
            if not any(notice_pattern.search(part) for part in path.relative_to(root).parts):
                continue
            copy_file(path, dest / path.relative_to(root))
            found.append({'source': str(path.relative_to(root)), 'sha256': sha(path)})
    return found


inventory = json.loads(inventory_file.read_text())
assert inventory['chunks']
report['oxlint_bundle_inventory'] = {'path': str(inventory_file.relative_to(srcdir)), 'sha256': sha(inventory_file)}
bundled = {}
for chunk in inventory['chunks']:
    for module in chunk['modules']:
        if '\0' in module['id']:
            continue
        path = Path(module['id'].split('?')[0])
        if not path.is_file() or 'node_modules' not in path.parts:
            continue
        path = path.resolve()
        assert path.is_relative_to(srcdir)
        parent = path.parent
        while parent != srcdir and not (parent / 'package.json').is_file():
            parent = parent.parent
        assert parent != srcdir
        bundled.setdefault(parent, []).append(str(path.relative_to(parent)))
for index, (root, modules) in enumerate(sorted(bundled.items())):
    meta = json.loads((root / 'package.json').read_text())
    dest = notice_root / 'javascript' / str(index)
    entries = notices(root, dest)
    copy_file(root / 'package.json', dest / 'package-metadata.json')
    report['bundled_js_packages'].append({'name': meta['name'], 'version': meta['version'],
        'source': str(root.relative_to(srcdir)), 'modules': modules, 'notices': entries,
        'license': meta.get('license'), 'notice_review_required': not bool(entries)})

# Include every registry crate compiled by the three commands, including build
# dependencies. Downloaded but uncompiled crates are recorded separately.
locked_crates = {}
workspace_crates = set()
for source in manifest['sources']:
    for package in tomllib.loads((roots[source['index']] / 'Cargo.lock').read_text())['package']:
        key = (package['name'], package['version'])
        if package.get('source', '').startswith('registry+'):
            identity = (package['source'], package['checksum'])
            assert key not in locked_crates or locked_crates[key] == identity
            locked_crates[key] = identity
        else:
            assert 'source' not in package, ('Unexpected non-registry dependency', package)
            workspace_crates.add(key)
assert not workspace_crates.intersection(locked_crates)
compiled = set()
report['cargo_compilation_logs'] = []
for package in manifest['packages']:
    log = srcdir / ('oxc-' + package['name'] + '-build.log')
    command = [c for c in report['commands'] if c['log'] == log.name]
    assert len(command) == 1 and command[0]['returncode'] == 0
    assert command[0]['command'] == ['corepack', 'pnpm', 'run', 'build']
    assert sha(log) == command[0]['log_sha256']
    content = re.sub(r'\x1b\[[0-9;]*m', '', log.read_text())
    rows = set(re.findall(r'^\s*(?:Compiling|Fresh) ([A-Za-z0-9_-]+) v([^\s]+)',
                          content, flags=re.MULTILINE))
    assert rows and rows <= set(locked_crates) | workspace_crates
    compiled.update(rows)
    report['cargo_compilation_logs'].append({'path': log.name, 'sha256': sha(log),
                                             'packages': sorted(rows)})
compiled_registry = compiled.intersection(locked_crates)
assert compiled_registry
supplements = {(x['name'], x['version']): x for x in notice_manifest['crates']}
assert len(supplements) == len(notice_manifest['crates'])
assert set(supplements) <= compiled_registry
notice_files = {x['filename']: x for x in notice_manifest['files']}
assert len(notice_files) == len(notice_manifest['files'])
for name, item in notice_files.items():
    assert Path(name).name == name and name.startswith('oxc-notice-')
    assert sha(srcdir / name) == item['sha256']
copy_declared_source('oxc-notices.json', sha(srcdir / 'oxc-notices.json'),
                     notice_root / 'supplemental-sources.json')
cached_crates = {}
for root in sorted((srcdir / 'oxc-cargo-cache/registry/src').glob('*/*')):
    path = root / 'Cargo.toml'
    if not path.is_file():
        continue
    meta = tomllib.loads(path.read_text())['package']
    key = (meta['name'], meta['version'])
    assert key in locked_crates and key not in cached_crates
    cached_crates[key] = root
assert compiled_registry <= set(cached_crates)
report['cargo_source_scope'] = {
    'compiled_registry': sorted(compiled_registry),
    'workspace_compiled': sorted(compiled.intersection(workspace_crates)),
    'downloaded_not_compiled': sorted(set(cached_crates) - compiled_registry),
    'scope': 'Compiled source notices include build dependencies, not a runtime linkage claim.'}
for index, key in enumerate(sorted(compiled_registry)):
    root = cached_crates[key]
    manifest_path = root / 'Cargo.toml'
    meta = tomllib.loads(manifest_path.read_text())['package']
    dest = notice_root / 'rust' / str(index)
    entries = notices(root, dest)
    copy_file(manifest_path, dest / 'Cargo.toml')
    source, digest = locked_crates[meta['name'], meta['version']]
    archive = srcdir / 'oxc-cargo-cache/registry/cache' / root.parent.name / (root.name + '.crate')
    assert sha(archive) == digest
    # Cargo's downloaded registry cache need not contain the checksum file
    # emitted by cargo vendor. Bind the actual archive to Cargo.lock instead.
    member_hashes = {}
    with tarfile.open(archive) as tar:
        for member in tar:
            path = Path(member.name)
            assert not path.is_absolute() and '..' not in path.parts
            assert path.parts[0] == root.name
            assert member.isdir() or member.isfile()
            if member.isfile():
                relative = Path(*path.parts[1:])
                content_hash = hashlib.file_digest(tar.extractfile(member), 'sha256').hexdigest()
                assert sha(root / relative) == content_hash
                member_hashes[str(relative)] = content_hash
    assert member_hashes
    supplement = supplements.get(key)
    supplemental_entries = []
    original_status = 'ORIGINAL_CRATE_NOTICE_PRESENT' if entries else 'ORIGINAL_NOTICE_MISSING'
    if supplement:
        assert sha(manifest_path) == supplement['cargo_manifest_sha256']
        assert sha(root / '.cargo_vcs_info.json') == supplement['cargo_vcs_info_sha256']
        assert meta.get('license') == supplement['declared_license']
        original_status = supplement['original_notice_status']
        assert original_status in {'EXACT_UPSTREAM_NOTICE',
            'ORIGINAL_LICENSE_FILE_ABSENT_DECLARATION_AND_ATTRIBUTION_PRESERVED'}
        for item in supplement['notices']:
            assert item['sha256'] == notice_files[item['filename']]['sha256']
            output = Path(item['output'])
            assert not output.is_absolute() and '..' not in output.parts
            copy_declared_source(item['filename'], item['sha256'], dest / output)
            supplemental_entries.append(item)
        for item in supplement['retained_source_files']:
            source_path, output = Path(item['source']), Path(item['output'])
            assert not source_path.is_absolute() and '..' not in source_path.parts
            assert not output.is_absolute() and '..' not in output.parts
            assert sha(root / source_path) == item['sha256']
            copy_file(root / source_path, dest / output)
        (dest / 'original-notice-provenance.json').write_text(json.dumps(supplement, indent=2) + '\n')
    checksum = dest / 'source-checksums.json'
    checksum.write_text(json.dumps({'name': meta['name'], 'version': meta['version'],
        'source': source, 'archive_sha256': digest, 'archive_bytes': archive.stat().st_size,
        'verified_source_members': len(member_hashes),
        'source_members_sha256': hashlib.sha256(json.dumps(member_hashes, sort_keys=True).encode()).hexdigest()},
        indent=2) + '\n')
    report['conservative_rust_source_notices'].append({'name': meta['name'], 'version': meta['version'],
        'source': str(root.relative_to(srcdir)), 'license': meta.get('license'),
        'notices': entries, 'source_checksum_sha256': sha(checksum),
        'supplemental_notices': supplemental_entries, 'original_notice_status': original_status,
        'notice_review_required': original_status not in {
            'ORIGINAL_CRATE_NOTICE_PRESENT', 'EXACT_UPSTREAM_NOTICE'}})
report['compiled_source_license_expressions'] = sorted({
    x['license'] for x in report['conservative_rust_source_notices']})
report['bundled_javascript_license_expressions'] = sorted({
    x['license'] for x in report['bundled_js_packages']})
assert report['compiled_source_license_expressions'] == notice_manifest['compiled_source_license_expressions']
assert report['bundled_javascript_license_expressions'] == notice_manifest['bundled_javascript_license_expressions']
assert len(list(runtime.rglob('*.node'))) == 3
assert not list(runtime.rglob('*.wasm'))
for source in manifest['sources']:
    root = roots[source['index']]
    assert sha(root / 'pnpm-lock.yaml') == source['pnpm_lock_sha256']
    assert sha(root / 'Cargo.lock') == source['cargo_lock_sha256']
report['status'] = 'SOURCE_BUILT_NATIVE_RUNTIME_READY_FOR_FUNCTIONAL_AND_NOTICE_AUDIT'
save_report()
print('OXC_THREE_NATIVE_BINDINGS_BUILT_FROM_PINNED_SOURCE')
