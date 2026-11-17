#!/usr/bin/env node
// Apply the minimal Linux compatibility patch to the unpacked app tree.
//
// Upstream only treats macOS and Windows as first-class desktop platforms. The
// one place that actually breaks on Linux is the enterprise IM channel
// backend: it is instantiated for every non-overseas build and its native
// binding does not exist for Linux, which makes the daemon fail to boot.
// Upstream already ships a headless fallback (used for the overseas edition);
// on Linux we take that path too.
'use strict';

const fs = require('node:fs');
const path = require('node:path');

const appDir = process.argv[2];
if (!appDir) {
  console.error('usage: patch.cjs <app-dir>');
  process.exit(2);
}

const file = path.join(appDir, 'main', 'daemon-bootstrap.js');
let source = fs.readFileSync(file, 'utf8');

// function createDesktopImChannelsBackend(...){if(<cond>)return createHeadlessImChannelsBackend();
const anchor =
  /(function createDesktopImChannelsBackend\([^)]*\)\{)if\(([^;]+?isOversea===!0)\)return (create(?:Headless|Unavailable)ImChannelsBackend)\(\);/;

if (source.includes('process.platform===`linux`||')) {
  console.log('patch: already applied');
  process.exit(0);
}
if (!anchor.test(source)) {
  console.error('patch: createDesktopImChannelsBackend anchor not found; upstream layout changed');
  process.exit(1);
}

source = source.replace(
  anchor,
  (match, head, condition, factory) =>
    `${head}if(process.platform===\`linux\`||${condition})return ${factory}();`,
);

// A future upstream build could reshape the anchor so the replacement still
// matches but produces invalid code; refuse to ship that.
try {
  new (require('node:vm').Script)(source);
} catch (error) {
  console.error(`patch: patched bundle does not parse: ${error.message}`);
  process.exit(1);
}

fs.writeFileSync(file, source);
console.log('patch: Linux uses the headless IM channel backend');
