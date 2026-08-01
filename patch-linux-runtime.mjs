#!/usr/bin/env node
// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD
//
// Adapts the macOS application bundle to the stock Arch Electron runtime:
//   - sets the Wayland desktop identity used for icon lookup;
//   - keeps the upstream single-instance lifecycle enabled;
//   - makes upstream Linux tray support work with stock Electron.

import { existsSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const TAG = "patch-linux-runtime";
const appRoot = process.argv[2] ?? "app-extracted";
const buildRoot = join(appRoot, ".vite", "build");

function fail(message) {
  console.error(`${TAG}: ${message}`);
  process.exit(1);
}

function findBundle(prefix) {
  if (!existsSync(buildRoot) || !statSync(buildRoot).isDirectory()) {
    fail(`could not find Vite build directory: ${buildRoot}`);
  }

  const files = readdirSync(buildRoot, { withFileTypes: true })
    .filter(
      (entry) => entry.isFile() && entry.name.startsWith(`${prefix}-`) && entry.name.endsWith(".js"),
    )
    .map((entry) => join(buildRoot, entry.name));

  if (files.length !== 1) {
    fail(`expected one ${prefix}-*.js bundle, found ${files.length}`);
  }
  return files[0];
}

function replaceRegex(source, regex, replacement, marker, description) {
  const matches = [...source.matchAll(regex)];
  if (matches.length === 0) {
    if (source.includes(marker)) {
      console.log(`${TAG}: ${description} already patched`);
      return { source, patched: false };
    }
    fail(`could not find ${description}`);
  }
  if (matches.length !== 1) {
    fail(`expected one ${description}, found ${matches.length}`);
  }
  console.log(`${TAG}: patched ${description}`);
  return { source: source.replace(regex, replacement), patched: true };
}

function patchDesktopIdentity() {
  const packagePath = join(appRoot, "package.json");
  if (!existsSync(packagePath)) {
    fail(`could not find application package metadata: ${packagePath}`);
  }

  const packageJson = JSON.parse(readFileSync(packagePath, "utf8"));
  if (packageJson.desktopName === "ChatGPT.desktop") {
    console.log(`${TAG}: Wayland desktop identity already patched`);
    return;
  }

  packageJson.desktopName = "ChatGPT.desktop";
  writeFileSync(packagePath, `${JSON.stringify(packageJson, null, 2)}\n`);
  console.log(`${TAG}: patched Wayland desktop identity`);
}

function patchSingleInstance() {
  const bootstrapFile = findBundle("bootstrap");
  let source = readFileSync(bootstrapFile, "utf8");
  const marker = "/*linuxSingleInstance*/";

  if (source.includes(marker)) {
    console.log(`${TAG}: Linux single-instance lifecycle already patched`);
    return;
  }
  if (!source.includes(".app.requestSingleInstanceLock()")) {
    fail("upstream requestSingleInstanceLock flow is unavailable");
  }
  if (!source.includes(".app.on(`second-instance`")) {
    fail("upstream second-instance handler is unavailable");
  }

  const predicate =
    /([A-Za-z_$][\w$]*)\.f\(\{isMacOS:([A-Za-z_$][\w$]*),isPackaged:([A-Za-z_$][\w$]*)\.app\.isPackaged\}\)/g;
  const matches = [...source.matchAll(predicate)];
  if (matches.length !== 1) {
    fail(`expected one upstream single-instance predicate, found ${matches.length}`);
  }

  source = source.replace(
    predicate,
    "$1.f({isMacOS:$2,isPackaged:$3.app.isPackaged||/*linuxSingleInstance*/process.platform===`linux`})",
  );
  writeFileSync(bootstrapFile, source);
  console.log(`${TAG}: patched Linux single-instance lifecycle in ${bootstrapFile}`);
}

function patchTray() {
  const mainFile = findBundle("main");
  let source = readFileSync(mainFile, "utf8");
  let patchedAny = false;

  // Stock Electron exposes Tray.isDestroyed(), but not the custom isReady()
  // and whenReady() methods used by the upstream runtime.
  {
    const result = replaceRegex(
      source,
      /async function ([A-Za-z_$][\w$]*)\(e\)\{let t=e;if\(typeof t\.whenReady!=`function`\)return process\.platform!==`linux`;try\{return await t\.whenReady\(\),!0\}catch\{return!1\}\}/g,
      "async function $1(e){let t=e;if(typeof t.whenReady!=`function`)return!t.isDestroyed();try{return await t.whenReady(),!0}catch{return!1}}",
      "if(typeof t.whenReady!=`function`)return!t.isDestroyed()",
      "stock Electron asynchronous tray readiness fallback",
    );
    source = result.source;
    patchedAny ||= result.patched;
  }

  {
    const result = replaceRegex(
      source,
      /function ([A-Za-z_$][\w$]*)\(e\)\{let t=e;return typeof t\.isReady==`function`\?t\.isReady\(\):process\.platform!==`linux`\}/g,
      "function $1(e){let t=e;return typeof t.isReady==`function`?t.isReady():!t.isDestroyed()}",
      "typeof t.isReady==`function`?t.isReady():!t.isDestroyed()",
      "stock Electron synchronous tray readiness fallback",
    );
    source = result.source;
    patchedAny ||= result.patched;
  }

  // app.isPackaged is false under the system Electron launcher and
  // process.resourcesPath belongs to Electron. Use the icon installed beside
  // app.asar; the archive's computed Codex icon filename is not shipped.
  {
    const result = replaceRegex(
      source,
      /([A-Za-z_$][\w$]*)\.nativeImage\.createFromPath\(\1\.app\.isPackaged\?\(0,([A-Za-z_$][\w$]*)\.join\)\(process\.resourcesPath,([A-Za-z_$][\w$]*)\):\(0,\2\.join\)\(([A-Za-z_$][\w$]*),`electron`,`src`,`icons`,\3\)\)/g,
      "$1.nativeImage.createFromPath(/*linuxTrayIcon*/(0,$2.join)((0,$2.dirname)($1.app.getAppPath()),`icon-chatgpt.png`))",
      "/*linuxTrayIcon*/",
      "Linux packaged tray icon path",
    );
    source = result.source;
    patchedAny ||= result.patched;
  }

  if (patchedAny) {
    writeFileSync(mainFile, source);
    console.log(`${TAG}: patched tray runtime in ${mainFile}`);
  } else {
    console.log(`${TAG}: tray runtime already patched in ${mainFile}`);
  }
}

patchDesktopIdentity();
patchSingleInstance();
patchTray();
