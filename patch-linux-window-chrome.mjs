#!/usr/bin/env node
// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD
//
// Patches the Codex desktop app to integrate its complete window surface on
// Linux: opaque backgrounds, custom chrome, native controls, menus, and
// titlebar tooltip placement.
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
const webviewAssets = join(appRoot, "webview", "assets");

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

function replaceOptionalRegex(source, regex, replacement, alreadyRegex, description) {
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

function patchLegacyBackgroundFunction(source) {
  const backgroundFunction = new RegExp(
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
      ":\\{backgroundColor:\\10,backgroundMaterial:null\\}\\}",
  );
  const match = source.match(backgroundFunction);
  if (!match) {
    return { source, matched: false };
  }

  const [fullMatch, , platform, appearance, , darkMode, predicate, dark, light, win32Branch] =
    match;
  const linuxBranch =
    `${platform}===\`linux\`&&!${predicate}(${appearance})` +
    `?{backgroundColor:${darkMode}?${dark}:${light},backgroundMaterial:null}:`;
  return {
    source: source.replace(fullMatch, fullMatch.replace(win32Branch, `${linuxBranch}${win32Branch}`)),
    matched: true,
  };
}

function patchOpaqueSurfacePredicates(source) {
  let matchedAny = false;
  let patchedAny = false;
  let result = replaceOptionalRegex(
    source,
    /function ([A-Za-z_$][\w$]*)\(\{appearance:([A-Za-z_$][\w$]*),opaqueWindowsEnabled:([A-Za-z_$][\w$]*),platform:([A-Za-z_$][\w$]*)\}\)\{return \3&&!([A-Za-z_$][\w$]*)\(\2\)&&\(\4===`darwin`\|\|\4===`win32`\)\}/g,
    "function $1({appearance:$2,opaqueWindowsEnabled:$3,platform:$4}){return $3&&!$5($2)&&($4===`darwin`||$4===`win32`||$4===`linux`)}",
    /function [A-Za-z_$][\w$]*\(\{appearance:[A-Za-z_$][\w$]*,opaqueWindowsEnabled:[A-Za-z_$][\w$]*,platform:[A-Za-z_$][\w$]*\}\)\{return [A-Za-z_$][\w$]*&&![A-Za-z_$][\w$]*\([A-Za-z_$][\w$]*\)&&\([A-Za-z_$][\w$]*===`darwin`\|\|[A-Za-z_$][\w$]*===`win32`\|\|[A-Za-z_$][\w$]*===`linux`\)\}/,
    "always-opaque Linux surface predicate",
  );
  source = result.source;
  matchedAny ||= result.matched;
  patchedAny ||= result.patched;

  result = replaceOptionalRegex(
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

// 1. Use opaque Linux surfaces. The macOS bundle otherwise supplies
// transparent backgrounds intended for vibrancy and mica effects, which can
// produce compositor artifacts on Wayland.
{
  const legacyResult = patchLegacyBackgroundFunction(source);
  if (legacyResult.matched) {
    source = legacyResult.source;
    patchedAny = true;
    console.log(`${TAG}: patched legacy Linux background function`);
  } else if (source.includes("===`linux`&&!") && source.includes("backgroundMaterial:null}:")) {
    console.log(`${TAG}: legacy Linux background function already patched`);
  } else {
    const surfaceResult = patchOpaqueSurfacePredicates(source);
    if (!surfaceResult.matched) {
      fail("could not find BrowserWindow background function or opaque surface predicates");
    }
    source = surfaceResult.source;
    patchedAny ||= surfaceResult.patched;
  }
}

// 2. Make the primary Linux app window use app-controlled chrome so KDE does
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

// 3. Hide/remove per-window Electron menus for Linux windows created through
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

// 4. Keep application menu refreshes from recreating a visible Linux menu bar.
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

// 5. Browser comment popup windows already hide the menu bar; remove the menu
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

// 6. Match the minimize, maximize, and close controls to the app chrome theme.
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
      /isOpaqueWindowsEnabled\(\)\{return\(([A-Za-z_$][\w$]*)\(this\.options\.settingsStore\.getEffective\(([A-Za-z_$][\w$]*\.[A-Za-z_$][\w$]*)\.theme\.key\)\?\?`system`\)===`light`/,
    );
    if (!appearanceResolverMatch) {
      fail("could not find active appearance resolver");
    }
    const appearanceResolver = appearanceResolverMatch[1];
    const settingsKeys = appearanceResolverMatch[2];
    const installOverlayMatch = source.match(
      /installApplicationMenuTitleBarOverlaySync\(e,t\)\{if\(process\.platform!==`win32`&&process\.platform!==`linux`\|\|t!==`primary`&&t!==`quickChat`\)return;let ([A-Za-z_$][\w$]*)=\(\)=>\{e\.isDestroyed\(\)\|\|e\.setTitleBarOverlay\(([A-Za-z_$][\w$]*)\(this\.windowZooms\.get\(e\.id\)\)\)\};return ([A-Za-z_$][\w$]*)\.nativeTheme\.on\(`updated`,\1\),\1\(\),\(\)=>\{\3\.nativeTheme\.off\(`updated`,\1\)\}\}/,
    );
    if (!installOverlayMatch) {
      fail("could not find Linux titlebar overlay theme listeners");
    }
    const installOverlayBefore = installOverlayMatch[0];
    const overlayFactory = installOverlayMatch[2];
    const electronBinding = installOverlayMatch[3];
    const setWindowZoomRe =
      /([A-Za-z_$][\w$]*)\.setTitleBarOverlay\(([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*)\)\)/g;
    const setWindowZoomAfter =
      `$1.setTitleBarOverlay(process.platform===\`linux\`?this.linuxTitleBarOverlay($3):$2($3))`;
    const overlayMethod =
      `linuxTitleBarOverlay(e=1){let t=${appearanceResolver}(this.options.settingsStore.getEffective(${settingsKeys}.theme.key)??\`system\`),r=t===\`light\`?this.options.settingsStore.getEffective(${settingsKeys}.lightChromeTheme.key):this.options.settingsStore.getEffective(${settingsKeys}.darkChromeTheme.key),i=r?.surface,a=r?.ink;return{...${overlayFactory}(e),color:typeof i===\`string\`?i:${electronBinding}.nativeTheme.shouldUseDarkColors?\`#000000\`:\`#f9f9f9\`,symbolColor:typeof a===\`string\`?a:${electronBinding}.nativeTheme.shouldUseDarkColors?\`#ffffff\`:\`#1f1f1f\`}}`;
    const installOverlayAfter =
      `${overlayMethod}installApplicationMenuTitleBarOverlaySync(e,t){if(process.platform!==\`win32\`&&process.platform!==\`linux\`||t!==\`primary\`&&t!==\`quickChat\`)return;let r=()=>{e.isDestroyed()||e.setTitleBarOverlay(process.platform===\`linux\`?this.linuxTitleBarOverlay(this.windowZooms.get(e.id)):${overlayFactory}(this.windowZooms.get(e.id)))},i=process.platform===\`linux\`?[this.options.settingsStore.onDidChange(${settingsKeys}.theme.key,r),this.options.settingsStore.onDidChange(${settingsKeys}.lightChromeTheme.key,r),this.options.settingsStore.onDidChange(${settingsKeys}.darkChromeTheme.key,r)]:[];return ${electronBinding}.nativeTheme.on(\`updated\`,r),r(),()=>{${electronBinding}.nativeTheme.off(\`updated\`,r),i.forEach(e=>e())}}`;

    let result = replaceRegex(
      source,
      setWindowZoomRe,
      setWindowZoomAfter,
      "setTitleBarOverlay(process.platform===`linux`?this.linuxTitleBarOverlay(",
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

if (!existsSync(webviewAssets) || !statSync(webviewAssets).isDirectory()) {
  fail(`could not find webview assets directory: ${webviewAssets}`);
}

const webviewJsFiles = readdirSync(webviewAssets, { withFileTypes: true })
  .filter((entry) => entry.isFile() && entry.name.endsWith(".js"))
  .map((entry) => join(webviewAssets, entry.name));

// 7. Keep the renderer theme opaque as well as the native BrowserWindow.
{
  const themeFiles = webviewJsFiles.filter((file) =>
    readFileSync(file, "utf8").includes("opaqueWindows:!1"),
  );
  let themePatched = 0;
  for (const file of themeFiles) {
    const original = readFileSync(file, "utf8");
    const updated = original.replaceAll("opaqueWindows:!1", "opaqueWindows:!0");
    if (updated !== original) {
      writeFileSync(file, updated);
      themePatched++;
      console.log(`${TAG}: patched opaque theme defaults in ${file}`);
    }
  }
  if (themePatched === 0) {
    console.log(`${TAG}: opaque theme defaults already patched`);
  }
}

// 8. Keep titlebar tooltips below Electron's Window Controls Overlay. The
// native controls sit above web contents and are invisible to Floating UI's
// collision detection, so top-side tooltips otherwise overlap them.
{
  const placementMarker = "linuxTooltipOverlayBottom";
  const nativeTitleMarker = ".removeAttribute(`title`)";
  const tooltipFiles = webviewJsFiles.filter((file) => {
    const fileSource = readFileSync(file, "utf8");
    return (
      fileSource.includes("--radix-tooltip-content-available-height") &&
      fileSource.includes("referenceElementRef:") &&
      fileSource.includes("positioningElement:")
    );
  });

  if (tooltipFiles.length !== 1) {
    fail(`expected one tooltip positioning bundle, found ${tooltipFiles.length}`);
  }

  const tooltipFile = tooltipFiles[0];
  let tooltipSource = readFileSync(tooltipFile, "utf8");
  let tooltipPatched = false;

  if (tooltipSource.includes(placementMarker)) {
    console.log(`${TAG}: titlebar tooltip placement already patched`);
  } else {
    const tooltipFunctionStart =
      /(function [A-Za-z_$][\w$]*\(\{[^{}]{0,700}positioningElement:[A-Za-z_$][\w$]*,referenceElementRef:([A-Za-z_$][\w$]*),side:([A-Za-z_$][\w$]*),sideOffset:[A-Za-z_$][\w$]*,variant:[A-Za-z_$][\w$]*\}\)\{)let /g;
    const matches = [...tooltipSource.matchAll(tooltipFunctionStart)];
    if (matches.length !== 1) {
      fail(`expected one tooltip positioning function, found ${matches.length}`);
    }

    const [match, functionStart, referenceRef, side] = matches[0];
    const titlebarPlacement =
      `let linuxTooltipReferenceTop=${referenceRef}.current?.getBoundingClientRect().top,` +
      `linuxTooltipOverlayBottom=typeof navigator===\`undefined\`?64:` +
      `Math.max(navigator.windowControlsOverlay?.getTitlebarAreaRect?.().bottom??0,64);` +
      `${side}=${side}===\`top\`&&linuxTooltipReferenceTop!=null&&` +
      `linuxTooltipReferenceTop<linuxTooltipOverlayBottom?\`bottom\`:${side};let `;
    tooltipSource = tooltipSource.replace(match, `${functionStart}${titlebarPlacement}`);
    tooltipPatched = true;
  }

  if (tooltipSource.includes(nativeTitleMarker)) {
    console.log(`${TAG}: redundant native tooltip suppression already patched`);
  } else {
    const triggerRefCallback =
      /([A-Za-z_$][\w$]*)=([A-Za-z_$][\w$]*)=>\{([A-Za-z_$][\w$]*)\(\2\),([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*),\2\)\},([A-Za-z_$][\w$]*);return \6=/g;
    const matches = [...tooltipSource.matchAll(triggerRefCallback)];
    if (matches.length !== 1) {
      fail(`expected one tooltip trigger ref callback, found ${matches.length}`);
    }

    const [match, callback, element, setReference, mergeRef, externalRef, renderedTrigger] =
      matches[0];
    const replacement =
      `${callback}=${element}=>{${element}?.removeAttribute(\`title\`),` +
      `${setReference}(${element}),${mergeRef}(${externalRef},${element})},` +
      `${renderedTrigger};return ${renderedTrigger}=`;
    tooltipSource = tooltipSource.replace(match, replacement);
    tooltipPatched = true;
  }

  if (tooltipPatched) {
    writeFileSync(tooltipFile, tooltipSource);
    console.log(`${TAG}: patched titlebar tooltip behavior in ${tooltipFile}`);
  }
}
