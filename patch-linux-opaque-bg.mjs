#!/usr/bin/env node
// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD
//
// Patches the Codex desktop app to use opaque window backgrounds on Linux.
//
// The macOS app uses transparent BrowserWindow backgrounds (#00000000) for
// vibrancy/mica effects. Linux compositors (especially Nvidia on Wayland) do
// not handle these correctly, causing rendering artifacts.
//
// Two patches are applied:
//   1. Main process bundle: adds a Linux branch to the BrowserWindow background
//      color function so it returns opaque colors instead of transparent.
//   2. Webview theme files: defaults opaqueWindows to true so the UI does not
//      attempt translucent sidebar/chrome styles.

import { existsSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const TAG = "patch-linux-opaque-bg";
const appRoot = process.argv[2] ?? "app-extracted";
const buildRoot = join(appRoot, ".vite", "build");
const webviewAssets = join(appRoot, "webview", "assets");

function fail(message) {
  console.error(`${TAG}: ${message}`);
  process.exit(1);
}

// ---------- 1. Patch main process bundle ----------

if (!existsSync(buildRoot) || !statSync(buildRoot).isDirectory()) {
  fail(`could not find Vite build directory: ${buildRoot}`);
}

const mainFiles = readdirSync(buildRoot, { withFileTypes: true })
  .filter((e) => e.isFile() && e.name.startsWith("main-") && e.name.endsWith(".js"))
  .map((e) => join(buildRoot, e.name));

if (mainFiles.length !== 1) {
  fail(`expected one main-*.js bundle, found ${mainFiles.length}`);
}

const mainFile = mainFiles[0];
let mainSource = readFileSync(mainFile, "utf8");

function patchLegacyBackgroundFunction(source) {
  // Match the BrowserWindow background color function used by 26.602. The
  // pattern is:
  //   function <NAME>({platform:<P>,appearance:<A>,opaqueWindowsEnabled:<O>,prefersDarkColors:<D>}){
  //     return <O>&&!<PRED>(<A>)&&(<P>===`darwin`||<P>===`win32`)
  //       ? {backgroundColor:<D>?<DARK>:<LIGHT>,backgroundMaterial:<P>===`win32`?`none`:null}
  //       : <P>===`win32`&&!<PRED>(<A>)
  //         ? {backgroundColor:<TRANS>,backgroundMaterial:`mica`}
  //         : {backgroundColor:<TRANS>,backgroundMaterial:null}
  //   }
  const bgFuncRe = new RegExp(
  "function\\s+([A-Za-z_$][\\w$]*)\\(" +
    "\\{platform:([A-Za-z_$][\\w$]*)," +
    "appearance:([A-Za-z_$][\\w$]*)," +
    "opaqueWindowsEnabled:([A-Za-z_$][\\w$]*)," +
    "prefersDarkColors:([A-Za-z_$][\\w$]*)\\}\\)" +
    "\\{return\\s*\\4&&!([A-Za-z_$][\\w$]*)\\(\\3\\)&&" +
    "\\(\\2===`darwin`\\|\\|\\2===`win32`\\)" +
    "\\?\\{backgroundColor:\\5\\?([A-Za-z_$][\\w$]*):([A-Za-z_$][\\w$]*)," +
    "backgroundMaterial:\\2===`win32`\\?`none`:null\\}" +
    ":(\\2===`win32`&&!\\6\\(\\3\\)\\?" +
    "\\{backgroundColor:([A-Za-z_$][\\w$]*)," +
    "backgroundMaterial:`mica`\\})" +
    ":\\{backgroundColor:\\10,backgroundMaterial:null\\}\\}"
  );

  const bgMatch = source.match(bgFuncRe);
  if (!bgMatch) {
    return { source, matched: false };
  }

  const [fullMatch, funcName, pVar, aVar, oVar, dVar, predFunc, darkVar, lightVar, win32Branch, transVar] = bgMatch;
  const linuxBranch =
    `${pVar}===\`linux\`&&!${predFunc}(${aVar})` +
    `?{backgroundColor:${dVar}?${darkVar}:${lightVar},backgroundMaterial:null}:`;
  const patched = fullMatch.replace(win32Branch, `${linuxBranch}${win32Branch}`);
  return { source: source.replace(fullMatch, patched), matched: true };
}

function patchPlatformPredicate(source, regex, replacement, alreadyRegex, description) {
  const matches = [...source.matchAll(regex)];
  if (matches.length === 0) {
    if (alreadyRegex.test(source)) {
      console.log(`${TAG}: ${description} already patched`);
      return { source, matched: true, patched: false };
    }
    return { source, matched: false, patched: false };
  }
  if (matches.length !== 1) {
    fail(`expected one ${description}, found ${matches.length}`);
  }
  console.log(`${TAG}: patched ${description}`);
  return { source: source.replace(regex, replacement), matched: true, patched: true };
}

function patchOpaqueSurfacePredicates(source) {
  let matchedAny = false;
  let patchedAny = false;
  let result = patchPlatformPredicate(
    source,
    /function ([A-Za-z_$][\w$]*)\(\{appearance:([A-Za-z_$][\w$]*),opaqueWindowsEnabled:([A-Za-z_$][\w$]*),platform:([A-Za-z_$][\w$]*)\}\)\{return \3&&!([A-Za-z_$][\w$]*)\(\2\)&&\(\4===`darwin`\|\|\4===`win32`\)\}/g,
    "function $1({appearance:$2,opaqueWindowsEnabled:$3,platform:$4}){return $3&&!$5($2)&&($4===`darwin`||$4===`win32`||$4===`linux`)}",
    /function [A-Za-z_$][\w$]*\(\{appearance:[A-Za-z_$][\w$]*,opaqueWindowsEnabled:[A-Za-z_$][\w$]*,platform:[A-Za-z_$][\w$]*\}\)\{return [A-Za-z_$][\w$]*&&![A-Za-z_$][\w$]*\([A-Za-z_$][\w$]*\)&&\([A-Za-z_$][\w$]*===`darwin`\|\|[A-Za-z_$][\w$]*===`win32`\|\|[A-Za-z_$][\w$]*===`linux`\)\}/,
    "always-opaque Linux surface predicate",
  );
  source = result.source;
  matchedAny ||= result.matched;
  patchedAny ||= result.patched;

  result = patchPlatformPredicate(
    source,
    /function ([A-Za-z_$][\w$]*)\(\{appearance:([A-Za-z_$][\w$]*),isFocused:([A-Za-z_$][\w$]*),platform:([A-Za-z_$][\w$]*)\}\)\{return!\3&&!([A-Za-z_$][\w$]*)\(\2\)&&\(\4===`darwin`\|\|\4===`win32`\)\}/g,
    "function $1({appearance:$2,isFocused:$3,platform:$4}){return!$3&&!$5($2)&&($4===`darwin`||$4===`win32`||$4===`linux`)}",
    /function [A-Za-z_$][\w$]*\(\{appearance:[A-Za-z_$][\w$]*,isFocused:[A-Za-z_$][\w$]*,platform:[A-Za-z_$][\w$]*\}\)\{return![A-Za-z_$][\w$]*&&![A-Za-z_$][\w$]*\([A-Za-z_$][\w$]*\)&&\([A-Za-z_$][\w$]*===`darwin`\|\|[A-Za-z_$][\w$]*===`win32`\|\|[A-Za-z_$][\w$]*===`linux`\)\}/,
    "unfocused opaque Linux surface predicate",
  );
  source = result.source;
  matchedAny ||= result.matched;
  patchedAny ||= result.patched;

  return { source, matched: matchedAny, patched: patchedAny };
}

const legacyResult = patchLegacyBackgroundFunction(mainSource);
if (legacyResult.matched) {
  mainSource = legacyResult.source;
  if (!mainSource.includes("===`linux`&&!")) {
    fail("patch verification failed: legacy linux branch not found after patching");
  }
  writeFileSync(mainFile, mainSource);
  console.log(`${TAG}: patched legacy background function in ${mainFile}`);
} else if (mainSource.includes("===`linux`&&!") && mainSource.includes("backgroundMaterial:null}:")) {
  console.log(`${TAG}: legacy background function already patched`);
} else {
  const surfaceResult = patchOpaqueSurfacePredicates(mainSource);
  if (!surfaceResult.matched) {
    fail("could not find BrowserWindow background color function or opaque surface predicates in main bundle");
  }
  mainSource = surfaceResult.source;

  if (surfaceResult.patched) {
    writeFileSync(mainFile, mainSource);
    console.log(`${TAG}: patched opaque surface predicates in ${mainFile}`);
  } else {
    console.log(`${TAG}: opaque surface predicates already patched`);
  }
}

// ---------- 2. Patch webview theme defaults ----------

if (!existsSync(webviewAssets) || !statSync(webviewAssets).isDirectory()) {
  console.log(`${TAG}: no webview/assets directory found, skipping theme patch`);
  process.exit(0);
}

const themeFiles = readdirSync(webviewAssets, { withFileTypes: true })
  .filter((e) => e.isFile() && e.name.endsWith(".js"))
  .map((e) => join(webviewAssets, e.name))
  .filter((f) => readFileSync(f, "utf8").includes("opaqueWindows:!1"));

let themePatched = 0;
for (const file of themeFiles) {
  let src = readFileSync(file, "utf8");
  const updated = src.replaceAll("opaqueWindows:!1", "opaqueWindows:!0");
  if (updated !== src) {
    writeFileSync(file, updated);
    themePatched++;
    console.log(`${TAG}: patched theme defaults in ${file}`);
  }
}

if (themePatched === 0 && themeFiles.length === 0) {
  console.log(`${TAG}: no theme files with opaqueWindows:!1 found (may already be patched)`);
} else {
  console.log(`${TAG}: patched ${themePatched} theme file(s)`);
}
