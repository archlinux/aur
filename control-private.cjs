'use strict';
const fs = require('node:fs');
const path = require('node:path');
const os = require('node:os');
const crypto = require('node:crypto');
const { spawn } = require('node:child_process');
const fail = code => { throw Object.assign(new Error(code), { code }); };
function directory(dir) {
  dir = path.resolve(dir);
  let current = path.parse(dir).root;
  for (const part of dir.slice(current.length).split(path.sep)) {
    current = path.join(current, part);
    if (!fs.existsSync(current)) fs.mkdirSync(current, { mode: 0o700 });
    const stat = fs.lstatSync(current);
    if (!stat.isDirectory() || stat.isSymbolicLink()) fail('UNSAFE_DIRECTORY');
    if (stat.uid !== 0 && stat.uid !== process.getuid()) fail('UNSAFE_DIRECTORY');
    if ((stat.mode & 0o022) && !(stat.mode & 0o1000)) fail('UNSAFE_DIRECTORY');
  }
  const stat = fs.lstatSync(dir);
  if (stat.uid !== process.getuid() || (stat.mode & 0o777) !== 0o700) fail('UNSAFE_DIRECTORY');
  return dir;
}
function read(file) {
  const fd = fs.openSync(file, fs.constants.O_RDONLY | fs.constants.O_NOFOLLOW);
  try {
    const stat = fs.fstatSync(fd);
    if (!stat.isFile() || stat.uid !== process.getuid() || (stat.mode & 0o777) !== 0o600 || stat.size > 65536) fail('UNSAFE_FILE');
    return JSON.parse(fs.readFileSync(fd, 'utf8'));
  } finally { fs.closeSync(fd); }
}
function syncDir(dir) { const fd = fs.openSync(dir, 'r'); try { fs.fsyncSync(fd); } finally { fs.closeSync(fd); } }
function write(file, value) {
  const temp = `${file}.${crypto.randomBytes(12).toString('hex')}`;
  const fd = fs.openSync(temp, 'wx', 0o600);
  try { fs.writeFileSync(fd, JSON.stringify(value)); fs.fsyncSync(fd); } finally { fs.closeSync(fd); }
  fs.renameSync(temp, file); syncDir(path.dirname(file));
}
function key(file) {
  try {
    const value = read(file)?.key;
    if (typeof value !== 'string' || !/^[a-f0-9]{64}$/.test(value)) fail('INVALID_KEY');
    return value;
  } catch (e) { if (e instanceof SyntaxError) fail('INVALID_KEY'); if (e.code !== 'ENOENT') throw e; }
  const value = crypto.randomBytes(32).toString('hex');
  const fd = fs.openSync(file, 'wx', 0o600);
  try { fs.writeFileSync(fd, JSON.stringify({ key: value })); fs.fsyncSync(fd); } finally { fs.closeSync(fd); }
  syncDir(path.dirname(file)); return value;
}
function socketPath(runtime) {
  const socket = path.join(path.resolve(runtime), 'control.sock');
  if (Buffer.byteLength(socket) > (process.platform === 'linux' ? 107 : 103)) fail('SOCKET_PATH_TOO_LONG');
  return socket;
}
async function lock(file) {
  const fd = fs.openSync(file, fs.constants.O_CREAT | fs.constants.O_RDWR | fs.constants.O_NOFOLLOW, 0o600);
  try {
    const stat = fs.fstatSync(fd);
    if (!stat.isFile() || stat.uid !== process.getuid() || (stat.mode & 0o777) !== 0o600 || stat.nlink !== 1) fail('UNSAFE_FILE');
    // Linux flock locks the shared open-file-description, not the child PID.
    // The parent retains this same description after the short-lived helper exits.
    const code = await new Promise((resolve, reject) => {
      const child = spawn('/usr/bin/flock', ['--exclusive', '--nonblock', '3'], { stdio: ['ignore', 'ignore', 'ignore', fd] });
      child.once('error', () => reject(Object.assign(new Error('LOCK_UNAVAILABLE'), { code: 'LOCK_UNAVAILABLE' })));
      child.once('close', resolve);
    });
    if (code !== 0) fail(code === 1 ? 'SERVICE_ALREADY_RUNNING' : 'LOCK_UNAVAILABLE');
    let held = true;
    return () => { if (held) { held = false; fs.closeSync(fd); } };
  } catch (error) { fs.closeSync(fd); throw error; }
}
function paths() {
  const runtime = process.env.WHATSAPP_CONTROLS_RUNTIME_DIR || (process.env.XDG_RUNTIME_DIR && path.join(process.env.XDG_RUNTIME_DIR, 'whatsapp-controls'));
  if (!runtime) fail('RUNTIME_REQUIRED');
  socketPath(runtime);
  return { runtime: directory(runtime), state: directory(process.env.WHATSAPP_CONTROLS_STATE_DIR || path.join(process.env.XDG_STATE_HOME || path.join(os.homedir(), '.local/state'), 'whatsapp-controls')) };
}
const digest = value => crypto.createHash('sha256').update(JSON.stringify(value)).digest('hex');
const mac = (key, value) => crypto.createHmac('sha256', key).update(JSON.stringify(value)).digest('hex');
module.exports = { directory, read, write, key, paths, digest, mac, fail, syncDir, socketPath, lock };
