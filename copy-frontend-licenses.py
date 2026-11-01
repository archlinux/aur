"""Copy notices from locked runtime libraries beside each generated frontend.

The legacy vendor entry bundles its complete production dependency tree. For
the modern client, use Vite's emitted chunk modules and the imported Tailwind
stylesheet, including runtime packages listed as development dependencies.
"""
from pathlib import Path
import json
import shutil

for relative in ['q2_taxa/assets/barplot', 'q2_taxa/_barplot_visualizer']:
    root = Path(relative)
    packages = json.loads((root / 'package-lock.json').read_text())['packages']
    if relative.endswith('/barplot'):
        names = {name for name, data in packages.items()
                 if name and not data.get('dev')}
    else:
        inventory = json.loads((root / '.runtime-modules.json').read_text())
        assert inventory['ssr'] is False
        assert inventory['output_directory'] == 'dist'
        names = {item['path'] for item in inventory['packages']}
        for item in inventory['packages']:
            assert item['modules'], item
            assert packages[item['path']]['version'] == item['version'], item
        # The CSS plugin compiles this source import into the shipped stylesheet.
        assert '@import "tailwindcss";' in (root / 'src/app.css').read_text()
        assert 'import "./app.css";' in (root / 'src/main.ts').read_text()
        assert inventory['css_packages'] == ['node_modules/tailwindcss']
        names.update(inventory['css_packages'])
    destination = root / 'dist' / 'third-party-licenses'
    destination.mkdir(parents=True, exist_ok=True)
    for name in sorted(names):
        assert name in packages and name.startswith('node_modules/'), name
        assert '..' not in Path(name).parts, name
        package = root / name
        notices = sorted(path for path in package.iterdir()
                         if path.is_file() and path.name.lower().startswith(
                             ('license', 'licence', 'copying', 'notice')))
        assert notices, ('Missing upstream license notice', name)
        for notice in notices:
            target = name.removeprefix('node_modules/').replace('/', '__') + '-' + notice.name
            shutil.copyfile(notice, destination / target)
