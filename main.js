process.chdir(__dirname);
const { app, BrowserWindow } = require('electron');
const path = require('path');

const KINDLE_URL = 'https://read.amazon.com/';

app.setAppUserModelId('kindle-for-arch');

function createWindow() {
  const win = new BrowserWindow({
    width: 1024,
    height: 768,
    title: 'Kindle for Arch',
    icon: path.join(__dirname, 'Kindle.png'),
                                autoHideMenuBar: true,
                                webPreferences: {
                                  nodeIntegration: false,
                                contextIsolation: true
                                }
  })

  win.on('page-title-updated', (e) => {
    e.preventDefault();
  });

  // FIX: Ignore minor ad-network connection failures
  win.webContents.on('did-fail-load', (event, errorCode, errorDescription, validatedURL) => {
    if (validatedURL.includes('amazon-adsystem.com')) {
      return; // Silently ignore the ad error and keep running
    }
  });

  win.loadURL(KINDLE_URL);
}

app.whenReady().then(() => {
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow()
    }
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})
