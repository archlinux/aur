// Stage the CLI bundles and the libraries deliberately externalized by esbuild.
const fs = require('node:fs');
const path = require('node:path');
const assert = require('node:assert/strict');

const verify = process.argv[2] === '--verify';
const [source, target] = process.argv.slice(verify ? 3 : 2);
const read = file => JSON.parse(fs.readFileSync(file, 'utf8'));
const write = (file, value) => fs.writeFileSync(file, JSON.stringify(value, null, 2) + '\n');
const lock = read(path.join(source, 'package-lock.json'));

if (verify) {
  const runtimeLock = read(path.join(target, 'package-lock.json'));
  for (const [name, pkg] of Object.entries(runtimeLock.packages)) {
    if (!name) continue;
    const original = lock.packages[name];
    assert.ok(original, `Runtime dependency absent from upstream lockfile: ${name}`);
    assert.equal(pkg.version, original.version, `Version changed: ${name}`);
    assert.equal(pkg.integrity, original.integrity, `Integrity changed: ${name}`);
  }
  console.log('Runtime dependencies match the upstream lockfile.');
} else {
  const pkg = read(path.join(source, 'package.json'));
  const dependencies = Object.fromEntries(
    ['web-tree-sitter', 'ink', 'react', 'react-dom', 'react-devtools-core']
      .map(name => [name, lock.packages[`node_modules/${name}`].version]),
  );
  // Recreate the staging area on rebuilds; never modify the upstream sources.
  fs.rmSync(target, { recursive: true, force: true });
  fs.mkdirSync(target, { recursive: true });
  fs.cpSync(path.join(source, 'dist'), path.join(target, 'dist'), { recursive: true });
  const runtime = {
    name: pkg.name, version: pkg.version, description: pkg.description,
    license: pkg.license, engines: { node: pkg.engines.node },
    bin: pkg.bin, dependencies,
  };
  write(path.join(target, 'package.json'), runtime);
  lock.packages[''] = runtime;
  write(path.join(target, 'package-lock.json'), lock);

  // Bundling JavaScript does not remove its license obligations. Preserve the
  // license/notice files of all installed production dependencies, including
  // those compiled into dist and the providers of the copied WASM binaries.
  const licenses = path.join(target, 'licenses');
  fs.mkdirSync(licenses);
  const inventory = [];
  for (const [name, metadata] of Object.entries(lock.packages)) {
    if (!name || metadata.dev) continue;
    const directory = path.join(source, name);
    if (!fs.existsSync(directory)) continue; // Optional packages for other OSes.
    const manifest = read(path.join(directory, 'package.json'));
    inventory.push({ name: manifest.name, version: manifest.version, license: manifest.license });
    for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
      if (!entry.isFile() || !/^(licen[cs]e|copying|notice|copyright|third.?party)/i.test(entry.name)) continue;
      if (/\.(?:[cm]?js|[cm]?ts)$/i.test(entry.name)) continue;
      const destination = path.join(licenses, name.replaceAll('node_modules/', ''), entry.name);
      fs.mkdirSync(path.dirname(destination), { recursive: true });
      fs.copyFileSync(path.join(directory, entry.name), destination);
    }
  }
  write(path.join(licenses, 'packages.json'), inventory);
}
