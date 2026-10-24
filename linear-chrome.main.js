
;(() => {
  if (process.platform !== 'linux') return
  const { app, ipcMain, BrowserWindow } = require('electron')
  ipcMain.on('linux-chrome:action', (event, action) => {
    const win = BrowserWindow.fromWebContents(event.sender)
    if (!win || win.isDestroyed()) return
    if (action === 'minimize') win.minimize()
    else if (action === 'maximize') win.isMaximized() ? win.unmaximize() : win.maximize()
    else if (action === 'close') win.close()
  })
  const push = (win) => {
    if (win.isDestroyed() || win.webContents.isDestroyed()) return
    win.webContents.send('linux-chrome:state', {
      maximized: win.isMaximized(),
      fullscreen: win.isFullScreen(),
    })
  }
  app.on('browser-window-created', (_event, win) => {
    for (const name of ['maximize', 'unmaximize', 'enter-full-screen', 'leave-full-screen', 'restore', 'show']) {
      win.on(name, () => push(win))
    }
    win.webContents.on('did-finish-load', () => push(win))
  })
})()
