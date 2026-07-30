#!/usr/bin/python
"""Extract the Linux G3MTool payload from an official PyInstaller release."""

import sys
from pathlib import Path

from PyInstaller.archive.readers import CArchiveReader

PREFIX = "src/assets/bin/g3mtool_linux/"


def main() -> None:
    archive = CArchiveReader(sys.argv[1])
    destination = Path(sys.argv[2])
    members = [name for name in archive.toc if name.startswith(PREFIX)]
    if not members:
        raise RuntimeError("official release contains no Linux G3MTool payload")

    for name in members:
        target = destination / name.removeprefix(PREFIX)
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(archive.extract(name))


if __name__ == "__main__":
    main()
