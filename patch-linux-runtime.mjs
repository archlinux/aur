#!/usr/bin/env node

import { existsSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const appRoot = process.argv[2] ?? "app-extracted";
const mainPath = join(appRoot, "out", "main", "index.js");
const hostPath = join(appRoot, "out", "host", "index.js");
const identifier = "[A-Za-z_$][\\w$]*";

function fail(message) {
  console.error(`patch-linux-runtime: ${message}`);
  process.exit(1);
}

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function replaceExactlyOnce(source, pattern, replacement, message) {
  let count = 0;
  const next = source.replace(pattern, (...args) => {
    count += 1;
    return typeof replacement === "function" ? replacement(...args) : replacement;
  });
  if (count !== 1) {
    fail(message);
  }
  return next;
}

if (!existsSync(mainPath)) {
  fail(`could not find main bundle: ${mainPath}`);
}

if (!existsSync(hostPath)) {
  fail(`could not find host bundle: ${hostPath}`);
}

let source = readFileSync(mainPath, "utf8");
let hostSource = readFileSync(hostPath, "utf8");

const resourceExpression = "(process.env.ZCODE_DESKTOP_RESOURCES_PATH??process.resourcesPath)";
source = source.replaceAll("process.resourcesPath", resourceExpression);
hostSource = hostSource.replaceAll("process.resourcesPath", resourceExpression);

const helperAppImportPattern = new RegExp(
  `import\\{app as (${identifier})\\}from"electron";function Pn\\(\\)\\{`,
);
const helperAppImportMatch = source.match(helperAppImportPattern);

if (helperAppImportMatch?.[1]) {
  const appVar = helperAppImportMatch[1];
  source = replaceExactlyOnce(
    source,
    helperAppImportPattern,
    `import{app as ${appVar}}from"electron";try{Object.defineProperty(${appVar},"isPackaged",{configurable:true,get:()=>true})}catch{}function Pn(){`,
    "upstream bundle layout changed; could not patch app packaged helper",
  );
} else {
  const legacyAppImportMatch = source.match(
    new RegExp(`import\\{app as (${identifier})\\}from"electron";`),
  );
  const appVar = legacyAppImportMatch?.[1];
  if (!appVar) {
    fail("upstream bundle layout changed; missing app import marker");
  }

  const packagedMarkerPattern = new RegExp(
    `var (${identifier})=!${escapeRegExp(appVar)}\\.isPackaged;`,
  );
  source = replaceExactlyOnce(
    source,
    packagedMarkerPattern,
    (_, devModeVar) =>
      `try{Object.defineProperty(${appVar},"isPackaged",{configurable:true,get:()=>true})}catch{}var ${devModeVar}=!${appVar}.isPackaged;`,
    "upstream bundle layout changed; missing packaged marker",
  );
}

const updaterMarkerPattern = new RegExp(
  `async function (${identifier})\\(e=\\{\\}\\)\\{if\\(!(${identifier})\\.isPackaged\\)return;(${identifier}=e\\.onBeforeQuitAndInstall,)`,
);
source = replaceExactlyOnce(
  source,
  updaterMarkerPattern,
  (_, functionName, appVar, nextAssignment) =>
    `async function ${functionName}(e={}){if(process.platform===\`linux\`)return;if(!${appVar}.isPackaged)return;${nextAssignment}`,
  "upstream bundle layout changed; missing updater marker",
);

if (!source.includes("ZCODE_DESKTOP_RESOURCES_PATH") || !hostSource.includes("ZCODE_DESKTOP_RESOURCES_PATH")) {
  fail("patch verification failed; resources path override missing");
}

if (!source.includes("Object.defineProperty") || !source.includes("process.platform===`linux`")) {
  fail("patch verification failed; app packaged or updater patch missing");
}

writeFileSync(mainPath, source);
writeFileSync(hostPath, hostSource);
console.log(`patch-linux-runtime: patched ${mainPath}`);
console.log(`patch-linux-runtime: patched ${hostPath}`);
