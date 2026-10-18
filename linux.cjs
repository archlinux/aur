// SPDX-License-Identifier: MIT
'use strict';

const {app, BaseWindow, Menu, Tray, globalShortcut, nativeImage, screen, shell, dialog} = require('electron');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const {spawn} = require('node:child_process');

const desktopId = 'com.google.Gemini.desktop';
const stateDir = () => path.join(process.env.XDG_STATE_HOME || path.join(os.homedir(), '.local/state'), 'gemini-desktop');
const logDir = () => path.join(stateDir(), 'logs');
const crashDir = () => path.join(stateDir(), 'Crashpad');
const autostartFile = () => path.join(process.env.XDG_CONFIG_HOME || path.join(os.homedir(), '.config'), 'autostart', desktopId);

app.setDesktopName(desktopId);
// Electron 44 uses this portal on Wayland. Preserve features from the system wrapper.
const features = new Set(app.commandLine.getSwitchValue('enable-features').split(',').filter(Boolean));
features.add('GlobalShortcutsPortal');
app.commandLine.appendSwitch('enable-features', [...features].join(','));

let emit;
let setting;
let translate = key => key;
let tray;
let native;
let mainShortcut;
let stcShortcut;
let quitting = false;

app.on('before-quit', () => {quitting = true;});

function addon() {
  if (!native) native = require('./gemini_native.node');
  return native;
}

function autostartStatus() {
  try {
    const text = fs.readFileSync(autostartFile(), 'utf8');
    return !/^Hidden\s*=\s*true\s*$/mi.test(text);
  } catch {
    return false;
  }
}

function setAutostart(enabled) {
  const filename = autostartFile();
  try {
    if (enabled) {
      fs.mkdirSync(path.dirname(filename), {recursive: true});
      const temporary = `${filename}.${process.pid}.tmp`;
      fs.writeFileSync(temporary, '[Desktop Entry]\nType=Application\nName=Gemini\n' +
        'Exec=/usr/bin/gemini-desktop --hide\nTryExec=/usr/bin/gemini-desktop\n' +
        'Icon=gemini-desktop\nTerminal=false\nX-GNOME-Autostart-enabled=true\n', {mode: 0o600});
      fs.renameSync(temporary, filename);
    } else {
      fs.rmSync(filename, {force: true});
    }
    return enabled === autostartStatus();
  } catch (error) {
    console.error('[linux] Cannot change autostart:', error.message);
    return false;
  }
}

function accelerator(shortcut) {
  if (!shortcut || shortcut === 'None') return null;
  return shortcut.split('+').map(key => ({Win: 'Super', Ctrl: 'Control'})[key] || key).join('+');
}

function mainWindow() {
  return BaseWindow.getAllWindows().find(win => !win.isDestroyed() && win.getTitle() === 'Gemini');
}

function closeToTray(event) {
  if (quitting || !emit || !tray || tray.isDestroyed()) return false;
  event.preventDefault();
  emit({cmd: 'HIDE'});
  return true;
}

function suppressShortcut() {
  if (!setting('disableShortcutInFullScreen', true)) return false;
  try {
    const info = addon().getForegroundAppInfo();
    if (!info.hwnd || info.processId === process.pid) return false;
    const b = info.bounds;
    return screen.getAllDisplays().some(({bounds: d}) =>
      Math.abs(b.x - d.x) <= 2 && Math.abs(b.y - d.y) <= 2 &&
      b.width >= d.width - 2 && b.height >= d.height - 2);
  } catch (error) {
    console.error('[linux] Cannot read foreground window:', error.message);
    return false;
  }
}

function registerMainShortcut() {
  if (mainShortcut) globalShortcut.unregister(mainShortcut);
  const shortcut = setting('shortcut', 'Ctrl+Alt+G');
  mainShortcut = accelerator(shortcut);
  let registered = !mainShortcut;
  try {
    if (mainShortcut) registered = globalShortcut.register(mainShortcut, () => {
      if (suppressShortcut()) return;
      const win = mainWindow();
      emit({cmd: win?.isVisible() && win.isFocused() ? 'HIDE' : 'SHOW'});
    });
  } catch (error) {
    console.error('[linux] Cannot register shortcut:', error.message);
  }
  emit({cmd: 'HOTKEY_STATUS', shortcut, registered, error: registered ? null : 'REGISTRATION_FAILED'});
}

