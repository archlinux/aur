// SPDX-License-Identifier: 0BSD
import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import { dirname, isAbsolute, relative, resolve } from 'node:path';

/** @returns {import('vite').Plugin} */
export function runtimeModules() {
  let server = false;
  return {
    name: 'runtime-module-inventory',
    apply: 'build',
    configResolved(config) {
      server = Boolean(config.build.ssr);
    },
    generateBundle(options, bundle) {
      if (server) return;
      const root = resolve('.');
      const packages = new Map();
      for (const output of Object.values(bundle)) {
        if (output.type !== 'chunk') continue;
        for (const id of Object.keys(output.modules)) {
          const filename = id.replace(/^\0+/, '').split('?', 1)[0];
          if (!isAbsolute(filename) || !filename.includes('/node_modules/')) continue;
          let directory = dirname(filename);
          let matched = false;
          while (directory.startsWith(root + '/')) {
            const manifest = resolve(directory, 'package.json');
            if (existsSync(manifest)) {
              const metadata = JSON.parse(readFileSync(manifest, 'utf8'));
              if (metadata.name && metadata.version) {
                const path = relative(root, directory);
                if (!packages.has(path)) packages.set(path, {
                  name: metadata.name, version: metadata.version, path, modules: new Set(),
                });
                packages.get(path).modules.add(relative(directory, filename));
                matched = true;
                break;
              }
            }
            directory = dirname(directory);
          }
          if (!matched) throw new Error('Unidentified runtime package: ' + id);
        }
      }
      if (!packages.size) throw new Error('Empty client runtime inventory');
      if (!options.dir) throw new Error('Missing client output directory');
      writeFileSync('.runtime-modules.json', JSON.stringify({
        ssr: false, output_directory: relative(root, resolve(options.dir)),
        packages: [...packages.values()].sort((a, b) => a.path.localeCompare(b.path))
          .map(item => ({ ...item, modules: [...item.modules].sort() })),
        css_packages: ['node_modules/tailwindcss'],
      }, null, 2) + '\n');
    },
  };
}
