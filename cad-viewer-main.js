// Minimal Electron shell for the cad-viewer web app.
// Serves the built web dist over a privileged custom scheme so module
// workers and wasm load correctly (file:// would block them), and serves
// bundled cad-data assets (fonts, templates) locally instead of the CDN.
const { app, BrowserWindow, protocol, net, session, shell } = require('electron')
const fs = require('node:fs')
const path = require('node:path')
const { pathToFileURL } = require('node:url')

const WEB_ROOT = path.join(__dirname, 'web')
const CAD_DATA_ROOT = path.join(__dirname, 'cad-data')
const CDN_PREFIX = '/gh/mlightcad/cad-data@main/'

protocol.registerSchemesAsPrivileged([
  {
    scheme: 'app',
    privileges: {
      standard: true,
      secure: true,
      supportFetchAPI: true,
      stream: true,
      // Persist V8 compiled-code cache for the multi-MB viewer bundles so
      // repeat launches skip most of the JS parse/compile cost.
      codeCache: true
    }
  }
])

function serveFrom(root, pathname) {
  const file = path.normalize(path.join(root, pathname))
  if (!file.startsWith(root)) {
    return new Response('forbidden', { status: 403 })
  }
  return net.fetch(pathToFileURL(file).toString())
}

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
    if (pathname.startsWith('/__cad-data/')) {
      return serveFrom(CAD_DATA_ROOT, pathname.slice('/__cad-data'.length))
    }
    if (pathname === '/' || pathname === '') pathname = '/index.html'
    return serveFrom(WEB_ROOT, pathname)
  })

  // The web bundle hard-codes the jsdelivr cad-data base URL for fonts and
  // templates. Redirect those requests to the bundled copies; anything not
  // bundled falls through to the network unchanged.
  session.defaultSession.webRequest.onBeforeRequest(
    { urls: ['https://cdn.jsdelivr.net/gh/mlightcad/cad-data@main/*'] },
    (details, callback) => {
      const pathname = decodeURIComponent(new URL(details.url).pathname)
      if (pathname.startsWith(CDN_PREFIX)) {
        const rel = pathname.slice(CDN_PREFIX.length)
        const local = path.normalize(path.join(CAD_DATA_ROOT, rel))
        if (local.startsWith(CAD_DATA_ROOT) && fs.existsSync(local)) {
          callback({ redirectURL: 'app://local/__cad-data/' + rel })
          return
        }
      }
      callback({})
    }
  )

  createWindow()
  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

app.on('window-all-closed', () => app.quit())
