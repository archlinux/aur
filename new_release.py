#! /bin/env python

import sys
import re
import difflib

pkgver_re = re.compile(r'^pkgver\s*=\s*(\S*\S)\s*$', re.MULTILINE)
pkgrel_re = re.compile(r'^pkgrel\s*=\s*(\S*\S)\s*$', re.MULTILINE)

def main(path, pkgver, pkgrel):
    """Substitute 'pkgver' and 'pkgrel' values in path."""

    with open(path) as fin:
        txt = fin.read()
        new_txt = re.sub(pkgver_re, f'pkgver={pkgver}', txt)
        new_txt = re.sub(pkgrel_re, f'pkgrel={pkgrel}', new_txt)

        with open(path, 'w') as fout:
            fout.write(new_txt)

        print(f"Changes made to {path} by '{sys.argv[0]} {pkgver} {pkgrel}'")
        result = difflib.unified_diff(txt.splitlines(keepends=True),
                                new_txt.splitlines(keepends=True))
        sys.stdout.writelines(result)

if __name__ == '__main__':
    main('PKGBUILD', *sys.argv[1:])
