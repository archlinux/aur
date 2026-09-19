#!/usr/bin/env python3
"""Collect local Arch license evidence for the actual frozen uploader runtime."""
import argparse
import ast
from collections import defaultdict
from email.parser import Parser
import os
from pathlib import Path
import shutil
import subprocess
import sysconfig


def pacman(*args):
    return subprocess.check_output(
        ['pacman', *args], text=True, env={**os.environ, 'LC_ALL': 'C'}).strip()


def binary_paths(value):
    if not isinstance(value, (tuple, list)):
        return
    if (len(value) == 3 and all(isinstance(item, str) for item in value)
            and value[2] in {'BINARY', 'EXTENSION'}):
        yield Path(value[1])
    else:
        for item in value:
            yield from binary_paths(item)


def package_info(name):
    fields = {}
    for line in pacman('-Qi', name).splitlines():
        if line and not line[0].isspace() and ':' in line:
            key, value = line.split(':', 1)
            fields[key.strip()] = value.strip()
    return fields['Version'], fields['Licenses']


def component_expression(name, binaries, expression, lzma_header=''):
    # xz's package expression also covers command-line tools and scripts. Only
    # liblzma is frozen here; require explicit evidence from the installed API.
    if name == 'xz':
        if not binaries or any(not item.startswith('liblzma.so.') for item in binaries):
            raise RuntimeError('Unexpected xz component in uploader')
        if ('SPDX-License-Identifier: 0BSD' not in lzma_header or
                'liblzma is distributed under the BSD Zero Clause License (0BSD).' not in lzma_header):
            raise RuntimeError('Installed liblzma license evidence changed')
        return '0BSD'
    return expression


def package_licenses(name, expression):
    if name == 'xz' and expression == '0BSD':
        # Arch's official xz package omits this text. Vendored verbatim from
        # tukaani-project/xz v5.8.4 COPYING.0BSD; PKGBUILD checksums this file.
        return [Path(__file__).with_name('liblzma-0BSD.txt')]
    owned = [Path(line) for line in pacman('-Qlq', name).splitlines()]
    found = [path for path in owned
             if path.is_file() and path.is_relative_to('/usr/share/licenses')]
    if name == 'python':
        python_license = Path(sysconfig.get_path('stdlib')) / 'LICENSE.txt'
        if python_license not in owned or not python_license.is_file():
            raise RuntimeError('Python stdlib LICENSE.txt is missing or not owned by python')
        found.append(python_license)
    if found:
        return sorted(set(found))

    # Arch stores standard license texts centrally instead of in every package.
    # Fail closed on an unknown identifier, compound expression, or missing text.
    identifiers = expression.split()
    if not identifiers:
        raise RuntimeError(f'{name}: no license identifiers')
    for identifier in identifiers:
        if '/' in identifier or identifier in {'.', '..', 'AND', 'OR', 'WITH', 'None'}:
            raise RuntimeError(f'{name}: unsupported license identifier {identifier!r}')
        path = Path('/usr/share/licenses/spdx') / f'{identifier}.txt'
        if not path.is_file() or pacman('-Qoq', str(path)) != 'licenses':
            raise RuntimeError(f'{name}: no installed license evidence for {identifier!r}')
        found.append(path)
    return found


def copy_texts(paths, directory):
    directory.mkdir(parents=True, exist_ok=True)
    names = []
    for number, path in enumerate(paths, 1):
        name = f'{number:02d}-{path.name}'
        shutil.copyfile(path, directory / name)
        names.append(name)
    return names


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path, help='upstream source tree')
    parser.add_argument('tool_purelib', type=Path, help='staged PyInstaller site-packages')
    parser.add_argument('output', type=Path, help='empty license output directory')
    args = parser.parse_args()
    if args.output.exists() and any(args.output.iterdir()):
        parser.error('output directory must be empty')
    report = args.root / 'build/optional-uploader-linux/work/FTHR-Uploader/Analysis-00.toc'
    owners = defaultdict(set)
    for path in set(binary_paths(ast.literal_eval(report.read_text()))):
        owner = pacman('-Qoq', str(path)).splitlines()
        if len(owner) != 1:
            raise RuntimeError(f'Expected one installed owner for {path.name}')
        owners[owner[0]].add(path.name)
    if 'python' not in owners:
        raise RuntimeError('Analysis report contains no Python runtime')

    # The bootloader is added after Analysis and therefore needs its own notice.
    distributions = list(args.tool_purelib.glob('pyinstaller-*.dist-info'))
    if len(distributions) != 1:
        raise RuntimeError('Expected exactly one staged PyInstaller distribution')
    distribution = distributions[0]
    copying = distribution / 'licenses/COPYING.txt'
    metadata = Parser().parsestr((distribution / 'METADATA').read_text())
    if not copying.is_file() or metadata['Name'].lower() != 'pyinstaller':
        raise RuntimeError('Staged PyInstaller license evidence is missing')

    # Gather all evidence before writing so an unknown owner fails cleanly.
    evidence = []
    for owner, binaries in sorted(owners.items()):
        version, licenses = package_info(owner)
        header = Path('/usr/include/lzma.h')
        if owner == 'xz' and pacman('-Qoq', str(header)) != 'xz':
            raise RuntimeError('liblzma API license evidence is not owned by xz')
        licenses = component_expression(owner, binaries, licenses,
                                        header.read_text() if owner == 'xz' else '')
        evidence.append((owner, version, licenses, sorted(binaries),
                         package_licenses(owner, licenses)))
    args.output.mkdir(parents=True, exist_ok=True)
    lines = ['Optional uploader bundled runtime',
             'Inventory derived from PyInstaller Analysis; package metadata from pacman.',
             'These notices cover embedded copies, not just system dependencies.', '']
    for owner, version, licenses, binaries, paths in evidence:
        names = copy_texts(paths, args.output / owner)
        lines.extend([f'Package: {owner}', f'Version: {version}',
                      f'Licenses: {licenses}', f'Binaries: {", ".join(binaries)}',
                      'License files: ' + ', '.join(f'{owner}/{name}' for name in names), ''])
    names = copy_texts([copying], args.output / 'pyinstaller')
    lines.extend(['Package: pyinstaller', f'Version: {metadata["Version"]}',
                  f'Licenses: {metadata.get("License-Expression") or metadata.get("License", "See COPYING.txt")}',
                  'Component: executable bootloader and runtime hooks',
                  'License files: ' + ', '.join(f'pyinstaller/{name}' for name in names), ''])
    (args.output / 'MANIFEST.txt').write_text('\n'.join(lines), encoding='utf-8')
    print(f'Collected licenses for {len(evidence)} runtime packages and PyInstaller')


if __name__ == '__main__':
    main()
