#!/usr/bin/@ELECTRON@
// don't edit the electron binary name here! simply change the variable in the PKGBUILD and we will sed it into the correct one :)
import { app } from "electron/main";
import * as path from "node:path";
import * as fs from "node:fs";
 
const name = "qoder-cn";
 
const fd = fs.openSync("/proc/self/comm", fs.constants.O_WRONLY);
fs.writeSync(fd, name);
fs.closeSync(fd);
 
process.argv.splice(
  0,
  process.argv.findIndex((arg) => arg.endsWith("/qoder-cn.js")),
);
 
const appPath = import.meta.dirname;
const packageJson = JSON.parse(fs.readFileSync(new URL("./package.json", import.meta.url)));
 
app.setAppPath(appPath);
app.setDesktopName(name + ".desktop");
app.setName(name);
app.setPath("userCache", path.join(app.getPath("cache"), name));
app.setPath("userData", path.join(app.getPath("appData"), name));
app.setVersion(packageJson.version);
 
try {
  await import(appPath + "/out/main.js");
} catch (err) {
  console.error("Failed to start application:", err);
  process.exit(1);
}