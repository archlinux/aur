#!/usr/bin/env node

import { existsSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const appRoot = process.argv[2] ?? "app-extracted";
const mainPath = join(appRoot, "out", "main", "index.js");
const hostPath = join(appRoot, "out", "host", "index.js");

function fail(message) {
  console.error(`patch-linux-runtime: ${message}`);
  process.exit(1);
}

if (!existsSync(mainPath)) {
  fail(`could not find main bundle: ${mainPath}`);
}

if (!existsSync(hostPath)) {
  fail(`could not find host bundle: ${hostPath}`);
}

let source = readFileSync(mainPath, "utf8");
let hostSource = readFileSync(hostPath, "utf8");

if (!source.includes('import{app as vn}from"electron"')) {
  fail("upstream bundle layout changed; missing app import marker");
}

const resourceExpression = "(process.env.ZCODE_DESKTOP_RESOURCES_PATH??process.resourcesPath)";
source = source.replaceAll("process.resourcesPath", resourceExpression);
hostSource = hostSource.replaceAll("process.resourcesPath", resourceExpression);

const packagedMarker = "var Na=!vn.isPackaged;";
if (!source.includes(packagedMarker)) {
  fail("upstream bundle layout changed; missing packaged marker");
}

source = source.replace(
  packagedMarker,
  'try{Object.defineProperty(vn,"isPackaged",{configurable:true,get:()=>true})}catch{}var Na=!vn.isPackaged;',
);

const updaterMarker = "async function fS(e={}){if(!wn.isPackaged)return;";
if (!source.includes(updaterMarker)) {
  fail("upstream bundle layout changed; missing updater marker");
}

source = source.replace(
  updaterMarker,
  "async function fS(e={}){if(process.platform===`linux`)return;if(!wn.isPackaged)return;",
);

if (!source.includes("ZCODE_DESKTOP_RESOURCES_PATH")) {
  fail("patch verification failed; resources path override missing");
}

writeFileSync(mainPath, source);
writeFileSync(hostPath, hostSource);
console.log(`patch-linux-runtime: patched ${mainPath}`);
console.log(`patch-linux-runtime: patched ${hostPath}`);
