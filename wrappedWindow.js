'use strict';

var fs = require('fs');
var path = require('path');
var crypto = require('crypto');
const electron = require('electron');
var app = electron.app; // Module to control application life.
var BrowserWindow = electron.BrowserWindow;  // Module to create native browser window.
var ipc = electron.ipcMain;
var shell = electron.shell;
var Tray = electron.Tray;
var Menu = electron.Menu;
var localShortcut = require('electron-localshortcut'); // Module to register keyboard shortcuts

var appIcon = undefined;

const contextMenu = require('electron-context-menu');

contextMenu({ showInspectElement: false });

const ICON_NO_NEW_MSG = path.join(__dirname, 'assets/icon/chat-favicon-no-new-256dp.png');
const ICON_NEW_NON_NOTIF_MSG = path.join(__dirname, 'assets/icon/chat-favicon-new-non-notif-256dp.png');
const ICON_NEW_NOTIF_MSG = path.join(__dirname, 'assets/icon/chat-favicon-new-notif-256dp.png');
const ICON_OFFLINE_MSG = path.join(__dirname, 'assets/icon/chat-favicon-offline-256dp.png');

module.exports = function createWrappedWindow(opts) {
  // Thanks imskull! (https://github.com/atom/electron/issues/526#issuecomment-132942967)
  // Try to load saved window bounds
  var initPath = path.join(app.getPath("userData"), 'init.json');
  var data;
  try {
    data = JSON.parse(fs.readFileSync(initPath, 'utf8'));
  }
  catch(e) { }

  var sha = crypto.createHash('sha256');
  sha.update(opts.name);
  var hash = sha.digest('hex');

  const iconPath = path.join(__dirname, 'assets/icon/icon.png');

  // Create the browser window.
  var windowOpts = (data && data[hash] && data[hash].bounds) ? data[hash].bounds : { width: 800, height: 600 };
  windowOpts['auto-hide-menu-bar'] = true;
  windowOpts['web-preferences'] = { 'node-integration': false };
  windowOpts['icon'] = iconPath;
  var window = new BrowserWindow(windowOpts);
  window.setMenu(null);
  //window.webContents.openDevTools();

  if (data && data[hash] && data[hash].shouldBeMaximized) {
    window.maximize();
  }

  // and load the url ;)
  window.loadURL(opts.url);

  // Register common navigation shortcuts
  function goBack() {
    if (window.webContents.canGoBack()) {
      window.webContents.goBack();
    }
  }
  function goForward() {
    if (window.webContents.canGoForward()) {
      window.webContents.goForward();
    }
  }
  localShortcut.register(window, 'Alt+Left', goBack);
  localShortcut.register(window, 'Alt+Right', goForward);
  localShortcut.register(window, 'F5', window.webContents.reload);

  // Open EXTERNAL LINKS in the default browser
  // Example: electron-wrap messenger.com
  // Links on messenger.com that link to messenger.com will be followed in-app
  // Links on messenger.com that link elsewhere (e.g., imgur.com) will be opened externally

  // http://stackoverflow.com/a/23945027/5136076
  function extractDomain(url) {
    var domain;
    //find & remove protocol (http, ftp, etc.) and get domain
    if (url.indexOf("://") > -1) {
      domain = url.split('/')[2];
    }
    else {
      domain = url.split('/')[0];
    }

    //find & remove port number
    domain = domain.split(':')[0];

    return domain;
  }
  var handleRedirect = function(e, url) {
    if (!opts.openLocally && extractDomain(url) !== extractDomain(window.webContents.getURL()) && extractDomain(url) !== "accounts.google.com" && extractDomain(url) !== "accounts.youtube.com" && extractDomain(url) !== "support.google.com" && extractDomain(url) !== "chat.google.com") {
      require('electron').shell.openExternal(url);
      e.preventDefault();
/*
    } else {
      var nested = createWrappedWindow({
        name: opts.name,
        url: url,
        openLocally: opts.openLocally
      });
      nested.on('closed', function() {
        nested = null;
      });
*/
    }
  };

  window.webContents.on('will-navigate', handleRedirect);
  window.webContents.on('new-window', handleRedirect);

  // Save the window bounds on close
  window.on('close', function() {
    var maximized = window.isMaximized();
    var newData = data || {};
    newData[hash] = { bounds: window.getBounds() };
    if (window.isMaximized()) {
      newData[hash].shouldBeMaximized = true;
    }
    fs.writeFileSync(initPath, JSON.stringify(newData));
  });

  window.webContents.on('dom-ready', () => {
    const scriptPath = path.join('file://', __dirname, 'node_modules/jquery/dist/jquery.min.js');
    window.webContents.executeJavaScript('var ipc = require(\'electron\').ipcRenderer; document.addEventListener("click", (evt) => { if (evt.target && evt.target.localName == "a" && evt.target.target == "_blank" && evt.target.href.startsWith("http")) { ipc.send("open-link", evt.target.href); evt.preventDefault(); } }, true);');
    window.webContents.executeJavaScript('var fi = document.querySelector("link#favicon256"); ipc.send("favicon-changed", fi.href); var callback = function(mutationList) { ipc.send("favicon-changed", fi.href); }; var observer = new MutationObserver(callback); observer.observe(fi, { attributes: true });');
  });

  appIcon = new Tray(ICON_OFFLINE_MSG);
  const contextMenu = Menu.buildFromTemplate([
    {
      label: 'Show', click: function () {
	window.show()
      }
    },{
      label: 'Hide', click: function () {
	window.minimize()
      }
    },{
      label: 'Quit', click: function () {
	app.isQuiting = true
	app.quit()
      }
    }
  ]);
  appIcon.setContextMenu(contextMenu);

  appIcon.on('click', function(e){
    if (window.isMinimized()){
      window.show();
    }else{
      window.focus();
    }
  });

  return window;
};



ipc.on('open-link', (evt, href) => {
  shell.openExternal(href);
});

function iconForType(itype) {
  if (itype == "NORMAL") {
    return ICON_NO_NEW_MSG;
  }else if (itype == "UNREAD") {
    return ICON_NEW_NON_NOTIF_MSG;
  }else if (itype == "ATTENTION") {
    return ICON_NEW_NOTIF_MSG;
  }
  return ICON_OFFLINE_MSG;
}

ipc.on('favicon-changed', (evt, href) => {
  /* console.log("Favicon changed: ", href); */

  var itype = "";
  if (href.match(/chat-favicon-no-new/)) {
    itype = "NORMAL";
  }else if (href.match(/chat-favicon-new-non-notif/)) {
    itype = "UNREAD";
  }else if (href.match(/chat-favicon-new-notif/)) {
    itype = "ATTENTION";
  }else if (href.match(/^data:image\/png;base64,iVBOR.+/)) {
    itype = "OFFLINE";
  }

  appIcon.setImage(iconForType(itype));

});
