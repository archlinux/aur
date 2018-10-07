#!/usr/bin/env python3

import logging
import subprocess
import sys
from pathlib import Path
from collections import defaultdict

from camisole.languages import Lang, load_builtins

load_builtins()


def by_name(name):
    return Lang._full_registry[name]


OVERWRITE = {
    # java packages consist of symlinks to handle both Java 7 & 8, so we force
    # the version (8) here
    by_name('java'): {'/usr/lib/jvm/java-8-openjdk/bin/java',
                      '/usr/lib/jvm/java-8-openjdk/bin/javac'},
    # go is provided by both 'go' and 'gcc-go'
    by_name('go'): {'/usr/lib/go/bin/go'},
}


def list_paths():
    for lang in Lang._full_registry:
        cls = by_name(lang)
        if cls in OVERWRITE:
            for path in OVERWRITE[cls]:
                yield cls, Path(path)
            continue
        for p in cls.required_binaries():
            yield cls, Path(p.cmd)


def get_package(binary):
    try:
        pkg = (subprocess.check_output(['pkgfile', '-qb', binary])
               .decode().split('\n')[0]) or None
        return pkg
    except subprocess.CalledProcessError:
        return None


if __name__ == '__main__':
    packages = defaultdict(set)
    for lang, binary in list_paths():
        pkg = get_package(binary)
        if pkg is None:
            logging.error("no package for %s", binary)
            continue
        packages[pkg].add(lang)
    packages.pop('python', None)  # already a strong dependency
    packages = sorted(packages.items())
    lines = ["{:<20} # handle {} sources".format(
        "'{}'{}".format(pkg, ')' if i == len(packages) - 1 else ''),
        ', '.join(sorted(lang.name for lang in langs)))
        for i, (pkg, langs) in enumerate(packages)]
    prefix = 'depends=('
    print('{}{}'.format(prefix, lines[0]))
    print('\n'.join(' ' * len(prefix) + line for line in lines[1:]))
