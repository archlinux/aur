#!/usr/bin/env node
// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD

import {
  existsSync,
  readdirSync,
  readFileSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { join } from "node:path";

const TAG = "patch-linux-pet-lifecycle";
const appRoot = process.argv[2] ?? "app-extracted";
const buildRoot = join(appRoot, ".vite", "build");

function fail(message) {
  console.error(`${TAG}: ${message}`);
  process.exit(1);
}

if (!existsSync(buildRoot) || !statSync(buildRoot).isDirectory()) {
  fail(`could not find Vite build directory: ${buildRoot}`);
}

const mainFiles = readdirSync(buildRoot, { withFileTypes: true })
  .filter((entry) => entry.isFile() && /^main-[^/]+\.js$/.test(entry.name))
  .map((entry) => join(buildRoot, entry.name));

if (mainFiles.length !== 1) {
  fail(`expected one main-*.js bundle, found ${mainFiles.length}`);
}

const mainFile = mainFiles[0];
const source = readFileSync(mainFile, "utf8");

// The upstream macOS app can keep its pet window alive after the final primary
// window closes. In the Linux package that also keeps the launcher and webview
// server alive without leaving a usable pet control surface. Let the launcher
// opt into normal application shutdown when the final primary window closes.
const unpatchedPattern = String.raw`([A-Za-z_$][\w$]*)&&\(this\.primaryWindows\.delete\(([A-Za-z_$][\w$]*)\),this\.lastActivePrimaryWindow===\2&&\(this\.lastActivePrimaryWindow=null\),this\.emitPrimaryWindowChangeIfNeeded\(\)\)`;
const patchedPattern = String.raw`([A-Za-z_$][\w$]*)&&\(this\.primaryWindows\.delete\(([A-Za-z_$][\w$]*)\),this\.lastActivePrimaryWindow===\2&&\(this\.lastActivePrimaryWindow=null\),this\.emitPrimaryWindowChangeIfNeeded\(\),process\.env\.CODEX_DESKTOP_QUIT_ON_LAST_WINDOW===\x601\x60&&this\.primaryWindows\.size===0&&require\(\x60electron\x60\)\.app\.quit\(\)\)`;

function matches(pattern, input = source) {
  return [...input.matchAll(new RegExp(pattern, "g"))];
}

const unpatched = matches(unpatchedPattern);
const patched = matches(patchedPattern);

if (unpatched.length === 0 && patched.length === 1) {
  console.log(`${TAG}: main bundle already patched`);
  process.exit(0);
}

if (unpatched.length !== 1 || patched.length !== 0) {
  fail(
    `expected one primary-window close handler (unpatched=${unpatched.length}, patched=${patched.length})`,
  );
}

const [fullMatch, guard, window] = unpatched[0];
const replacement =
  `${guard}&&(this.primaryWindows.delete(${window}),` +
  `this.lastActivePrimaryWindow===${window}&&` +
  `(this.lastActivePrimaryWindow=null),` +
  "this.emitPrimaryWindowChangeIfNeeded()," +
  "process.env.CODEX_DESKTOP_QUIT_ON_LAST_WINDOW===`1`&&" +
  "this.primaryWindows.size===0&&require(`electron`).app.quit())";
const updated = source.replace(fullMatch, replacement);

if (updated === source) {
  fail(`replacement did not change ${mainFile}`);
}

if (
  matches(unpatchedPattern, updated).length !== 0 ||
  matches(patchedPattern, updated).length !== 1
) {
  fail(`patch verification failed in ${mainFile}`);
}

writeFileSync(mainFile, updated);
console.log(`${TAG}: patched ${mainFile}`);
