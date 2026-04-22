'use strict';

const fs = require('fs');
const path = require('path');
const { app } = require('electron');

const hasSwitch = (name) =>
  process.argv.some((arg) => arg === `--${name}` || arg.startsWith(`--${name}=`));

const sanitize = (value) =>
  String(value || '')
    .trim()
    .toLowerCase()
    .replace(/\s+/g, '-')
    .replace(/[^a-z0-9._-]/g, '');

const findPackagePath = () => {
  const candidates = [path.join(process.cwd(), 'package.json')];

  for (const arg of process.argv.slice(1)) {
    if (!arg || arg.startsWith('-')) {
      continue;
    }

    const resolved = path.resolve(arg);
    if (fs.existsSync(resolved) && fs.statSync(resolved).isDirectory()) {
      candidates.push(path.join(resolved, 'package.json'));
      break;
    }
  }

  return candidates.find((candidate) => fs.existsSync(candidate));
};

if (process.platform === 'linux') {
  try {
    const pkgPath = findPackagePath();
    if (pkgPath) {
      const pkg = JSON.parse(fs.readFileSync(pkgPath, 'utf8'));
      const displayName = String(pkg.productName || pkg.name || '').trim();
      const appId = sanitize(pkg.name || pkg.productName || path.basename(path.dirname(pkgPath)));

      const applyIdentity = () => {
        if (displayName) {
          app.setName(displayName);
        }

        if (appId) {
          app.setDesktopName(`${appId}.desktop`);
        }
      };

      if (appId && !hasSwitch('class')) {
        app.commandLine.appendSwitch('class', appId);
      }

      if (appId && !hasSwitch('name')) {
        app.commandLine.appendSwitch('name', appId);
      }

      applyIdentity();
      app.once('ready', applyIdentity);
    }
  } catch {
    // Keep startup resilient for all apps.
  }
}
