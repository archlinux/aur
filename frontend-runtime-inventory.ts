import fs from 'node:fs';
import type { Plugin } from 'vite';

export default function runtimeInventory(): Plugin {
  return {
    name: 'package-runtime-inventory',
    generateBundle(_options, bundle) {
      const chunks = Object.entries(bundle).flatMap(([name, value]) =>
        value.type === 'chunk'
          ? [{ name, modules: Object.keys(value.modules).sort() }]
          : []);
      const assets = Object.entries(bundle).flatMap(([name, value]) =>
        value.type === 'asset'
          ? [{ name, originalFileNames: value.originalFileNames }]
          : []);
      fs.writeFileSync('.runtime-modules.json', JSON.stringify({ chunks, assets }, null, 2) + '\n');
    },
  };
}
