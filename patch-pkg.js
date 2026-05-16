const fs = require('fs');
const file = process.argv[2] || 'package.json';
const pkg = JSON.parse(fs.readFileSync(file, 'utf8'));

pkg.engines = pkg.engines || {};
pkg.engines.node = '>=22.0.0';
pkg.pnpm = pkg.pnpm || {};
pkg.pnpm.overrides = pkg.pnpm.overrides || {};
pkg.pnpm.overrides['node-addon-api'] = '8.5.0';
pkg.pnpm.overrides['@types/react'] = '16';
pkg.pnpm.overrides['@types/react-dom'] = '16';

pkg.pnpm.allowedDeprecatedVersions = pkg.pnpm.allowedDeprecatedVersions || {};
const deprecated = [
  '@npmcli/move-file', 'abstract-leveldown', 'are-we-there-yet', 'core-js',
  'deferred-leveldown', 'gauge', 'glob', 'har-validator', 'inflight',
  'level-codec', 'level-concat-iterator', 'level-errors', 'lodash.get',
  'lodash.isequal', 'npmlog', 'popper.js', 'prebuild-install', 'request',
  'rimraf', 'tar',
];
for (const pkg_name of deprecated) {
  pkg.pnpm.allowedDeprecatedVersions[pkg_name] = '*';
}

fs.writeFileSync(file, JSON.stringify(pkg, null, 2));
