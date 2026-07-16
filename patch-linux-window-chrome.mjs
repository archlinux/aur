#!/usr/bin/env node
// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD
//
// Patches the Codex desktop app to integrate its window chrome on Linux.
//
// The packaged app is built for macOS and Windows-style custom chrome. On KDE,
// Electron's default Linux frame adds a native title bar above the app chrome,
// and the application menu appears as an Electron menu bar. This patch makes
// the primary Linux window frameless and hides Electron's native menu
// presentation on Linux. It also keeps the Window Controls Overlay colors in
// sync with the app's selected chrome theme.

import { existsSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const TAG = "patch-linux-window-chrome";
const appRoot = process.argv[2] ?? "app-extracted";
const buildRoot = join(appRoot, ".vite", "build");

function fail(message) {
  console.error(`${TAG}: ${message}`);
  process.exit(1);
}

function countOccurrences(source, needle) {
  return source.split(needle).length - 1;
}

function replaceExact(source, before, after, alreadyMarker, description) {
  const count = countOccurrences(source, before);
  if (count === 0) {
    if (source.includes(alreadyMarker)) {
      console.log(`${TAG}: ${description} already patched`);
      return { source, patched: false };
    }
    fail(`could not find ${description}`);
  }
  if (count !== 1) {
    fail(`expected one ${description}, found ${count}`);
  }
  console.log(`${TAG}: patched ${description}`);
  return { source: source.replace(before, after), patched: true };
}

function replaceRegex(source, regex, replacement, alreadyMarker, description) {
  const matches = [...source.matchAll(regex)];
  if (matches.length === 0) {
    if (source.includes(alreadyMarker)) {
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
let source = readFileSync(mainFile, "utf8");
let patchedAny = false;

// 1. Make the primary Linux app window use app-controlled chrome so KDE does
// not add a native title bar above the app's own chrome. Older bundles need an
// explicit frameless Linux branch; newer bundles already include Linux in the
// hidden titlebar branch.
{
  const primaryChromeRe =
    /case`primary`:return ([A-Za-z_$][\w$]*)===`darwin`\?([A-Za-z_$][\w$]*)\?\{titleBarStyle:`hiddenInset`,trafficLightPosition:([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*)\)\}:\{vibrancy:`menu`,titleBarStyle:`hiddenInset`,trafficLightPosition:\3\(\4\)\}:\1===`win32`\?\{titleBarStyle:`hidden`,titleBarOverlay:([A-Za-z_$][\w$]*)\(\4\)\}:\{titleBarStyle:`default`\};case`secondary`/g;
  const primaryHiddenLinuxRe =
    /case`primary`:return [A-Za-z_$][\w$]*===`darwin`\?[A-Za-z_$][\w$]*\?\{titleBarStyle:`hiddenInset`,trafficLightPosition:[A-Za-z_$][\w$]*\([A-Za-z_$][\w$]*\)\}:\{vibrancy:`menu`,titleBarStyle:`hiddenInset`,trafficLightPosition:[A-Za-z_$][\w$]*\([A-Za-z_$][\w$]*\)\}:[A-Za-z_$][\w$]*===`win32`\|\|[A-Za-z_$][\w$]*===`linux`\?\{titleBarStyle:`hidden`,titleBarOverlay:[A-Za-z_$][\w$]*\([A-Za-z_$][\w$]*\)\}:\{titleBarStyle:`default`\};case`secondary`/;
  const quickChatPrimaryHiddenLinux =
    source.includes("case`quickChat`:case`primary`:return") &&
    source.includes("===`linux`?{titleBarStyle:`hidden`,titleBarOverlay:");

  if (primaryHiddenLinuxRe.test(source) || quickChatPrimaryHiddenLinux) {
    console.log(`${TAG}: primary Linux hidden titlebar branch already patched upstream`);
  } else {
    const result = replaceRegex(
      source,
      primaryChromeRe,
      "case`primary`:return $1===`darwin`?$2?{titleBarStyle:`hiddenInset`,trafficLightPosition:$3($4)}:{vibrancy:`menu`,titleBarStyle:`hiddenInset`,trafficLightPosition:$3($4)}:$1===`win32`?{titleBarStyle:`hidden`,titleBarOverlay:$5($4)}:$1===`linux`?{frame:!1}:{titleBarStyle:`default`};case`secondary`",
      "===`linux`?{frame:!1}:{titleBarStyle:`default`};case`secondary`",
      "primary Linux frameless window branch",
    );
    source = result.source;
    patchedAny ||= result.patched;
  }
}

// 2. Hide/remove per-window Electron menus for Linux windows created through
// the shared window manager.
{
  const result = replaceExact(
    source,
    "...process.platform===`win32`?{autoHideMenuBar:!0}:{}",
    "...process.platform===`win32`||process.platform===`linux`?{autoHideMenuBar:!0}:{}",
    "...process.platform===`win32`||process.platform===`linux`?{autoHideMenuBar:!0}:{}",
    "Linux autoHideMenuBar BrowserWindow option",
  );
  source = result.source;
  patchedAny ||= result.patched;
}

{
  const upstreamRemoveMenuRe =
    /\(process\.platform===`win32`\|\|process\.platform===`linux`\)&&[A-Za-z_$][\w$]*\.removeMenu\(\)/;
  if (upstreamRemoveMenuRe.test(source)) {
    console.log(`${TAG}: Linux per-window menu removal already patched upstream`);
  } else {
    const windowCreateRe =
      /webPreferences:([A-Za-z_$][\w$]*)\}\);this\.applyWindowBackdrop\(([A-Za-z_$][\w$]*),([A-Za-z_$][\w$]*),!0\);/g;
    const result = replaceRegex(
      source,
      windowCreateRe,
      "webPreferences:$1});process.platform===`linux`&&($2.setMenuBarVisibility(!1),$2.removeMenu()),this.applyWindowBackdrop($2,$3,!0);",
      "process.platform===`linux`&&(",
      "Linux per-window menu removal",
    );
    source = result.source;
    patchedAny ||= result.patched;
  }
}

// 3. Keep application menu refreshes from recreating a visible Linux menu bar.
// Do not remove the per-window menu here: Electron registers Linux menu-item
// accelerators through that menu, even while its menu bar is hidden.
{
  const hideAllWindowMenus =
    "process.platform===`linux`&&$1.BrowserWindow.getAllWindows().forEach(e=>{e.isDestroyed()||e.setMenuBarVisibility(!1)})";
  const replacement =
    `$1.Menu.setApplicationMenu($2),${hideAllWindowMenus},$3($4)`;
  const alreadyMarker = "BrowserWindow.getAllWindows().forEach(e=>{e.isDestroyed()||e.setMenuBarVisibility(!1)})";
  if (source.includes(alreadyMarker)) {
    console.log(`${TAG}: Linux application menu refresh hiding already patched`);
  } else {
    const oldAppMenuSuppressionRe =
      /process\.platform===`linux`\?([A-Za-z_$][\w$]*)\.Menu\.setApplicationMenu\(null\):\1\.Menu\.setApplicationMenu\(([A-Za-z_$][\w$]*)\),([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*)\)/g;
    const appMenuRe =
      /([A-Za-z_$][\w$]*)\.Menu\.setApplicationMenu\(([A-Za-z_$][\w$]*)\),([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*)\)/g;
    const menuRefreshRe = source.match(oldAppMenuSuppressionRe)?.length
      ? oldAppMenuSuppressionRe
      : appMenuRe;
    const result = replaceRegex(
      source,
      menuRefreshRe,
      replacement,
      alreadyMarker,
      "Linux application menu refresh hiding",
    );
    source = result.source;
    patchedAny ||= result.patched;
  }
}

// 4. Browser comment popup windows already hide the menu bar; remove the menu
// itself on Linux too.
{
  const result = replaceExact(
    source,
    "process.platform===`win32`&&e.removeMenu()",
    "(process.platform===`win32`||process.platform===`linux`)&&e.removeMenu()",
    "(process.platform===`win32`||process.platform===`linux`)&&e.removeMenu()",
    "Linux popup menu removal",
  );
  source = result.source;
  patchedAny ||= result.patched;
}

// 5. Match the minimize, maximize, and close controls to the app chrome theme.
// The upstream overlay uses a transparent background and derives only the
// symbol color from nativeTheme. That leaves Linux compositors with controls
// whose background does not match custom app themes. Read the active chrome
// theme's surface/ink colors and refresh the overlay whenever those settings
// or the native light/dark mode change.
{
  const overlayMarker = "linuxTitleBarOverlay(e=1)";
  if (source.includes(overlayMarker)) {
    console.log(`${TAG}: Linux titlebar overlay theme sync already patched`);
  } else {
    const appearanceResolverMatch = source.match(
      /isOpaqueWindowsEnabled\(\)\{return\(([A-Za-z_$][\w$]*)\(this\.options\.settingsStore\.getEffective\(n\.Gi\.theme\.key\)\?\?`system`\)===`light`/,
    );
    if (!appearanceResolverMatch) {
      fail("could not find active appearance resolver");
    }
    const appearanceResolver = appearanceResolverMatch[1];
    const setWindowZoomBefore =
      "n.setTitleBarOverlay(j9(t))";
    const setWindowZoomAfter =
      "n.setTitleBarOverlay(process.platform===`linux`?this.linuxTitleBarOverlay(t):j9(t))";
    const installOverlayBefore =
      "installApplicationMenuTitleBarOverlaySync(e,t){if(process.platform!==`win32`&&process.platform!==`linux`||t!==`primary`&&t!==`quickChat`)return;let n=()=>{e.isDestroyed()||e.setTitleBarOverlay(j9(this.windowZooms.get(e.id)))};return c.nativeTheme.on(`updated`,n),n(),()=>{c.nativeTheme.off(`updated`,n)}}";
    const overlayMethod =
      `linuxTitleBarOverlay(e=1){let t=${appearanceResolver}(this.options.settingsStore.getEffective(n.Gi.theme.key)??\`system\`),r=t===\`light\`?this.options.settingsStore.getEffective(n.Gi.lightChromeTheme.key):this.options.settingsStore.getEffective(n.Gi.darkChromeTheme.key),i=r?.surface,a=r?.ink;return{...j9(e),color:typeof i===\`string\`?i:c.nativeTheme.shouldUseDarkColors?\`#000000\`:\`#f9f9f9\`,symbolColor:typeof a===\`string\`?a:c.nativeTheme.shouldUseDarkColors?\`#ffffff\`:\`#1f1f1f\`}}`;
    const installOverlayAfter =
      `${overlayMethod}installApplicationMenuTitleBarOverlaySync(e,t){if(process.platform!==\`win32\`&&process.platform!==\`linux\`||t!==\`primary\`&&t!==\`quickChat\`)return;let r=()=>{e.isDestroyed()||e.setTitleBarOverlay(process.platform===\`linux\`?this.linuxTitleBarOverlay(this.windowZooms.get(e.id)):j9(this.windowZooms.get(e.id)))},i=process.platform===\`linux\`?[this.options.settingsStore.onDidChange(n.Gi.theme.key,r),this.options.settingsStore.onDidChange(n.Gi.lightChromeTheme.key,r),this.options.settingsStore.onDidChange(n.Gi.darkChromeTheme.key,r)]:[];return c.nativeTheme.on(\`updated\`,r),r(),()=>{c.nativeTheme.off(\`updated\`,r),i.forEach(e=>e())}}`;

    let result = replaceExact(
      source,
      setWindowZoomBefore,
      setWindowZoomAfter,
      setWindowZoomAfter,
      "Linux zoom-aware titlebar overlay theme sync",
    );
    source = result.source;
    patchedAny ||= result.patched;

    result = replaceExact(
      source,
      installOverlayBefore,
      installOverlayAfter,
      overlayMarker,
      "Linux titlebar overlay theme listeners",
    );
    source = result.source;
    patchedAny ||= result.patched;
  }
}

if (patchedAny) {
  writeFileSync(mainFile, source);
  console.log(`${TAG}: patched ${mainFile}`);
} else {
  console.log(`${TAG}: ${mainFile} already patched`);
}
