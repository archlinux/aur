'use strict';

const { app, shell } = require('electron');
const ORIGIN = 'https://web.whatsapp.com';
const sessions = new WeakSet();
let installed = false;

function internal(url) {
  try { return new URL(url).origin === ORIGIN; } catch { return false; }
}
function checkRuntime() {
  for (const flag of ['no-sandbox', 'disable-web-security', 'ignore-certificate-errors',
    'remote-debugging-port', 'remote-debugging-pipe']) {
    if (app.commandLine.hasSwitch(flag)) throw new Error('UNSAFE_RUNTIME_FLAG');
  }
}
function install() {
  if (installed) return;
  installed = true;
  checkRuntime();
  if (!app.isReady()) app.enableSandbox();
  // webRequest also covers programmatic loadURL, which bypasses will-navigate.
  app.on('web-contents-created', (_event, contents) => {
    contents.on('will-attach-webview', (event) => event.preventDefault());
    if (!sessions.has(contents.session)) {
      sessions.add(contents.session);
      contents.session.webRequest.onBeforeRequest((details, callback) => {
        callback({ cancel: details.resourceType === 'mainFrame' && !internal(details.url) });
      });
    }
  });
}
function attach(window) {
  checkRuntime();
  const contents = window.webContents;
  const session = contents.session;
  session.spellCheckerEnabled = true;
  contents.setWindowOpenHandler(({ url }) => {
    try {
      const parsed = new URL(url);
      if (['https:', 'http:'].includes(parsed.protocol)) void shell.openExternal(parsed.href);
    } catch { /* Malformed links are denied. */ }
    return { action: 'deny' };
  });
  contents.on('will-navigate', (event, url) => { if (!internal(url)) event.preventDefault(); });
  contents.on('will-redirect', (event, url) => { if (!internal(url)) event.preventDefault(); });
  const permissions = new Set(['notifications', 'media']);
  session.setPermissionCheckHandler((sender, permission, origin, details) =>
    sender === contents && internal(contents.getURL()) && origin === ORIGIN &&
    details.isMainFrame === true && permissions.has(permission));
  session.setPermissionRequestHandler((sender, permission, callback, details) => {
    callback(sender === contents && internal(contents.getURL()) &&
      internal(details.requestingUrl) && details.isMainFrame === true && permissions.has(permission));
  });
}

module.exports = { install, attach, internal };
