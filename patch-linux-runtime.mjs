#!/usr/bin/env node

import { existsSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const appRoot = process.argv[2] ?? "app";
const mainPath = join(appRoot, "index.js");

function fail(message) {
  console.error(`patch-linux-runtime: ${message}`);
  process.exit(1);
}

function replaceExactlyOnce(source, marker, replacement, message) {
  const count = source.split(marker).length - 1;
  if (count !== 1) {
    fail(message);
  }
  return source.replace(marker, replacement);
}

if (!existsSync(mainPath)) {
  fail(`could not find main bundle: ${mainPath}`);
}

let source = readFileSync(mainPath, "utf8");

source = source.replaceAll(
  "process.resourcesPath",
  "(process.env.MASTERGO_DESKTOP_RESOURCES_PATH??process.resourcesPath)",
);

source = replaceExactlyOnce(
  source,
  'Ju=()=>{ku.autoUpdater.logger=ds,Gu(),qu(),(()=>{',
  'Ju=()=>{if(process.platform==="linux")return void ls.info("Linux in-app update check disabled");ku.autoUpdater.logger=ds,Gu(),qu(),(()=>{',
  "upstream bundle layout changed; could not patch updater",
);

source = replaceExactlyOnce(
  source,
  'Ol.instance=null,process.env.NODE_TLS_REJECT_UNAUTHORIZED="0",(0,Ms.initialize)(),',
  'Ol.instance=null,process.env.NODE_TLS_REJECT_UNAUTHORIZED="0";try{Object.defineProperty(u.app,"isPackaged",{configurable:true,get:()=>true})}catch{};(0,Ms.initialize)(),',
  "upstream bundle layout changed; could not patch packaged state",
);

source = replaceExactlyOnce(
  source,
  'Ol.getInstance().init(),nt("init"),xu()',
  'process.platform==="linux"||Ol.getInstance().init(),nt("init"),xu()',
  "upstream bundle layout changed; could not patch local MCP startup",
);

if (!source.includes("MASTERGO_DESKTOP_RESOURCES_PATH")) {
  fail("patch verification failed; resources path override missing");
}

if (!source.includes('process.platform==="linux"')) {
  fail("patch verification failed; Linux guards missing");
}

writeFileSync(mainPath, source);
console.log(`patch-linux-runtime: patched ${mainPath}`);