function registerStcShortcut() {
  if (stcShortcut) globalShortcut.unregister(stcShortcut);
  stcShortcut = null;
  if (process.env.GEMINI_ENABLE_SPEAK_TO_WINDOW !== 'true') return;
  stcShortcut = accelerator(setting('stcShortcut', 'Alt+Shift+D'));
  if (!stcShortcut) return;
  try {
    if (!globalShortcut.register(stcShortcut, () => {
      if (!suppressShortcut()) emit({cmd: 'STC_TRIGGER'});
    })) console.error('[linux] Cannot register Speak to Window shortcut');
  } catch (error) {
    console.error('[linux] Cannot register Speak to Window shortcut:', error.message);
  }
}

function start(callback, getSetting, getTranslation) {
  if (emit) return;
  emit = callback;
  setting = getSetting;
  translate = getTranslation;
  if (!setAutostart(!!setting('openAtLogin', true))) {
    emit({cmd: 'CONFIG_CHANGED', key: 'openAtLogin', value: autostartStatus()});
  }
  const icon = nativeImage.createFromPath(path.join(__dirname, '../assets/icon.png')).resize({width: 24, height: 24});
  tray = new Tray(icon);
  tray.setToolTip('Gemini');
  tray.setContextMenu(Menu.buildFromTemplate([
    {label: translate('tray_show'), click: () => emit({cmd: 'SHOW'})},
    {label: translate('tray_hide'), click: () => emit({cmd: 'HIDE'})},
    {type: 'separator'},
    {label: translate('tray_settings'), click: () => emit({cmd: 'OPEN_SETTINGS'})},
    {label: translate('switch_account'), click: () => emit({cmd: 'SWITCH_ACCOUNT'})},
    {label: translate('sign_out'), click: () => emit({cmd: 'SIGN_OUT'})},
    {type: 'separator'},
    {label: translate('tray_quit'), click: () => emit({cmd: 'QUIT'})}
  ]));
  tray.on('click', () => emit({cmd: 'SHOW'}));
  registerMainShortcut();
  registerStcShortcut();
}

function send(message) {
  if (!emit || message.cmd !== 'CONFIG_CHANGED') return;
  switch (message.key) {
    case 'shortcut': registerMainShortcut(); break;
    case 'stcShortcut':
    case 'speakToWindowEnabled': registerStcShortcut(); break;
    case 'openAtLogin': {
      setAutostart(!!message.value);
      // Match the result on disk. Do not report a failed write as success.
      queueMicrotask(() => emit?.({cmd: 'CONFIG_CHANGED', key: 'openAtLogin', value: autostartStatus()}));
      break;
    }
  }
}

function stop() {
  globalShortcut.unregisterAll();
  tray?.destroy();
  tray = null;
  emit = null;
}

function updates() {
  return Promise.resolve({status: 'unavailable', message: 'Updates are managed by your system package manager.'});
}

async function openSettings(kind) {
  if (kind === 'startupapps') {
    fs.mkdirSync(path.dirname(autostartFile()), {recursive: true});
    const error = await shell.openPath(path.dirname(autostartFile()));
    if (!error) return;
  }
  const desktops = (process.env.XDG_CURRENT_DESKTOP || '').toLowerCase();
  const command = desktops.includes('kde') ? 'systemsettings' : desktops.includes('gnome') ? 'gnome-control-center' : null;
  if (command) {
    const child = spawn(command, [], {detached: true, stdio: 'ignore'});
    child.once('error', () => dialog.showMessageBox({type: 'info', message: 'Open your desktop privacy settings.'}));
    child.unref();
  } else {
    await dialog.showMessageBox({type: 'info', message: 'Open your desktop privacy settings.',
      detail: 'Check camera and microphone access. You can also change site permissions in Gemini settings.'});
  }
}

module.exports = {start, send, stop, closeToTray, logDir, crashDir, autostartStatus, updates, openSettings};
