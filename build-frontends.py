"""Build only the browser assets shipped by q2-feature-table from pinned sources.

The commands follow the pinned Vega, Vega-Embed, jQuery and DataTables build
scripts. DataTables' documentation/PHP and unrelated styling targets are omitted.
"""
from pathlib import Path
import json
import re
import shutil
import subprocess
import sys

vega, embed, jquery, tables, output = map(lambda p: Path(p).resolve(), sys.argv[1:])
output.mkdir(parents=True, exist_ok=True)


def run(*args, cwd):
    print('+', *map(str, args), flush=True)
    subprocess.run(list(map(str, args)), cwd=cwd, check=True)


def nonempty(path):
    assert path.is_file() and path.stat().st_size > 0, path
    return path


# Preserve source maps in build evidence to identify actual bundled libraries.
p = vega / 'packages/vega/rollup.js'
s = p.read_text()
assert s.count("file: 'build/' + output,") == 1
s = s.replace("file: 'build/' + output,", "file: 'build/' + output,\n  sourcemap: true,")
assert s.count('console.error(error.stack);') == 1
p.write_text(s.replace('console.error(error.stack);', 'console.error(error.stack);\n  process.exitCode = 1;'))
shutil.rmtree(vega / 'packages/vega/build', ignore_errors=True)
run('node', 'rollup.js', cwd=vega / 'packages/vega')
run(vega / 'node_modules/.bin/terser', 'build/vega.js', '-c', '-m',
    '-o', 'build/vega.min.js', cwd=vega / 'packages/vega')
shutil.copyfile(nonempty(vega / 'packages/vega/build/vega.min.js'), output / 'vega.min.js')

run('npm', 'run', 'build', cwd=embed)
shutil.copyfile(nonempty(embed / 'build/vega-embed.min.js'), output / 'vega-embed.min.js')

# Upstream's npm build runs npm install again. Dependencies are already locked
# and installed, so invoke the same build tasks directly, excluding test tasks.
run(jquery / 'node_modules/.bin/grunt', 'build:*:*', 'uglify',
    'remove_map_comment', 'dist:*', cwd=jquery)
nonempty(jquery / 'dist/jquery.min.js')

# DataTables make.sh expands _buildInclude directives, then runs Uglify and
# Sass. Use the same preferred source files and upstream wrapper.js, selecting
# the Bootstrap 3 assets used by the packaged visualization.
work = tables / 'built/q2'
work.mkdir(parents=True, exist_ok=True)
include = re.compile(r"(?m)^([ \t]*)_buildInclude\('([^']+)'\);[ \t]*$")


def expand(source, ancestry=()):
    assert source not in ancestry, ('Cyclic source include', source)
    text = source.read_text()
    def replace(match):
        name = match[2]
        assert '/' not in name and '..' not in name
        child = tables / 'js' / name.split('.')[0] / name
        body = expand(child, (*ancestry, source))
        return '\n'.join(match[1] + line for line in body.splitlines())
    result = include.sub(replace, text)
    assert '_buildInclude(' not in result, source
    return result


(work / 'dataTables.js').write_text(expand(tables / 'js/umd.js'))


def wrap(source, name, dependencies):
    prefix = work / name
    run('node', tables / 'build/wrapper.js', source, 'umd', prefix,
        dependencies, cwd=tables)
    return nonempty(Path(str(prefix) + '.js'))


javascript = [jquery / 'dist/jquery.min.js', work / 'dataTables.js']
javascript.append(wrap(tables / 'js/integration/dataTables.bootstrap.js',
                       'dataTables.bootstrap', 'jquery datatables.net'))
fixed = tables / 'extensions/FixedHeader'
column = tables / 'extensions/ColumnControl'
javascript.append(wrap(fixed / 'js/dataTables.fixedHeader.js',
                       'dataTables.fixedHeader', 'jquery datatables.net'))
javascript.append(wrap(fixed / 'js/fixedHeader.bootstrap.js',
                       'fixedHeader.bootstrap',
                       'jquery datatables.net-FW datatables.net-fixedheader'))

run(tables / 'node_modules/typescript/bin/tsc', '-p', './tsconfig.json', cwd=column)
for filename, relative in [('js/dataTables.columnControl.js', '../../../'),
                           ('js/ColumnControl.js', '../../../'),
                           ('js/content/index.js', '../../../../')]:
    p = column / filename
    source = p.read_text()
    statement = f"import DataTable from '{relative}types/types';"
    # TypeScript already removes imports used only as types. Upstream sed is
    # deliberately a no-op for those files, and removes remaining value imports.
    assert source.count(statement) <= 1, filename
    p.write_text(source.replace(statement, ''))
header = '''/*! ColumnControl 1.2.1
 * Copyright (c) SpryMedia Ltd - datatables.net/license
 * SVG icons: ISC License
 * Copyright (c) for portions of Lucide are held by Cole Bemis 2013-2022 as part of Feather (MIT).
 * All other copyright (c) for Lucide are held by Lucide Contributors 2022.
 */'''
run(tables / 'node_modules/rollup/dist/bin/rollup', '--banner', header,
    '--config', 'rollup.config.mjs', cwd=column)
javascript.append(wrap(column / 'js/dataTables.columnControl.js',
                       'dataTables.columnControl', 'jquery datatables.net'))
javascript.append(wrap(column / 'js/integrations/columnControl.bootstrap.js',
                       'columnControl.bootstrap',
                       'jquery datatables.net-FW datatables.net-columncontrol'))
combined = work / 'datatables.js'
combined.write_text('\n;\n'.join(nonempty(p).read_text() for p in javascript) + '\n')
run(tables / 'node_modules/.bin/uglifyjs', combined, '-c', '-m',
    '--comments', '/^!/', '-o', output / 'datatables.min.js', cwd=tables)

styles = []
for source in [tables / 'css/dataTables.bootstrap.scss',
               fixed / 'css/fixedHeader.bootstrap.scss',
               column / 'css/columnControl.bootstrap.scss']:
    target = work / (source.stem + '.css')
    run(tables / 'node_modules/.bin/sass', '--no-charset', '--no-source-map',
        '--stop-on-error', '--style=compressed', source, target, cwd=tables)
    styles.append(nonempty(target))
(output / 'datatables.min.css').write_text('\n'.join(p.read_text() for p in styles))
for name in ['vega.min.js', 'vega-embed.min.js', 'datatables.min.js', 'datatables.min.css']:
    nonempty(output / name)
print('PASS: pinned browser sources rebuilt', flush=True)
