#!/usr/bin/env node
// Runtime smoke test for the assembled app tree. Every native component that
// the app loads on Linux is exercised against the exact Electron / Node
// runtimes the package ships.
//
//   ELECTRON_RUN_AS_NODE=1 app/workbuddy verify-native.cjs <app-dir>
//   app/resources/runtime/node/bin/node verify-native.cjs <app-dir> --cli
'use strict';

const fs = require('node:fs');
const path = require('node:path');
const { execFileSync } = require('node:child_process');

const appDir = process.argv[2];
const cliMode = process.argv.includes('--cli');
if (!appDir) {
  console.error('usage: verify-native.cjs <app-dir> [--cli]');
  process.exit(2);
}

const failures = [];
const ok = (name, detail) => console.log(`ok   ${name}${detail ? ` (${detail})` : ''}`);
const fail = (name, error) => {
  failures.push(name);
  console.error(`FAIL ${name}: ${error && error.message ? error.message : error}`);
};
const check = (name, fn) => {
  try {
    ok(name, fn());
  } catch (error) {
    fail(name, error);
  }
};
const checkAsync = async (name, fn) => {
  try {
    ok(name, await fn());
  } catch (error) {
    fail(name, error);
  }
};

// The application lives in a shadow ASAR whose files are all materialized in
// <app.asar>.unpacked, so that tree is what the runtime physically loads.
const payload = path.join(appDir, 'resources', 'app.asar.unpacked');
const modulePath = (sub = '') => path.join(payload, sub, 'node_modules');

function sqlite() {
  const { DatabaseSync } = require('node:sqlite');
  const db = new DatabaseSync(':memory:');
  db.exec('create table smoke (id integer primary key, value text not null)');
  db.prepare('insert into smoke (value) values (?)').run('ok');
  const row = db.prepare('select count(*) as n from smoke').get();
  db.close();
  if (row.n !== 1) throw new Error(`unexpected row count ${row.n}`);
  return 'CRUD ok';
}

function koffi(root) {
  const api = require(path.join(root, 'koffi'));
  const libc = api.load('libc.so.6');
  const getpid = libc.func('int getpid()');
  const pid = getpid();
  if (pid !== process.pid) throw new Error(`getpid ${pid} != ${process.pid}`);
  return `getpid ${pid}`;
}

function pty(root) {
  const ptyApi = require(path.join(root, '@lydell', 'node-pty'));
  return new Promise((resolve, reject) => {
    let output = '';
    const child = ptyApi.spawn('/bin/sh', ['-c', 'printf pty-ok'], {
      name: 'xterm-color',
      cols: 80,
      rows: 24,
      cwd: '/',
      env: { ...process.env, TERM: 'xterm-color' },
    });
    const timer = setTimeout(() => {
      try {
        child.kill();
      } catch {}
      reject(new Error('pty timeout'));
    }, 15000);
    child.onData((data) => {
      output += data;
    });
    child.onExit(({ exitCode }) => {
      clearTimeout(timer);
      if (exitCode !== 0) return reject(new Error(`pty exit ${exitCode}`));
      if (!output.includes('pty-ok')) return reject(new Error(`pty output ${JSON.stringify(output)}`));
      resolve('spawn ok');
    });
  });
}

function nativeBinary(relative, args) {
  const binary = path.join(payload, relative);
  if (!fs.existsSync(binary)) throw new Error(`missing ${relative}`);
  if (!(fs.statSync(binary).mode & 0o111)) throw new Error(`not executable: ${relative}`);
  // A binary that prints a version line and then exits non-zero is still
  // broken; only a clean exit proves the native image loaded.
  const out = execFileSync(binary, args, {
    timeout: 20000,
    encoding: 'utf8',
    stdio: ['ignore', 'pipe', 'pipe'],
  });
  return out.trim().split('\n')[0] || 'ok';
}

const roots = [modulePath()];
if (cliMode) roots.push(modulePath('cli'));

