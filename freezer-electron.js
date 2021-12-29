#!/usr/bin/@ELECTRON@

const name = 'freezer-electron';

const {app} = require('electron');
const fs = require('fs');
const path = require('path');

// Change command name
const fd = fs.openSync('/proc/self/comm', fs.constants.O_WRONLY);
fs.writeSync(fd, name);
fs.closeSync(fd);

// Remove first command line argument (/usr/bin/@ELECTRON@)
process.argv.splice(0, 1);

// Set application paths
const appPath = path.join(path.dirname(__dirname), 'lib', name);
const productName = 'Freezer';
app.setAppPath(appPath);
app.setDesktopName(name + '.desktop');
app.setName(productName);
app.setPath('userCache', path.join(app.getPath('cache'), productName));
app.setPath('userData', path.join(app.getPath('appData'), productName));
app.setVersion('@VERSION@');

// Run the application
require('module')._load(appPath, module, true);
