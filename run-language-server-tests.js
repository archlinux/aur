'use strict';

const fs = require('node:fs');
const path = require('node:path');
const {createRequire} = require('node:module');

const packageDir = path.resolve(process.argv[2] || process.cwd());
process.chdir(packageDir);

const pkgRequire = createRequire(path.join(packageDir, 'package.json'));
process.env.TS_NODE_TRANSPILE_ONLY = 'true';
pkgRequire('ts-node/register');

const Mocha = pkgRequire('mocha');
const mocha = new Mocha();

function addTests(dir) {
  const entries = fs
    .readdirSync(dir, {withFileTypes: true})
    .sort((a, b) => a.name.localeCompare(b.name));

  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) addTests(fullPath);
    else if (entry.isFile() && entry.name.endsWith('.test.ts')) mocha.addFile(fullPath);
  }
}

addTests(path.join(packageDir, 'test'));
mocha.run((failures) => {
  process.exitCode = failures ? 1 : 0;
});
