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

const TAG = "patch-linux-pet-pointer-recovery";
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
let source = readFileSync(mainFile, "utf8");

const dragEndUnpatched = String.raw`this\.dragState=null,this\.windowServerDragActive=!1,this\.windowServerDragWindowX=null,([A-Za-z_$][\w$]*)\?this\.persistWindowBounds\(([A-Za-z_$][\w$]*),`;
const dragEndPatched = String.raw`this\.dragState=null,this\.windowServerDragActive=!1,this\.windowServerDragWindowX=null,process\.env\.CODEX_DESKTOP_PET_POINTER_RECOVERY===\x601\x60&&\(this\.mousePassthroughEnabled=!1,([A-Za-z_$][\w$]*)\.setIgnoreMouseEvents\(!1\),this\.refreshCursorAtCurrentMousePosition\(\1\),setTimeout\(\(\)=>\{\1\.isDestroyed\(\)\|\|this\.applyPointerInteractivityPolicy\(\)\},250\)\.unref\?\.\(\)\),([A-Za-z_$][\w$]*)\?this\.persistWindowBounds\(\1,`;

const policyUnpatched = String.raw`applyPointerInteractivityPolicy\(\)\{let ([A-Za-z_$][\w$]*)=this\.window;if\(\1==null\|\|\1\.isDestroyed\(\)\)\{this\.mousePassthroughEnabled=!1;return\}let ([A-Za-z_$][\w$]*)=!this\.pointerInteractive;if\(this\.mousePassthroughEnabled!==\2\)`;
const policyPatched = String.raw`applyPointerInteractivityPolicy\(\)\{let ([A-Za-z_$][\w$]*)=this\.window;if\(\1==null\|\|\1\.isDestroyed\(\)\)\{this\.mousePassthroughEnabled=!1;return\}let ([A-Za-z_$][\w$]*)=process\.env\.CODEX_DESKTOP_PET_POINTER_RECOVERY===\x601\x60\?!1:!this\.pointerInteractive;if\(this\.mousePassthroughEnabled!==\2\)`;

const pointerMethods =
  "installPointerRecovery(e){" +
  "this.mousePassthroughEnabled=!1,e.setIgnoreMouseEvents(!1);" +
  "let t=setInterval(()=>{" +
  "if(e.isDestroyed()){clearInterval(t);return}" +
  "if(!e.isVisible())return;" +
  "this.mousePassthroughEnabled=!1,e.setIgnoreMouseEvents(!1)," +
  "e.setAlwaysOnTop(!0,`floating`),e.moveTop()" +
  "},250);t.unref?.(),e.once(`closed`,()=>clearInterval(t))}";

const pollingUnpatched = String.raw`([A-Za-z_$][\w$]*)\.setAlwaysOnTop\(!0,\x60floating\x60\),\1\.setMenuBarVisibility\(!1\),this\.addDisplayChangeListeners\(\)`;
const pollingPatched = String.raw`([A-Za-z_$][\w$]*)\.setAlwaysOnTop\(!0,\x60floating\x60\),\1\.setMenuBarVisibility\(!1\),process\.env\.CODEX_DESKTOP_PET_POINTER_RECOVERY===\x601\x60&&this\.installPointerRecovery\(\1\),this\.addDisplayChangeListeners\(\)`;

// In 26.721.41059 upstream incorporated the old patch's display-transition
// intent: display bounds, id, and resolution are refreshed before the
// same-placement early return. Verify that behavior instead of replacing the
// new five-argument layout method with the older four-argument implementation.
const currentDisplayTransition = String.raw`updateWindowServerDragPlacement\(([A-Za-z_$][\w$]*),([A-Za-z_$][\w$]*),([A-Za-z_$][\w$]*),([A-Za-z_$][\w$]*),([A-Za-z_$][\w$]*)\)\{let ([A-Za-z_$][\w$]*)=[A-Za-z_$][\w$]*\(\3,\4\.workArea\);if\(this\.anchor=\3,this\.displayBounds=\4\.bounds,this\.displayId=\4\.id,this\.resolutionKey=[A-Za-z_$][\w$]*\(\4\.bounds\),\6===this\.placement\)`;