(async () => {
  check('node:sqlite', sqlite);

  for (const root of roots) {
    const tag = root.includes(`${path.sep}cli${path.sep}`) ? 'cli ' : '';
    if (fs.existsSync(path.join(root, 'koffi'))) check(`${tag}koffi`, () => koffi(root));
    if (fs.existsSync(path.join(root, '@lydell', 'node-pty'))) {
      await checkAsync(`${tag}@lydell/node-pty`, () => pty(root));
    }
    if (fs.existsSync(path.join(root, 'node-pty'))) {
      await checkAsync(`${tag}node-pty`, async () => {
        const loader = require(path.join(root, 'node-pty'));
        return new Promise((resolve, reject) => {
          const child = loader.spawn('/bin/sh', ['-c', 'printf pty-ok'], { name: 'xterm', cols: 80, rows: 24, cwd: '/', env: process.env });
          let output = '';
          const timer = setTimeout(() => {
            try {
              child.kill();
            } catch {}
            reject(new Error('pty timeout'));
          }, 15000);
          child.onData((data) => {
            output += data;
          });
          child.onExit(({ exitCode }) => {
            clearTimeout(timer);
            if (exitCode !== 0 || !output.includes('pty-ok')) return reject(new Error(`exit ${exitCode}`));
            resolve('spawn ok');
          });
        });
      });
    }
  }

  // os-bridge only backs the Windows notification probe; the Linux build of
  // that package exists for x64 only, so it is checked when present.
  const osBridge = `os-bridge-${process.platform}-${process.arch}-gnu`;
  if (fs.existsSync(path.join(modulePath(), '@ban-dal', osBridge))) {
    check(osBridge, () => (require(path.join(modulePath(), '@ban-dal', 'os-bridge')), 'loaded'));
  }
  const qimei = path.join(modulePath(), '@tencent', 'qimei-node');
  if (fs.existsSync(qimei)) check('@tencent/qimei-node', () => (require(qimei), 'loaded'));

  const sandboxRoot = path.join(payload, 'cli', 'vendor', 'sandbox');
  const sandboxVersion = fs.readdirSync(sandboxRoot).sort().pop();
  check('sandbox-cli', () =>
    nativeBinary(`cli/vendor/sandbox/${sandboxVersion}/sandbox-cli`, ['--version']));

  const harnessArch = process.arch === 'arm64' ? 'arm64' : 'x64';
  check('agent-harness', () =>
    nativeBinary(`node_modules/@tencent-ai/agent-harness-linux-${harnessArch}/bin/agent-harness`, ['--version']));
  const ripgrep = fs.readdirSync(path.join(payload, 'cli', 'vendor', 'ripgrep')).find((name) => name.endsWith('-linux'));
  check('ripgrep', () => nativeBinary(`cli/vendor/ripgrep/${ripgrep}/rg`, ['--version']));

  const trashArch = process.arch === 'arm64' ? 'arm64' : 'x64';
  check('genie-trash', () => {
    fs.accessSync(path.join(payload, 'cli', 'vendor', 'genie-trash', `linux-${trashArch}`), fs.constants.X_OK);
    return 'executable';
  });

  // Reading package.json through the ASAR path proves the shadow index is
  // valid; Electron provides ASAR support, plain node does not.
  if (!cliMode && process.versions.electron) {
    check('app.asar index', () => {
      const manifest = JSON.parse(fs.readFileSync(path.join(appDir, 'resources', 'app.asar', 'package.json'), 'utf8'));
      return `${manifest.name} ${manifest.version}`;
    });
  }

  console.log(
    `runtime: ${process.versions.electron ? `electron ${process.versions.electron}` : 'node'}, ` +
      `node ${process.versions.node}, ABI ${process.versions.modules}`,
  );
  if (failures.length) {
    console.error(`\n${failures.length} native check(s) failed: ${failures.join(', ')}`);
    process.exit(1);
  }
})();
