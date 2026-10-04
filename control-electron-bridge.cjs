'use strict';

const fs = require('node:fs');
const path = require('node:path');
const { createHash, randomUUID } = require('node:crypto');
const { adapterSource } = require('./adapter.cjs');
const { diagnosticsResult } = require('./requests.cjs');
const ORIGIN = 'https://web.whatsapp.com';
const WA_HASH = '5bfb88027f14a4d8c9e319374e8bb4083201906881cf8c74f75789b32e4106bd';

function allowed(frame, contents) {
  return frame && frame === contents.mainFrame && frame.origin === ORIGIN &&
    new URL(frame.url).origin === ORIGIN && !frame.detached;
}
function parseResult(value) {
  if (typeof value !== 'string' || Buffer.byteLength(value) > 4 * 1024 * 1024) {
    throw new Error('INCOMPATIBLE');
  }
  return JSON.parse(value);
}
function validateSnapshot(result) {
  if (!result || typeof result.account !== 'string' || result.account.length > 160 ||
      !Number.isSafeInteger(result.epoch) || !Number.isSafeInteger(result.observed_at) ||
      !Array.isArray(result.conversations) || result.conversations.length > 10000) {
    throw new Error('INCOMPATIBLE');
  }
  const ids = new Set();
  for (const row of result.conversations) {
    if (!row || typeof row.id !== 'string' || row.id.length > 160 || ids.has(row.id) ||
        typeof row.name !== 'string' || row.name.length > 512 ||
        !['chat', 'group'].includes(row.type) ||
        (row.last_activity !== null && !Number.isSafeInteger(row.last_activity)) ||
        (row.unread !== undefined && (!Number.isSafeInteger(row.unread) || row.unread < 0))) {
      throw new Error('INCOMPATIBLE');
    }
    ids.add(row.id);
  }
  return result;
}
function createBridge(contents, bundlePath = path.join(__dirname, 'vendor', 'wppconnect-wa.js'), expectedVersion, deadline = 10000) {
  if (expectedVersion !== undefined && (typeof expectedVersion !== 'string' || !/^2\.\d+\.\d+$/.test(expectedVersion))) {
    throw new Error('WEB_VERSION_REQUIRED');
  }
  const bundle = fs.readFileSync(bundlePath, 'utf8');
  if (createHash('sha256').update(bundle).digest('hex') !== WA_HASH) {
    throw new Error('ADAPTER_CHECKSUM');
  }
  let generation = randomUUID();
  let injected = false;
  let injecting;
  let active;
  let quarantined = false;
  let navigating = false;
  const invalidateReadiness = () => {
    generation = randomUUID(); injected = false; injecting = undefined;
    navigating = true;
  };
  contents.on('did-start-navigation', (_event, _url, inPlace, main) => {
    if (main && !inPlace) invalidateReadiness();
  });
  contents.on('did-navigate', () => {
    invalidateReadiness();
    active = undefined; quarantined = false; navigating = false;
  });
  contents.on('render-process-gone', () => {
    invalidateReadiness(); active = undefined; quarantined = false;
  });
  contents.on('destroyed', invalidateReadiness);
  async function ready(operation) {
    const frame = contents.mainFrame;
    const captured = generation;
    const check = () => {
      if (navigating || captured !== generation || contents.isDestroyed() || !allowed(frame, contents)) {
        throw new Error('NOT_READY');
      }
    };
    check();
    if (!injected) {
      if (!injecting) injecting = (async () => {
        await frame.executeJavaScript(bundle);
        check();
        injected = true;
      })();
      await injecting;
    }
    check();
    if (operation !== 'version') {
      if (!expectedVersion) throw new Error('WEB_VERSION_REQUIRED');
      if (await frame.executeJavaScript(adapterSource(expectedVersion)) !== true) throw new Error('NOT_READY');
    }
    check();
    return { frame, captured, check };
  }
  async function execute(operation, payload) {
      const { frame, captured, check } = await ready(operation);
      if (operation === 'version') {
        const version = await frame.executeJavaScript("window.WPP?.version === '4.6.0' && window.WPP.isFullReady && typeof window.WPP.conn?.getBuildConstants === 'function' ? window.WPP.conn.getBuildConstants()?.VERSION_STR : null");
        check();
        if (typeof version !== 'string' || !/^2\.\d+\.\d+$/.test(version)) throw new Error('NOT_READY');
        return { version, pinned: expectedVersion === version };
      }
      if (operation === 'diagnostics') {
        const value = parseResult(await frame.executeJavaScript('window.__whatsappControls.diagnostics()'));
        check();
        return diagnosticsResult(value);
      }
      const raw = validateSnapshot(parseResult(await frame.executeJavaScript(
        'window.__whatsappControls.snapshot()')));
      check();
      const account = raw.account;
      const current = `${captured}:${raw.epoch}`;
      if (operation === 'snapshot') {
        return { generation: current, account, observed_at: raw.observed_at,
          conversations: raw.conversations.map(({ id, name, type, last_activity, unread }) =>
            ({ id, name, type, last_activity, ...(unread === undefined ? {} : { unread }) })) };
      }
      if (operation !== 'send' || !payload || payload.generation !== current ||
          payload.account !== account || typeof payload.text !== 'string' ||
          !payload.text.length || payload.text.length > 4096 || typeof payload.id !== 'string' ||
          typeof payload.name !== 'string' || !['chat', 'group'].includes(payload.type)) {
        throw new Error('STALE');
      }
      const row = raw.conversations.find((item) => item.id === payload.id);
      if (!row || row.name !== payload.name || row.type !== payload.type) throw new Error('STALE');
      const argumentsJson = JSON.stringify({ account: raw.account, epoch: raw.epoch,
        id: row.id, name: row.name, type: row.type, text: payload.text });
      check();
      const result = parseResult(await frame.executeJavaScript(
        `window.__whatsappControls.send(${argumentsJson})`));
      check();
      if (!result || !['submitted', 'server_ack', 'delivered'].includes(result.state)) {
        throw new Error('UNCERTAIN');
      }
      return { state: result.state };
  }
  async function request(operation, payload) {
    const unhealthy = () => Object.assign(new Error('BRIDGE_QUARANTINED'), { code: 'BRIDGE_QUARANTINED' });
    if (quarantined) throw unhealthy();
    if (active) throw new Error('BUSY');
    const token = Symbol('dispatch');
    active = token;
    let timer;
    try {
      return await Promise.race([execute(operation, payload), new Promise((_resolve, reject) => {
        timer = setTimeout(() => {
          // A send may still execute. Only replacing the document restores this lane.
          if (active === token) quarantined = true;
          reject(unhealthy());
        }, deadline);
      })]);
    } finally {
      clearTimeout(timer);
      if (active === token) active = undefined;
    }
  }
  return { request };
}

module.exports = { createBridge, allowed, validateSnapshot, WA_HASH };
