# SPDX-License-Identifier: MIT

# Copyright (c) 2021 igo95862

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice
# (including the next paragraph) shall be included in all copies
# or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
from __future__ import annotations

from argparse import ArgumentParser
from pathlib import Path
from sysconfig import get_path
from typing import List
from shutil import copy, copytree


def install_single_pyi_file(pyi_path: Path, install_dir: Path) -> None:
    if not pyi_path.suffix != 'pyi':
        raise ValueError(
            'Expected .pyi file'
            f" got {pyi_path.name}"
        )

    package_name = pyi_path.stem
    package_dir_path = install_dir / f"{package_name}-stubs"
    package_dir_path.mkdir(0o755)

    copy(pyi_path, package_dir_path / '__init__.py')


def install_stubs_dir(stubs_dir: Path, install_dir: Path) -> None:
    if not stubs_dir.is_dir():
        raise ValueError(
            'Not a directory'
            f"{stubs_dir}"
        )

    package_name = stubs_dir.name
    package_dir_path = install_dir / f"{package_name}-stubs"
    copytree(stubs_dir, package_dir_path)


skip_names = ('METADATA.toml', 'README.md')


def install_typeshed(typeshed_dir: Path, install_dir: Path) -> None:
    typeshed_stubs_dir = typeshed_dir / 'stubs'

    if not typeshed_stubs_dir.is_dir():
        raise ValueError('Could not find typeshed stubs dir under'
                         f" {typeshed_stubs_dir}")

    pure_lib_path_str = get_path('purelib')
    if pure_lib_path_str is None:
        raise ValueError('Could not get purelib folder')

    site_package_dir = Path(pure_lib_path_str)
    install_package_dir = install_dir / site_package_dir.relative_to('/')
    install_package_dir.mkdir(0o755, parents=True)

    paths_to_install: List[Path] = []
    for stub_dir in typeshed_stubs_dir.iterdir():
        for something_inside_stub_dir in stub_dir.iterdir():
            if something_inside_stub_dir.name.startswith('@'):
                continue
            elif something_inside_stub_dir.name in skip_names:
                continue
            else:
                paths_to_install.append(something_inside_stub_dir)

    for install_element in paths_to_install:
        if install_element.is_file():
            install_single_pyi_file(install_element, install_package_dir)
        elif install_element.is_dir():
            install_stubs_dir(install_element, install_package_dir)
        else:
            raise ValueError(f'Not dir or file {install_element}')


def main() -> None:
    parser = ArgumentParser()
    parser.add_argument(
        '--typeshed-dir',
        type=Path,
        required=True,
    )
    parser.add_argument(
        '--install-dir',
        type=Path,
        required=True,
    )

    args = parser.parse_args()
    typeshed_dir = args.typeshed_dir
    install_dir = args.install_dir

    install_typeshed(typeshed_dir, install_dir)


if __name__ == '__main__':
    main()
