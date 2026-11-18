#!/usr/bin/env node
// Domestic package: put the BigModel / 智谱 providers at the front of the
// built-in provider catalogue so a fresh profile starts on the domestic
// account instead of Z.ai. Only the bundled provider metadata is reordered;
// no application code is touched, and the UI still offers every provider.
'use strict';

const fs = require('node:fs');
const path = require('node:path');

const appDir = process.argv[2];
if (!appDir) {
  console.error('usage: patch.cjs <app-dir>');
  process.exit(2);
}

const file = path.join(appDir, 'resources', 'config', 'provider', 'zcode-builtin.json');
const doc = JSON.parse(fs.readFileSync(file, 'utf8'));
const rules = doc?.config?.providerConfigRules;
if (!rules || !Array.isArray(rules.templateRules) || !Array.isArray(rules.providerRules)) {
  console.error('patch: provider rules not found, upstream layout changed');
  process.exit(1);
}

const isDomestic = (id) => typeof id === 'string' && /bigmodel/.test(id);

function hoist(list, key, label) {
  const domestic = list.filter((item) => isDomestic(item[key]));
  if (domestic.length === 0) {
    throw new Error(`${label}: no BigModel entry found`);
  }
  const alreadyFirst = domestic.every((item, index) => list[index][key] === item[key]);
  if (alreadyFirst) return false;
  const rest = list.filter((item) => !isDomestic(item[key]));
  list.splice(0, list.length, ...domestic, ...rest);
  return true;
}

const changed = [
  hoist(rules.templateRules, 'templateId', 'templateRules'),
  hoist(rules.providerRules, 'providerId', 'providerRules'),
].some(Boolean);

if (changed) {
  fs.writeFileSync(file, `${JSON.stringify(doc, null, 2)}\n`);
  console.log('patch: BigModel providers moved to the front');
} else {
  console.log('patch: BigModel providers already first');
}

// Fail the build instead of shipping an unpatched package if the rewrite did
// not land where the UI expects it.
for (const [list, key, label] of [
  [rules.templateRules, 'templateId', 'templateRules'],
  [rules.providerRules, 'providerId', 'providerRules'],
]) {
  if (!isDomestic(list[0]?.[key])) {
    console.error(`patch: ${label}[0] is ${list[0]?.[key]}, expected a BigModel entry`);
    process.exit(1);
  }
}
