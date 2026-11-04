"""Package only the exact source-built Studio native runtime and notices."""
import argparse
import csv
import hashlib
import base64
import io
import os
from pathlib import Path
import tomllib
from zipfile import ZipFile

OXC = Path('studio/backend/core/data_recipe/oxc-validator')
RUNTIME = OXC / 'node_modules'
NATIVE_WHEEL = '''from setuptools import setup
from setuptools.dist import Distribution
from wheel.bdist_wheel import bdist_wheel

class NativeDataDistribution(Distribution):
    def has_ext_modules(self):
        return True

class NativeDataWheel(bdist_wheel):
    def get_tag(self):
        # Node N-API payloads are platform-specific, not CPython-ABI-specific.
        return "py3", "none", super().get_tag()[2]

setup(distclass=NativeDataDistribution, cmdclass={"bdist_wheel": NativeDataWheel})
'''


def payload(project):
    runtime = project / RUNTIME
    native = list(runtime.rglob('*.node'))
    assert len(native) == 3 and all(p.open('rb').read(4) == b'\x7fELF' for p in native)
    assert not list(runtime.rglob('*.wasm'))
    roots = {'oxc-parser', 'oxc-transform', 'oxlint', '@oxc-project', '.bin'}
    assert {p.name for p in runtime.iterdir()} == roots
    link = runtime / '.bin/oxlint'
    assert link.is_symlink() and os.readlink(link) == '../oxlint/bin/oxlint'
    assert link.resolve() == (runtime / 'oxlint/bin/oxlint').resolve()
    files = sorted(p for parent in [runtime, project / OXC / 'third-party-notices']
                   for p in parent.rglob('*') if p.is_file())
    assert files and any('third-party-notices' in p.parts for p in files)
    assert all(p.resolve().is_relative_to(project) for p in files)
    assert all(not p.is_symlink() or p == link for p in files)
    return files


def configure(project):
    files = payload(project)
    path = project / 'pyproject.toml'
    text = path.read_text()
    parsed = tomllib.loads(text)
    assert 'studio' in parsed['tool']['setuptools']['package-data']
    offset = text.index('[tool.setuptools.package-data]')
    pos = text.index('studio = [\n', offset) + len('studio = [\n')
    text = text[:pos] + ''.join('    "' + str(p.relative_to(project / 'studio')) + '",\n' for p in files) + text[pos:]
    path.write_text(text)
    native_setup = project / 'setup.py'
    assert not native_setup.exists(), 'Unexpected upstream setup.py'
    native_setup.write_text(NATIVE_WHEEL)


def verify(project):
    wheel, = (project / 'dist').glob('*.whl')
    with ZipFile(wheel) as archive:
        names = set(archive.namelist())
        for directory in ['studio/frontend/dist', 'studio/backend/assets/docs_ui']:
            files = [p for p in (project / directory).rglob('*') if p.is_file()]
            assert files
            for path in files:
                assert archive.read(str(path.relative_to(project))) == path.read_bytes(), path
        expected = {str(p.relative_to(project)) for p in payload(project)}
        for name in expected:
            assert archive.read(name) == (project / name).read_bytes(), name
        actual_runtime = {n for n in names if '/node_modules/' in n and not n.endswith('/')}
        assert actual_runtime == {n for n in expected if '/node_modules/' in n}
        assert len([n for n in actual_runtime if n.endswith('.node')]) == 3
        assert not any(n.endswith('.wasm') for n in actual_runtime)
        assert 'studio/frontend/.runtime-modules.json' not in names
        assert 'studio/frontend/.source-built-components.json' not in names
        metadata, = (n for n in names if n.endswith('.dist-info/WHEEL'))
        content = archive.read(metadata).decode()
        assert 'Root-Is-Purelib: false' in content
        assert 'Tag: py3-none-linux_x86_64' in content
        record, = (n for n in names if n.endswith('.dist-info/RECORD'))
        rows = {n: (h, size) for n, h, size in csv.reader(io.StringIO(archive.read(record).decode()))}
        for name in expected:
            raw = archive.read(name)
            digest = 'sha256=' + base64.urlsafe_b64encode(hashlib.sha256(raw).digest()).rstrip(b'=').decode()
            assert rows[name] == (digest, str(len(raw)))


def restore_link(site):
    runtime = site / RUNTIME
    launcher = runtime / 'oxlint/bin/oxlint'
    link = runtime / '.bin/oxlint'
    assert launcher.is_file() and launcher.resolve().is_relative_to(site)
    # Wheel installers materialize a ZIP member as a regular file. Its exact
    # dereferenced bytes remain unchanged in RECORD when the npm link returns.
    assert link.is_file() and link.read_bytes() == launcher.read_bytes()
    if link.is_symlink():
        assert os.readlink(link) == '../oxlint/bin/oxlint'
    else:
        link.unlink()
        link.symlink_to('../oxlint/bin/oxlint')
    launcher.chmod(0o755)
    assert link.resolve() == launcher.resolve()
    record, = site.glob('unsloth-*.dist-info/RECORD')
    rows = {n: (h, size) for n, h, size in csv.reader(io.StringIO(record.read_text()))}
    for path in [launcher, link]:
        raw = path.read_bytes()
        digest = 'sha256=' + base64.urlsafe_b64encode(hashlib.sha256(raw).digest()).rstrip(b'=').decode()
        assert rows[str(path.relative_to(site))] == (digest, str(len(raw)))


parser = argparse.ArgumentParser()
parser.add_argument('mode', choices=['configure', 'verify', 'restore-link'])
parser.add_argument('root', type=Path)
args = parser.parse_args()
{'configure': configure, 'verify': verify, 'restore-link': restore_link}[args.mode](args.root.resolve())
