'use strict'

const fs = require('fs')
const path = require('path')
const { app, Tray, Menu, BrowserWindow } = require('electron')

const ICON_CANDIDATES = [
  '/usr/share/icons/hicolor/48x48/apps/grok-bot.png',
  '/usr/share/icons/hicolor/64x64/apps/grok-bot.png',
  '/usr/share/icons/hicolor/32x32/apps/grok-bot.png',
  path.join(process.resourcesPath || '', 'icon.png'),
]

let tray = null
let quitting = false

function log(...args) {
  console.error('[grok-bot-tray]', ...args)
}

function resolveIconPath() {
  for (const candidate of ICON_CANDIDATES) {
    if (candidate && fs.existsSync(candidate)) return candidate
  }
  return null
}

function showMainWindow() {
  const windows = BrowserWindow.getAllWindows()
  if (windows.length === 0) return
  const win = windows.find((w) => !w.getParentWindow()) || windows[0]
  if (win.isMinimized()) win.restore()
  win.show()
  win.focus()
}

function attachHideOnClose(win) {
  if (!win || win.__grokBotTrayBound) return
  win.__grokBotTrayBound = true
  win.on('close', (event) => {
    if (quitting) return
    if (win.getParentWindow()) return
    event.preventDefault()
    win.hide()
  })
}

function createTray() {
  if (tray) return
  const iconPath = resolveIconPath()
  if (!iconPath) {
    log('no tray icon found')
    return
  }

  // Pass a filesystem path so StatusNotifier hosts (Quickshell) can use
  // IconName instead of Electron's often-misdecoded IconPixmap.
  try {
    tray = new Tray(iconPath)
  } catch (err) {
    log('Tray() failed', err)
    return
  }

  tray.setToolTip('Grok Bot')
  tray.setContextMenu(
    Menu.buildFromTemplate([
      { label: 'Show Grok Bot', click: showMainWindow },
      { type: 'separator' },
      {
        label: 'Quit',
        click: () => {
          quitting = true
          app.quit()
        },
      },
    ]),
  )
  tray.on('click', showMainWindow)
  log('registered', iconPath)
}

app.on('before-quit', () => {
  quitting = true
})

app.on('browser-window-created', (_event, win) => {
  attachHideOnClose(win)
})

require('./main.cjs')

app.removeAllListeners('window-all-closed')
app.on('window-all-closed', () => {
  // Keep the process alive so the tray icon remains.
})

app.whenReady().then(() => {
  for (const win of BrowserWindow.getAllWindows()) attachHideOnClose(win)
  createTray()
})
