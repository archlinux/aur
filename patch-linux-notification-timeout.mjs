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

const TAG = "patch-linux-notification-timeout";
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

// Electron calls libnotify synchronously on the main process. If the desktop
// notification D-Bus service is unhealthy, each call can block for about 25
// seconds and make the entire app appear hung. Send actionless completion
// notifications through a short-lived child so a broken service cannot block
// Electron. Interactive permission/question notifications remain native.
const anchor =
  "this.logger.info(`show notification`,{safe:{notificationId:e.id," +
  "kind:e.kind,actionCount:i.length},sensitive:{}});";
const isolated =
  "if(process.env.CODEX_DESKTOP_ISOLATE_NOTIFICATIONS===`1`&&" +
  "this.options.platform===`linux`&&e.kind===`turn-complete`&&i.length===0){" +
  "let a;try{a=h.spawn(`/usr/bin/notify-send`,[" +
  "`--app-name=Codex`,`--icon=openai-codex-desktop`,`--expire-time=10000`," +
  "`--`,Jg(e.title),Jg(e.body)],{stdio:`ignore`})," +
  "a.once(`error`,()=>{}),a.unref()," +
  "setTimeout(()=>{a.exitCode==null&&!a.killed&&a.kill()},5e3).unref?.()}" +
  "catch{}r?.();return}";
const patchedAnchor = anchor + isolated;

const anchorCount = source.split(anchor).length - 1;
const patchedCount = source.split(patchedAnchor).length - 1;

if (anchorCount === 1 && patchedCount === 1) {
  console.log(`${TAG}: main bundle already patched`);
  process.exit(0);
}

if (anchorCount !== 1 || patchedCount !== 0) {
  fail(
    `expected one notification handler (anchor=${anchorCount}, patched=${patchedCount})`,
  );
}

const updated = source.replace(anchor, patchedAnchor);

if (updated === source || updated.split(patchedAnchor).length - 1 !== 1) {
  fail(`patch verification failed in ${mainFile}`);
}

writeFileSync(mainFile, updated);
console.log(`${TAG}: patched ${mainFile}`);
