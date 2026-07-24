// Minimal Electron shell for the cad-viewer web app.
// Serves the built web dist over a privileged custom scheme so module
// workers and wasm load correctly (file:// would block them).
const { app, BrowserWindow, protocol, net, shell } = require('electron')
const path = require('node:path')
const { pathToFileURL } = require('node:url')

const WEB_ROOT = path.join(__dirname, 'web')

protocol.registerSchemesAsPrivileged([
  {
    scheme: 'app',
    privileges: {
      standard: true,
      secure: true,
      supportFetchAPI: true,
      stream: true
    }
  }
])

function createWindow() {
  const win = new BrowserWindow({
    width: 1400,
    height: 900,
    webPreferences: {
      contextIsolation: true,
      nodeIntegration: false,
      sandbox: true
    }
  })
  win.setMenuBarVisibility(false)
  // External links open in the default browser, not inside the shell.
  win.webContents.setWindowOpenHandler(({ url }) => {
    shell.openExternal(url)
    return { action: 'deny' }
  })
  win.loadURL('app://local/index.html')
  return win
}

app.whenReady().then(() => {
  protocol.handle('app', request => {
    const url = new URL(request.url)
    let pathname = decodeURIComponent(url.pathname)
    if (pathname === '/' || pathname === '') pathname = '/index.html'
    const file = path.normalize(path.join(WEB_ROOT, pathname))
    if (!file.startsWith(WEB_ROOT)) {
      return new Response('forbidden', { status: 403 })
    }
    return net.fetch(pathToFileURL(file).toString())
  })
  createWindow()
  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

app.on('window-all-closed', () => app.quit())
