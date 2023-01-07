const { app, BrowserWindow } = require("electron");
const path = require("path");

app.whenReady().then(() => {
	const mainWindow = new BrowserWindow({
		autoHideMenuBar: true,
		backgroundColor: "#161512",
		webPreferences: {
			preload: path.join(app.getAppPath(), "preload.js"),
			sandbox: false,
		},
	});
	mainWindow.loadFile("www/index.html");
	mainWindow.webContents.session.webRequest.onBeforeSendHeaders(
		{urls: ["wss://socket.lichess.org/*"]},
		(details, callback) => {
			delete details.requestHeaders.Origin;
			callback({requestHeaders: details.requestHeaders});
		},
	);
});

app.on("window-all-closed", () => {
	app.quit();
});
