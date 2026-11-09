#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
"""Generate a checked cache from the bundle's native GdkPixbuf loader modules."""

import argparse
import ast
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile


def rebuild(bundle, query_tool=None, runtime_prefix=None):
    bundle = bundle.resolve()
    parent = bundle / 'lib/gdk-pixbuf-2.0/2.10.0'
    modules = sorted(path for path in (parent / 'loaders').glob('*.so') if path.is_file())
    if not modules:
        raise ValueError('Bundle has no GdkPixbuf loader modules')
    if query_tool is None:
        if shutil.which('pkg-config'):
            query = subprocess.run(['pkg-config', '--variable=gdk_pixbuf_query_loaders',
                                    'gdk-pixbuf-2.0'], capture_output=True, text=True)
            query_tool = query.stdout.strip() if query.returncode == 0 else None
        query_tool = query_tool or shutil.which('gdk-pixbuf-query-loaders')
    if not query_tool:
        raise ValueError('Native gdk-pixbuf-query-loaders is required')
    env = dict(os.environ)
    env['LD_LIBRARY_PATH'] = str(bundle / 'lib') + (
        ':' + env['LD_LIBRARY_PATH'] if env.get('LD_LIBRARY_PATH') else '')
    result = subprocess.run([str(query_tool), *(str(path) for path in modules)],
                            env=env, check=True, capture_output=True, text=True)
    if result.stderr.strip():
        raise ValueError('GdkPixbuf query reported loader errors: ' + result.stderr.strip())
    entries = re.findall(r'^"(?:[^"\\]|\\.)+\.so"$', result.stdout, flags=re.MULTILINE)
    found = [ast.literal_eval(entry) for entry in entries]
    if sorted(found) != sorted(str(path) for path in modules):
        raise ValueError('Generated cache does not describe every bundled loader exactly once')
    prefix = runtime_prefix or bundle
    cache = result.stdout
    for module in modules:
        cache = cache.replace('"' + str(module) + '"',
                              '"' + str(prefix / module.relative_to(bundle)) + '"')
    cache_path = parent / 'loaders.cache'
    temporary = None
    try:
        with tempfile.NamedTemporaryFile(mode='w', dir=parent, delete=False) as stream:
            temporary = Path(stream.name)
            stream.write(cache)
        temporary.chmod(cache_path.stat().st_mode & 0o777 if cache_path.exists() else 0o644)
        temporary.replace(cache_path)
    finally:
        if temporary is not None:
            temporary.unlink(missing_ok=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('bundle', type=Path)
    parser.add_argument('--query-tool', type=Path)
    parser.add_argument('--runtime-prefix', type=Path)
    args = parser.parse_args()
    rebuild(args.bundle, args.query_tool, args.runtime_prefix)
