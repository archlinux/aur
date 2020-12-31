// Modules to control application life and create native browser window
const {app, BrowserWindow} = require('electron')
const path = require('path')
const iconPath = path.join(__dirname, "webapp/assets/img/glowing-bear.png");
const userPath = path.join(app.getPath('home'), ".config/glowing-bear");

app.setPath('userData', userPath);

function createWindow () {
  // Create the browser window.
  const mainWindow = new BrowserWindow({
    title: "Glowing Bear",
    icon: iconPath,
    webPreferences: {
      contextIsolation: true
    }
  })

  // and load the index.html of the app.
  mainWindow.loadFile('webapp/index.html')

  // hide menu bar because it's useless
  mainWindow.setMenuBarVisibility(false)

  // Open the DevTools.
  //mainWindow.webContents.openDevTools()
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  createWindow()

  app.on('activate', function () {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})