function matches(pattern, input = source) {
  return [...input.matchAll(new RegExp(pattern, "g"))];
}

function patchDragEnd() {
  const unpatched = matches(dragEndUnpatched);
  const patched = matches(dragEndPatched);
  if (unpatched.length === 0 && patched.length === 1) {
    return false;
  }
  if (unpatched.length !== 1 || patched.length !== 0) {
    fail(
      `expected one drag-end cleanup (unpatched=${unpatched.length}, patched=${patched.length})`,
    );
  }

  const [fullMatch, wasWindowServerDrag, window] = unpatched[0];
  const replacement =
    "this.dragState=null,this.windowServerDragActive=!1," +
    "this.windowServerDragWindowX=null," +
    "process.env.CODEX_DESKTOP_PET_POINTER_RECOVERY===`1`&&(" +
    "this.mousePassthroughEnabled=!1," +
    `${window}.setIgnoreMouseEvents(!1),` +
    `this.refreshCursorAtCurrentMousePosition(${window}),` +
    `setTimeout(()=>{${window}.isDestroyed()||` +
    "this.applyPointerInteractivityPolicy()},250).unref?.())," +
    `${wasWindowServerDrag}?this.persistWindowBounds(${window},`;
  source = source.replace(fullMatch, replacement);
  return true;
}

function patchPointerPolicy() {
  const unpatched = matches(policyUnpatched);
  const patched = matches(policyPatched);
  const methodsPresent = source.includes(pointerMethods);
  if (
    unpatched.length === 0 &&
    patched.length === 1 &&
    methodsPresent
  ) {
    return false;
  }
  if (
    unpatched.length !== 1 ||
    patched.length !== 0 ||
    methodsPresent
  ) {
    fail(
      `expected one pointer policy (unpatched=${unpatched.length}, patched=${patched.length}, methods=${Number(methodsPresent)})`,
    );
  }

  const [fullMatch, window, passthrough] = unpatched[0];
  const replacement =
    pointerMethods +
    `applyPointerInteractivityPolicy(){let ${window}=this.window;` +
    `if(${window}==null||${window}.isDestroyed()){` +
    "this.mousePassthroughEnabled=!1;return}" +
    `let ${passthrough}=process.env.CODEX_DESKTOP_PET_POINTER_RECOVERY===` +
    "`1`?!1:!this.pointerInteractive;" +
    `if(this.mousePassthroughEnabled!==${passthrough})`;
  source = source.replace(fullMatch, replacement);
  return true;
}

function patchPointerPolling() {
  const unpatched = matches(pollingUnpatched);
  const patched = matches(pollingPatched);
  if (unpatched.length === 0 && patched.length === 1) {
    return false;
  }
  if (unpatched.length !== 1 || patched.length !== 0) {
    fail(
      `expected one pointer polling hook (unpatched=${unpatched.length}, patched=${patched.length})`,
    );
  }

  const [fullMatch, window] = unpatched[0];
  const replacement =
    `${window}.setAlwaysOnTop(!0,\`floating\`),` +
    `${window}.setMenuBarVisibility(!1),` +
    "process.env.CODEX_DESKTOP_PET_POINTER_RECOVERY===`1`&&" +
    `this.installPointerRecovery(${window}),this.addDisplayChangeListeners()`;
  source = source.replace(fullMatch, replacement);
  return true;
}

if (matches(currentDisplayTransition).length !== 1) {
  fail("could not verify current upstream display-transition behavior");
}

const dragEndChanged = patchDragEnd();
const policyChanged = patchPointerPolicy();
const pollingChanged = patchPointerPolling();

if (
  matches(dragEndUnpatched).length !== 0 ||
  matches(dragEndPatched).length !== 1 ||
  matches(policyUnpatched).length !== 0 ||
  matches(policyPatched).length !== 1 ||
  !source.includes(pointerMethods) ||
  matches(pollingUnpatched).length !== 0 ||
  matches(pollingPatched).length !== 1
) {
  fail(`patch verification failed in ${mainFile}`);
}

if (!dragEndChanged && !policyChanged && !pollingChanged) {
  console.log(`${TAG}: main bundle already patched`);
  process.exit(0);
}

writeFileSync(mainFile, source);
console.log(`${TAG}: patched ${mainFile}`);
