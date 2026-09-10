// Replaces scripts/build.js's integrateZaDark() + build-info.json + version override.
// electron-builder/AppImage packaging is replaced by the Arch package layout.
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const BASE_DIR = process.cwd();
const ZALO_VERSION = process.env.ZALO_VERSION;

const zadarkPC = require(path.join(BASE_DIR, 'plugins', 'zadark', 'build', 'pc', 'zadark-pc.js'));
zadarkPC.copyZaDarkAssets(BASE_DIR);
zadarkPC.writeIndexFile(BASE_DIR);
zadarkPC.writeBootstrapFile(BASE_DIR);
zadarkPC.writePopupViewerFile(BASE_DIR);

const commit = execSync('git rev-parse --short HEAD', { encoding: 'utf8' }).trim();
const zadarkVersion = JSON.parse(fs.readFileSync(path.join(BASE_DIR, 'plugins', 'zadark', 'package.json'), 'utf8')).version;

fs.writeFileSync(
  path.join(BASE_DIR, 'app', 'pc-dist', 'build-info.json'),
  JSON.stringify({ version: ZALO_VERSION, zadarkVersion, commit, buildDate: new Date().toISOString() }, null, 2),
  'utf8'
);

// Mirror build.js's `-c.extraMetadata.version=${ZALO_VERSION}` on the app manifest
const pkg = JSON.parse(fs.readFileSync(path.join(BASE_DIR, 'package.json'), 'utf8'));
pkg.version = ZALO_VERSION;
fs.writeFileSync(path.join(BASE_DIR, 'package.json'), JSON.stringify(pkg, null, 2), 'utf8');
