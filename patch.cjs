#!/usr/bin/env node
// ZCode ships one Linux build with three OAuth login sources:
//   bigmodel  BigModel / 智谱   (China)
//   zai_cn    Z.ai (CN)         (China)
//   zai       Z.ai              (Global)
// Each AUR package is pinned to exactly one of them instead of letting the
// application pick by locale or network. UI language is not touched; it stays
// with the system locale.
//
// usage: patch.cjs <app-dir> <bigmodel|zai-cn|intl> <asar-extract-dir>
'use strict';

const fs = require('node:fs');
const path = require('node:path');

const [appDir, edition, asarDir] = process.argv.slice(2);
const editions = new Set(['bigmodel', 'zai-cn', 'intl']);

if (!appDir || !editions.has(edition) || !asarDir) {
  console.error('usage: patch.cjs <app-dir> <bigmodel|zai-cn|intl> <asar-extract-dir>');
  process.exit(2);
}

// BigModel build: put the BigModel / 智谱 entries at the front of the bundled
// provider catalogue. Only metadata order changes; the UI still lists every
// API provider (model providers are unrelated to the OAuth login lock).
if (edition === 'bigmodel') {
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

  for (const [list, key, label] of [
    [rules.templateRules, 'templateId', 'templateRules'],
    [rules.providerRules, 'providerId', 'providerRules'],
  ]) {
    if (!isDomestic(list[0]?.[key])) {
      console.error(`patch: ${label}[0] is ${list[0]?.[key]}, expected a BigModel entry`);
      process.exit(1);
    }
  }
}

// Pin the OAuth provider list. Upstream builds it as
//   function X(e=process.env){return{providers:[bigmodel(e),zai(e),zaiCn(e)]}}
// and the login UI renders exactly this list, so reducing it to one factory
// locks both the login button and the resulting account region.
const hostFile = path.join(asarDir, 'out', 'host', 'index.js');
const source = fs.readFileSync(hostFile, 'utf8');
const runtimeConfig =
  /function\s+([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*)\s*=\s*process\.env\)\s*\{\s*return\s*\{\s*providers:\s*\[\s*([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*)\)\s*,\s*([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*)\)\s*,\s*([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*)\)\s*\]\s*\}\s*\}/g;
const matches = [...source.matchAll(runtimeConfig)];

if (matches.length !== 1) {
  console.error(`patch: expected one OAuth runtime config, found ${matches.length}`);
  process.exit(1);
}

const [, fn, param, bigmodelFactory, bigmodelArg, zaiFactory, zaiArg, zaiCnFactory, zaiCnArg] =
  matches[0];

if (bigmodelArg !== zaiArg || zaiArg !== zaiCnArg) {
  console.error('patch: OAuth factories use different arguments, upstream layout changed');
  process.exit(1);
}

const kept =
  edition === 'bigmodel' ? bigmodelFactory : edition === 'zai-cn' ? zaiCnFactory : zaiFactory;
const replacement = `function ${fn}(${param}=process.env){return{providers:[${kept}(${bigmodelArg})]}}`;
const patched = source.replace(runtimeConfig, replacement);

if (patched === source) {
  console.error('patch: OAuth runtime config was not rewritten');
  process.exit(1);
}

fs.writeFileSync(hostFile, patched);
console.log(`patch: OAuth login pinned to ${edition} (${kept})`);
