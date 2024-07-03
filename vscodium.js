#!/usr/bin/@ELECTRON@

const name = 'vscodium';

const app = require('electron').app;
const path = require('path');
const fs = require("fs");

// Change command name.
const fd = fs.openSync("/proc/self/comm", fs.constants.O_WRONLY);
fs.writeSync(fd, name);
fs.closeSync(fd);

// PatJK (https://aur.archlinux.org/account/PatJK):
// call chain: electron -> /usr/lib/vscodium/out/cli.js -> vscodium.js
// this line removes all arguments passed to cli.js (including self, "vscodium.js") and keeps arguments that should be passed to self
// currently --enable-features=UseOzonePlatform --ozone-platform=wayland are passed to cli.js for Wayland users
process.argv.splice(0, process.argv.findIndex(arg => arg.endsWith('/vscodium.js')));

// Set application paths.
const appPath = __dirname;
const packageJson = require(path.join(appPath, 'package.json'));
app.setAppPath(appPath);
app.setDesktopName(name + '.desktop');
app.setName(name);
app.setPath('userCache', path.join(app.getPath('cache'), name));
app.setPath('userData', path.join(app.getPath('appData'), name));
app.setVersion(packageJson.version);

// Run the application.
require('module')._load(appPath, module, true);

