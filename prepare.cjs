// SPDX-License-Identifier: MIT
'use strict';

const fs = require('node:fs');
const path = require('node:path');
const {createHash} = require('node:crypto');
const {execFileSync} = require('node:child_process');

const application = path.resolve(process.argv[2]);
const rules = JSON.parse(fs.readFileSync(process.argv[3], 'utf8'));
const main = fs.readFileSync(path.join(application, 'src/main.js'));
const expected = '42207090bf2d20de883e810f4b134c1471e00720406a581d770075c81ae7ce6f';
if (createHash('sha256').update(main).digest('hex') !== expected) {
  throw new Error('The upstream main bundle changed. Review the ast-grep rules.');
}

function scan(rule, mode) {
  return execFileSync('ast-grep', [
    'scan', '--inline-rules', JSON.stringify(rule), mode, ...rule.files
  ], {cwd: application, encoding: 'utf8', maxBuffer: 16 * 1024 * 1024});
}

// Check every rule before the first edit. Each rule includes its expected count.
for (const rule of rules) {
  const count = JSON.parse(scan(rule, '--json=compact')).length;
  const expectedCount = Number(rule.metadata.expectedMatches);
  if (count !== expectedCount) {
    throw new Error(`${rule.id}: expected ${expectedCount} matches, found ${count}`);
  }
}
for (const rule of rules) {
  scan(rule, '--update-all');
  console.log(`Applied ast-grep rule: ${rule.id}`);
}

for (const filename of new Set(rules.flatMap(rule => rule.files))) {
  if (filename.endsWith('.json')) {
    JSON.parse(fs.readFileSync(path.join(application, filename), 'utf8'));
  }
}
