'use strict';

const fs = require('node:fs');
const path = require('node:path');
const { createHash } = require('node:crypto');
const { WA_HASH } = require('./control/electron-bridge.cjs');

function patch(application, bundle, controls = true) {
  const runtimeModule = controls ? 'electron-main.cjs' : 'electron-shell.cjs';
  const mainPath = path.join(application, 'lib/main.js');
  let main = fs.readFileSync(mainPath, 'utf8');
  if (createHash('sha256').update(main).digest('hex') !==
      'c1c720603c33896d213b06f7d2c056f6a5dd38874365bd9a816675c9d5fa6654') {
    throw new Error('Nativefier 52.0.0 main bundle checksum mismatch');
  }
  const replace = (from, to) => {
    if (main.split(from).length !== 2) throw new Error('Nativefier patch anchor mismatch');
    main = main.replace(from, to);
  };
  const body = (start, end, replacement) => {
    const first = main.indexOf(start);
    const last = main.indexOf(end, first);
    if (first < 0 || last <= first) throw new Error('Nativefier function anchor missing');
    replace(main.slice(first, last), replacement);
  };
  replace("    electron_1.app.commandLine.appendSwitch('ignore-certificate-errors');",
    "    throw new Error('UNSAFE_CERTIFICATE_CONFIGURATION');");
  body('async function createLoginWindow(loginCallback, parent) {',
    'exports.createLoginWindow = createLoginWindow;',
    'async function createLoginWindow() { throw new Error("HTTP login windows disabled"); }\n');
  body('function createNewWindow(options, setupWindow, url, parent) {',
    'exports.createNewWindow = createNewWindow;',
    'function createNewWindow() { throw new Error("Additional app windows disabled"); }\n');
  replace('            ...webPreferences,\n', `            ...webPreferences,
            nodeIntegration: false,
            nodeIntegrationInWorker: false,
            nodeIntegrationInSubFrames: false,
            contextIsolation: true,
            sandbox: true,
            webSecurity: true,
            allowRunningInsecureContent: false,
            webviewTag: false,
            preload: path_1.default.join(__dirname, '../control/electron-preload.cjs'),
`);
  body('    mainWindow.webContents.setWindowOpenHandler((details) => {',
    '    if (options.counter) {', '');
  body("    electron_1.ipcMain.on('notification-click', () => {",
    '    if (options.clearCache) {',
    `    require('../control/${runtimeModule}').attach(mainWindow);\n`);
  body('function setupSessionPermissionHandler(window) {',
    'function setupNotificationBadge(options, window, setDockBadge) {', '');
  body('function setupSessionInteraction(window) {', '\n\n/***/ }),', '');
  body('    window.webContents.on(\'will-navigate\', (event, url) => {',
    "    window.webContents.on('will-prevent-unload', onWillPreventUnload);", '');
  replace('    (0, windowHelpers_1.sendParamsOnDidFinishLoad)(options, window);\n', '');
  // The notification preload is gone; no renderer-originated notification IPC remains.
  body("    electron_1.ipcMain.on('notification', () => {", "    window.on('focus', () => {", '');
  body("            electron_1.ipcMain.on('notification', () => {", "            mainWindow.on('focus', () => {", '');
  main = `require('../control/${runtimeModule}').install();\n` + main;
  for (const forbidden of ['session-interaction', 'desktop-capturer-get-sources', "ipcMain.on('notification'"]) {
    if (main.includes(forbidden)) throw new Error('Unsafe Nativefier handler remains');
  }
  if (controls) {
    const asset = fs.readFileSync(bundle);
    if (createHash('sha256').update(asset).digest('hex') !== WA_HASH) throw new Error('WA-JS checksum mismatch');
  }
  const destination = path.join(application, 'control');
  fs.mkdirSync(destination, { recursive: true });
  for (const entry of fs.readdirSync(path.join(__dirname, 'control'))) {
    if (entry.endsWith('.cjs') && !entry.includes('.test.') && !entry.startsWith('fixture') &&
        (controls || ['electron-shell.cjs', 'electron-preload.cjs'].includes(entry))) {
      fs.copyFileSync(path.join(__dirname, 'control', entry), path.join(destination, entry));
    }
  }
  if (controls) {
    fs.mkdirSync(path.join(destination, 'vendor'), { recursive: true });
    fs.copyFileSync(bundle, path.join(destination, 'vendor/wppconnect-wa.js'));
  }
  fs.copyFileSync(path.join(__dirname, 'control/electron-preload.cjs'), path.join(application, 'lib/preload.js'));
  fs.writeFileSync(mainPath, main);
}

if (require.main === module) {
  if (process.argv.length !== 4) { console.error('Usage: node patch-nativefier.cjs APP_DIR WA_JS_BUNDLE|--plain'); process.exitCode = 2; }
  else { patch(process.argv[2], process.argv[3], process.argv[3] !== '--plain'); console.log('Nativefier security patch applied'); }
}
module.exports = { patch };
