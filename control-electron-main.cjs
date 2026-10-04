'use strict';

const path = require('node:path');
const { fork } = require('node:child_process');
const { app } = require('electron');
const { createBridge } = require('./electron-bridge.cjs');
const shell = require('./electron-shell.cjs');
function attach(window) {
  shell.attach(window);
  const contents = window.webContents;
  if (process.env.WHATSAPP_CONTROLS !== '1') return;
  const expectedVersion = process.env.WHATSAPP_CONTROLS_WEB_VERSION;
  if (expectedVersion !== undefined && !/^2\.\d+\.\d+$/.test(expectedVersion)) {
    throw new Error('WHATSAPP_CONTROLS_WEB_VERSION_REQUIRED');
  }
  if (process.versions.electron !== '44.4.1') throw new Error('UNSUPPORTED_ELECTRON');
  const bridge = createBridge(contents, undefined, expectedVersion);
  const child = fork(path.join(__dirname, 'service.cjs'), [], {
    execPath: process.execPath,
    env: { PATH: process.env.PATH, HOME: process.env.HOME,
      XDG_RUNTIME_DIR: process.env.XDG_RUNTIME_DIR, XDG_STATE_HOME: process.env.XDG_STATE_HOME,
      WHATSAPP_CONTROLS_RUNTIME_DIR: process.env.WHATSAPP_CONTROLS_RUNTIME_DIR,
      WHATSAPP_CONTROLS_STATE_DIR: process.env.WHATSAPP_CONTROLS_STATE_DIR,
      ELECTRON_RUN_AS_NODE: '1' },
    stdio: ['ignore', 'ignore', 'ignore', 'ipc'],
  });
  let active = false;
  child.on('message', async (message) => {
    if (!message || message.kind !== 'request' || typeof message.id !== 'string' ||
        message.id.length > 100 || !['snapshot', 'send', 'version', 'diagnostics'].includes(message.operation)) return;
    const reply = (value) => {
      if (child.connected) child.send({ kind: 'response', id: message.id, ...value });
    };
    if (active) { reply({ ok: false, error: 'BUSY' }); return; }
    active = true;
    try { reply({ ok: true, result: await bridge.request(message.operation, message.payload) }); }
    catch (error) { reply({ ok: false, error: message.operation === 'send' ? 'UNCERTAIN' :
      error.code === 'BRIDGE_QUARANTINED' ? 'BRIDGE_QUARANTINED' : 'NOT_READY' }); }
    finally { active = false; }
  });
  const stop = () => { if (child.connected) child.disconnect(); child.kill(); };
  contents.once('destroyed', stop);
  app.once('before-quit', stop);
  child.on('error', () => { console.error('WhatsApp controls: service unavailable'); });
}

module.exports = { install: shell.install, attach, internal: shell.internal };
