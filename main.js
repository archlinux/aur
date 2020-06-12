const {app, BrowserWindow, ipcMain} = require('electron');
const path = require('path');

function createWindow () {
    const mainWindow = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            preload: path.join(__dirname, 'prompt.js')
        }
    });

    mainWindow.loadFile('index.html');

    // Electon does not support prompt()!
    // Using prompt from https://github.com/konsumer/electron-prompt
    var promptResponse;
    ipcMain.on('prompt', function(eventRet, arg) {
        promptResponse = null;
        var promptWindow = new BrowserWindow({
            width: 300,
            height: 100,
            show: false,
            resizable: false,
            movable: false,
            alwaysOnTop: true,
            frame: false,
            webPreferences: {
                nodeIntegration: true
            }
        });
        arg.val = arg.val || '';
        const promptHtml =
            '<script>\
            function ok() {\
                require(\'electron\').ipcRenderer.send(\'prompt-response\', document.getElementById(\'val\').value);\
                window.close();\
            }\
            </script>\
            <label for="val">' + arg.title + '</label>\
            <input onkeypress="if (window.event.which == 10 || window.event.which == 13) {ok();}" id="val" value="' + arg.val + '" autofocus />\
            <button onclick="ok();">Ok</button>\
            <button onclick="window.close()">Cancel</button>\
            <style>body {font-family: sans-serif;} button {float:right; margin-left: 10px;} label,input {margin-bottom: 10px; width: 100%; display:block;}</style>\
            <script>document.getElementById("val").select();</script>';
        promptWindow.loadURL('data:text/html,' + promptHtml);
        promptWindow.show();
        promptWindow.on('closed', function() {
            eventRet.returnValue = promptResponse;
            promptWindow = null;
        });
    })
    ipcMain.on('prompt-response', function(event, arg) {
        if (arg === '') arg = null;
        promptResponse = arg
    })
}

app.whenReady().then(() => {
    createWindow();
    app.on('activate', function() {
        // On macOS it's common to re-create a window in the app when the
        // dock icon is clicked and there are no other windows open.
        if (BrowserWindow.getAllWindows().length === 0) createWindow();
    })
})

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', function() {
    if (process.platform !== 'darwin') app.quit();
});
