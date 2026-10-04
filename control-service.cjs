'use strict';
const net = require('node:net');
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const p = require('./private.cjs');
const { fields, diagnosticsResult } = require('./requests.cjs');
const { Controls } = require('./core.cjs');
const MAX_LINE = 32768, MAX_RESPONSE = 524288;
const SAFE = new Set(['INVALID_REQUEST', 'INVALID_CURSOR', 'STALE_SNAPSHOT', 'CAPACITY', 'REQUEST_CONFLICT', 'TARGET_NOT_OBSERVED', 'STALE_IDENTITY', 'APPROVAL_REQUIRED', 'AMBIGUOUS_TARGET', 'INVALID_SNAPSHOT', 'BRIDGE_UNAVAILABLE', 'BRIDGE_QUARANTINED', 'UNAUTHORIZED', 'TOO_LARGE']);
function ipcBridge(timeout = 15000) {
  const pending = new Map(); let closed = false;
  const onMessage = message => {
    if (message?.kind !== 'response' || typeof message.id !== 'string') return;
    const entry = pending.get(message.id); if (!entry) return;
    clearTimeout(entry.timer); pending.delete(message.id);
    if (message.ok === true) entry.resolve(message.result);
    else { const code = message.error === 'BRIDGE_QUARANTINED' ? message.error : 'BRIDGE_UNAVAILABLE'; entry.reject(Object.assign(new Error(code), { code })); }
  };
  process.on('message', onMessage);
  const bridge = (operation, payload) => new Promise((resolve, reject) => {
    if (closed || !process.connected) return reject(new Error('BRIDGE_UNAVAILABLE'));
    const id = crypto.randomUUID();
    const timer = setTimeout(() => { pending.delete(id); reject(new Error('BRIDGE_UNAVAILABLE')); }, timeout);
    pending.set(id, { resolve, reject, timer });
    process.send({ kind: 'request', id, operation, payload }, error => {
      if (error) { clearTimeout(timer); pending.delete(id); reject(new Error('BRIDGE_UNAVAILABLE')); }
    });
  });
  bridge.close = () => {
    closed = true; process.removeListener('message', onMessage);
    for (const entry of pending.values()) { clearTimeout(entry.timer); entry.reject(new Error('BRIDGE_UNAVAILABLE')); }
    pending.clear();
  };
  return bridge;
}
async function start({ runtime, state, bridge }) {
  const socketPath = p.socketPath(runtime);
  p.directory(runtime); p.directory(state);
  const unlock = [];
  const record = path.join(runtime, 'connection.json');
  let server;
  try {
    for (const file of new Set([path.resolve(state, 'service.lock'), path.resolve(runtime, 'service.lock')])) unlock.push(await p.lock(file));
    try {
      const old = fs.lstatSync(socketPath);
      if (!old.isSocket() || old.uid !== process.getuid()) p.fail('UNSAFE_SOCKET');
      fs.unlinkSync(socketPath);
    } catch (error) { if (error.code !== 'ENOENT') throw error; }
    const controls = new Controls(state, bridge), secret = crypto.randomBytes(32).toString('hex');
    let connections = 0, inflight = 0, closing = false, drained;
    const sockets = new Set();
    server = net.createServer(socket => {
      if (closing || connections >= 16) return socket.destroy();
      connections++; sockets.add(socket);
      socket.once('close', () => { connections--; sockets.delete(socket); }); socket.on('error', () => {});
      socket.setTimeout(20000, () => socket.destroy());
      let buffer = Buffer.alloc(0), handled = false;
      const reply = value => {
        const text = JSON.stringify(value);
        socket.end((Buffer.byteLength(text) > MAX_RESPONSE ? '{"ok":false,"error":"TOO_LARGE"}' : text) + '\n');
      };
      socket.on('data', async chunk => {
        if (handled) return;
        buffer = Buffer.concat([buffer, chunk]);
        if (buffer.length > MAX_LINE) { handled = true; return reply({ ok: false, error: 'TOO_LARGE' }); }
        const end = buffer.indexOf(10); if (end < 0) return;
        handled = true;
        if (inflight >= 16) return reply({ ok: false, error: 'CAPACITY' });
        inflight++;
        try {
          if (end !== buffer.length - 1) p.fail('INVALID_REQUEST');
          let request; try { request = JSON.parse(buffer.subarray(0, end).toString('utf8')); } catch { p.fail('INVALID_REQUEST'); }
          fields(request, ['secret', 'operation', 'payload']);
          if (typeof request.secret !== 'string' || request.secret.length !== secret.length || !crypto.timingSafeEqual(Buffer.from(request.secret), Buffer.from(secret))) p.fail('UNAUTHORIZED');
          let result;
          switch (request.operation) {
            case 'conversations.list': result = await controls.list(request.payload); break;
            case 'messages.send': result = await controls.send(request.payload); break;
            case 'approval.prepare': result = await controls.prepare(request.payload); break;
            case 'status': fields(request.payload, []); result = { state: 'service_ready', adapter: 'unchecked' }; break;
            case 'runtime.version': {
              fields(request.payload, []);
              const value = await bridge('version', {});
              if (!value || typeof value.version !== 'string' || !/^2\.\d+\.\d+$/.test(value.version) || typeof value.pinned !== 'boolean') p.fail('INVALID_SNAPSHOT');
              result = { version: value.version, pinned: value.pinned };
              break;
            }
            case 'runtime.diagnostics': {
              fields(request.payload, []);
              const value = await bridge('diagnostics', {});
              result = diagnosticsResult(value);
              break;
            }
            default: p.fail('INVALID_REQUEST');
          }
          reply({ ok: true, result });
        } catch (error) { reply({ ok: false, error: SAFE.has(error.code) ? error.code : 'OPERATION_FAILED' }); }
        finally { inflight--; if (!inflight) drained?.(); }
      });
    });
    await new Promise((resolve, reject) => { server.once('error', reject); server.listen(socketPath, resolve); });
    fs.chmodSync(socketPath, 0o600); p.write(record, { secret, socket: socketPath });
    return { server, controls, close: async () => {
      closing = true;
      const serverClosed = new Promise(resolve => server.close(resolve));
      for (const socket of sockets) socket.destroy();
      bridge.close?.();
      if (inflight) await new Promise(resolve => { drained = resolve; });
      await serverClosed;
      fs.rmSync(record, { force: true });
      for (const release of unlock.reverse()) release();
    } };
  } catch (error) { server?.close(); for (const release of unlock.reverse()) release(); throw error; }
}
if (require.main === module) {
  if (!process.send || !process.connected) { process.stderr.write('INHERITED_IPC_REQUIRED\n'); process.exitCode = 1; }
  else {
    process.umask(0o077);
    Promise.resolve().then(() => start({ ...p.paths(), bridge: ipcBridge() })).then(service => {
      let closing = false;
      const stop = () => { if (!closing) { closing = true; service.close().finally(() => process.exit(0)); } };
      process.on('disconnect', stop); process.on('SIGTERM', stop); process.on('SIGINT', stop);
      process.send({ kind: 'ready' });
    }).catch(error => {
      process.stderr.write(error.code === 'SOCKET_PATH_TOO_LONG' ? 'SOCKET_PATH_TOO_LONG: set WHATSAPP_CONTROLS_RUNTIME_DIR to a shorter private directory\n' : error.code === 'SERVICE_ALREADY_RUNNING' ? 'SERVICE_ALREADY_RUNNING\n' : 'SERVICE_START_FAILED\n');
      process.exit(1);
    });
  }
}
module.exports = { start, ipcBridge };
