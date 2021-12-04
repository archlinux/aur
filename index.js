const { app, BrowserWindow, Menu } = require('electron')
const path = require('path')

function createWindow () {
    const win = new BrowserWindow({
        titleBarStyle: 'hidden',
        width: 1024,
        height: 768,
        useContentSize: true,
        icon: path.join(__dirname, './logo.png')
    })
    win.loadURL('https://aigepu.com/zhipu');
}

app.on('window-all-closed', function () {
    if (process.platform !== 'darwin') app.quit()
})
app.whenReady().then(() => {
    createWindow()
    Menu.setApplicationMenu(null);
    app.on('activate', function () {
        if (BrowserWindow.getAllWindows().length === 0) createWindow()
    })
})
