#!/usr/bin/env node
// The macOS build ships skill dependency manifests that pin darwin/win32
// artifacts.  The application resolves `dependencies.<platform>.json` at
// runtime (see install_deps.py `_resolve_platform_variant`), so we emit a
// linux variant that lets pip/npm resolve the current platform instead of
// forcing macOS wheels onto Linux.
'use strict';

const fs = require('fs');
const path = require('path');

const skillsDir = process.argv[2];
if (!skillsDir) {
  console.error('usage: patch-skill-manifests.js <skills-dir>');
  process.exit(2);
}

const PLATFORM_RE = /darwin|win32|windows|macosx/i;

let written = 0;
for (const skill of fs.readdirSync(skillsDir)) {
  const src = path.join(skillsDir, skill, 'dependencies.json');
  if (!fs.existsSync(src)) continue;

  const manifest = JSON.parse(fs.readFileSync(src, 'utf8'));
  for (const layer of Object.values(manifest.layers || {})) {
    for (const kind of ['pip', 'npm']) {
      if (!Array.isArray(layer[kind])) continue;
      layer[kind] = layer[kind].filter((dep) => {
        // Platform-specific companion packages (e.g. @img/sharp-darwin-x64)
        // must not be installed on Linux.
        if (PLATFORM_RE.test(dep.name || '')) return false;
        if (dep.artifact && PLATFORM_RE.test(dep.artifact.path || '')) {
          delete dep.artifact;
        }
        return true;
      });
    }
    for (const tool of layer.system || []) {
      // Linux installs come from the distribution (see PKGBUILD optdepends).
      // install_deps.py probes PATH first; when the tool is absent it treats
      // "unsupported" as a clean skip instead of a hard failure.
      if (!tool.linux) tool.linux = { method: 'unsupported' };
    }
  }

  fs.writeFileSync(
    path.join(skillsDir, skill, 'dependencies.linux.json'),
    `${JSON.stringify(manifest, null, 2)}\n`
  );
  written++;
}

console.log(`linux skill manifests written: ${written}`);
