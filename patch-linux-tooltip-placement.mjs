#!/usr/bin/env node
// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD
//
// Keeps titlebar tooltips clear of Electron's Window Controls Overlay on Linux.
//
// Electron renders the minimize, maximize, and close buttons above the web
// contents. Floating UI therefore cannot detect them as an obstruction and may
// place a top-side tooltip underneath the native controls. For triggers in the
// titlebar, prefer the bottom side so the tooltip stays in the web content area.

import { existsSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const TAG = "patch-linux-tooltip-placement";
const PATCH_MARKER = "linuxTooltipOverlayBottom";
const NATIVE_TITLE_MARKER = ".removeAttribute(`title`)";
const appRoot = process.argv[2] ?? "app-extracted";
const assetsRoot = join(appRoot, "webview", "assets");

function fail(message) {
  console.error(`${TAG}: ${message}`);
  process.exit(1);
}

if (!existsSync(assetsRoot) || !statSync(assetsRoot).isDirectory()) {
  fail(`could not find webview assets directory: ${assetsRoot}`);
}

const jsFiles = readdirSync(assetsRoot, { withFileTypes: true })
  .filter((entry) => entry.isFile() && entry.name.endsWith(".js"))
  .map((entry) => join(assetsRoot, entry.name));

const tooltipFiles = jsFiles.filter((file) => {
  const source = readFileSync(file, "utf8");
  return (
    source.includes("--radix-tooltip-content-available-height") &&
    source.includes("referenceElementRef:") &&
    source.includes("positioningElement:")
  );
});

if (tooltipFiles.length !== 1) {
  fail(`expected one tooltip positioning bundle, found ${tooltipFiles.length}`);
}

const tooltipFile = tooltipFiles[0];
let source = readFileSync(tooltipFile, "utf8");
let patchedAny = false;

if (source.includes(PATCH_MARKER)) {
  console.log(`${TAG}: tooltip placement already patched in ${tooltipFile}`);
} else {
  const tooltipFunctionStart =
    /(function [A-Za-z_$][\w$]*\(\{[^{}]{0,700}positioningElement:[A-Za-z_$][\w$]*,referenceElementRef:([A-Za-z_$][\w$]*),side:([A-Za-z_$][\w$]*),sideOffset:[A-Za-z_$][\w$]*,variant:[A-Za-z_$][\w$]*\}\)\{)let /g;
  const matches = [...source.matchAll(tooltipFunctionStart)];

  if (matches.length !== 1) {
    fail(`expected one tooltip positioning function, found ${matches.length}`);
  }

  const [match, functionStart, referenceRef, side] = matches[0];
  const titlebarPlacement =
    `let linuxTooltipReferenceTop=${referenceRef}.current?.getBoundingClientRect().top,` +
    `linuxTooltipOverlayBottom=typeof navigator===\`undefined\`?64:` +
    `Math.max(navigator.windowControlsOverlay?.getTitlebarAreaRect?.().bottom??0,64);` +
    `${side}=${side}===\`top\`&&linuxTooltipReferenceTop!=null&&linuxTooltipReferenceTop<linuxTooltipOverlayBottom?\`bottom\`:${side};let `;

  source = source.replace(match, `${functionStart}${titlebarPlacement}`);
  patchedAny = true;

  if (!source.includes(PATCH_MARKER)) {
    fail("patch verification failed: placement marker was not added");
  }
}

if (source.includes(NATIVE_TITLE_MARKER)) {
  console.log(`${TAG}: redundant native tooltip suppression already patched in ${tooltipFile}`);
} else {
  const triggerRefCallback =
    /([A-Za-z_$][\w$]*)=([A-Za-z_$][\w$]*)=>\{([A-Za-z_$][\w$]*)\(\2\),([A-Za-z_$][\w$]*)\(([A-Za-z_$][\w$]*),\2\)\},([A-Za-z_$][\w$]*);return \6=/g;
  const matches = [...source.matchAll(triggerRefCallback)];

  if (matches.length !== 1) {
    fail(`expected one tooltip trigger ref callback, found ${matches.length}`);
  }

  const [match, callback, element, setReference, mergeRef, externalRef, renderedTrigger] =
    matches[0];
  const replacement =
    `${callback}=${element}=>{${element}?.removeAttribute(\`title\`),` +
    `${setReference}(${element}),${mergeRef}(${externalRef},${element})},` +
    `${renderedTrigger};return ${renderedTrigger}=`;

  source = source.replace(match, replacement);
  patchedAny = true;

  if (!source.includes(NATIVE_TITLE_MARKER)) {
    fail("patch verification failed: native title suppression was not added");
  }
}

if (patchedAny) {
  writeFileSync(tooltipFile, source);
  console.log(`${TAG}: patched titlebar tooltip behavior in ${tooltipFile}`);
}
