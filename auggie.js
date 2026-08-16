#!/usr/bin/node
// Pacman-managed wrapper: disable daemon auto-update and block npm self-upgrade.
process.env.AUGMENT_DISABLE_AUTO_UPDATE = '1';
const REAL = '/usr/lib/node_modules/@augmentcode/auggie/augment.mjs';
const MSG = 'Update with your AUR helper.';
function deny() {
  console.error(MSG);
  process.exit(1);
}
const cmd = process.argv.slice(2).find((a) => a !== '--' && !String(a).startsWith('-'));
if (cmd === 'update' || cmd === 'upgrade') deny();
const cp = require('child_process');
function blocked(file, args) {
  const name = String(file).replace(/\\/g, '/').split('/').pop();
  if (name !== 'npm' && name !== 'npm.cmd') return false;
  return (args || []).some((a) => String(a).includes('@augmentcode/auggie'));
}
for (const k of ['execFileSync', 'execFile', 'spawn', 'spawnSync']) {
  const orig = cp[k];
  cp[k] = function (file, args) {
    if (blocked(file, Array.isArray(args) ? args : [])) deny();
    return orig.apply(this, arguments);
  };
}
process.argv[1] = REAL;
import(require('url').pathToFileURL(REAL).href);
