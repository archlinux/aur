#!/usr/bin/env node
// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD

import { existsSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const appRoot = process.argv[2] ?? "app-extracted";
const buildRoot = join(appRoot, ".vite", "build");

function fail(message) {
  console.error(`patch-linux-open-targets: ${message}`);
  process.exit(1);
}

function readJsFiles(dir) {
  return readdirSync(dir, { withFileTypes: true })
    .filter((entry) => entry.isFile() && entry.name.endsWith(".js"))
    .map((entry) => join(dir, entry.name));
}

if (!existsSync(buildRoot) || !statSync(buildRoot).isDirectory()) {
  fail(`could not find Vite build directory: ${buildRoot}`);
}

const targetFiles = readJsFiles(buildRoot).filter((file) =>
  readFileSync(file, "utf8").includes("open-in-targets"),
);

if (targetFiles.length !== 1) {
  fail(`expected one open-in-targets bundle, found ${targetFiles.length}`);
}

const targetFile = targetFiles[0];
let source = readFileSync(targetFile, "utf8");

if (source.includes("function linuxResolveEditorTarget(")) {
  console.log(`patch-linux-open-targets: ${targetFile} already patched`);
  process.exit(0);
}

const requiredMarkers = [
  "function q(e){",
  "function Bm(e){",
  "var ah=",
  "function hg(e,t){",
  "async function xg(e){",
];

for (const marker of requiredMarkers) {
  if (!source.includes(marker)) {
    fail(`upstream bundle layout changed; missing marker: ${marker}`);
  }
}

const registryPattern =
  /var ([A-Za-z_$][\w$]*)=\[([^\]]+)\],([A-Za-z_$][\w$]*)=t\.Pr\(`open-in-targets`\);/;
const registryMatch = source.match(registryPattern);

if (!registryMatch) {
  fail("could not find open-in-targets registry declaration");
}

const [registrySource, registryName, registryEntries, loggerName] = registryMatch;
const expectedTargets = ["vscode", "vscodeInsiders", "cursor", "windsurf", "zed", "fileManager"];

for (const targetId of expectedTargets) {
  if (!source.includes(`id:\`${targetId}\``)) {
    fail(`upstream bundle layout changed; missing target id: ${targetId}`);
  }
}

const linuxPatch = [
  "function linuxResolveAbsoluteCommand(e){let t=Bm(e);return t&&(0,o.existsSync)(t)?t:null}",
  "function linuxDesktopEntrySearchRoots(){let e=(0,r.homedir)();return[(0,i.join)(e,`.local`,`share`,`applications`),`/usr/share/applications`]}",
  "function linuxOpenTargetSearchRoots(){let e=(0,r.homedir)();return[(0,i.join)(e,`Applications`),(0,i.join)(e,`Downloads`),`/opt`]}",
  "function linuxResolveDesktopExec(e){let t=e.trim().match(/^\"([^\"]+)\"|^\\x27([^\\x27]+)\\x27|^(\\S+)/),n=t?.[1]??t?.[2]??t?.[3];if(!n)return null;return linuxResolveAbsoluteCommand(n)??(()=>{let e=q(n);return e?Bm(e):null})()}",
  "function linuxFindDesktopEntryExec(e){let t=e.map(e=>e.toLowerCase());for(let e of linuxDesktopEntrySearchRoots()){let n;try{n=(0,o.readdirSync)(e)}catch{continue}for(let r of n){let a=r.toLowerCase();if(!a.endsWith(`.desktop`)||!t.some(e=>a.includes(e)))continue;let s=(0,i.join)(e,r),c=null;try{c=(0,o.readFileSync)(s,`utf8`)}catch{continue}let l=c.match(/^Exec=(.+)$/m)?.[1]?.trim();if(!l)continue;let u=linuxResolveDesktopExec(l.replace(/%.?/g,``).trim());if(u)return u}}return null}",
  "function linuxFindAppImage(e){let t=e.map(e=>e.toLowerCase());for(let e of linuxOpenTargetSearchRoots()){let n;try{n=(0,o.readdirSync)(e,{withFileTypes:!0})}catch{continue}for(let r of n){if(!r.isFile())continue;let n=r.name.toLowerCase();if(!n.endsWith(`.appimage`)||!t.some(e=>n.includes(e)))continue;let a=linuxResolveAbsoluteCommand((0,i.join)(e,r.name));if(a)return a}}return null}",
  "function linuxResolveEditorTarget(e,t=[],n=[]){for(let t of e){let e=q(t);if(e){let t=Bm(e);if(t)return t}}for(let e of t){let t=linuxResolveAbsoluteCommand(e);if(t)return t}let r=n.length>0?linuxFindDesktopEntryExec(n):null;return r??(n.length>0?linuxFindAppImage(n):null)}",
  "function linuxFileManagerDetect(){return q(`xdg-open`)??linuxResolveAbsoluteCommand(`/usr/bin/xdg-open`)}",
  "function linuxOpenFileManagerPath(e){let t=e;for(;;){if((0,o.existsSync)(t))break;let e=(0,i.dirname)(t);if(e===t){t=null;break}t=e}let n=t??e;if((0,o.existsSync)(n)&&(0,o.statSync)(n).isFile())n=(0,i.dirname)(n);return xg(n)}",
  "var linuxVscode={id:`vscode`,platforms:{linux:{label:`VS Code`,icon:`apps/vscode.png`,kind:`editor`,detect:()=>linuxResolveEditorTarget([`code`,`code-oss`],[`/usr/bin/code`,`/usr/bin/code-oss`,`/snap/bin/code`],[`visual studio code`,`code`,`code-oss`]),args:ah,supportsSsh:!0}}},",
  "linuxVscodeInsiders={id:`vscodeInsiders`,platforms:{linux:{label:`VS Code Insiders`,icon:`apps/vscode-insiders.png`,kind:`editor`,detect:()=>linuxResolveEditorTarget([`code-insiders`],[`/usr/bin/code-insiders`,`/snap/bin/code-insiders`],[`insiders`,`code-insiders`]),args:ah,supportsSsh:!0}}},",
  "linuxCursor={id:`cursor`,platforms:{linux:{label:`Cursor`,icon:`apps/cursor.png`,kind:`editor`,detect:()=>linuxResolveEditorTarget([`cursor`],[`/usr/bin/cursor`,`/opt/Cursor/cursor`,`/opt/cursor/cursor`],[`cursor`]),args:ah,supportsSsh:!0}}},",
  "linuxWindsurf={id:`windsurf`,platforms:{linux:{label:`Windsurf`,icon:`apps/windsurf.png`,kind:`editor`,detect:()=>linuxResolveEditorTarget([`windsurf`],[`/usr/bin/windsurf`,`/opt/Windsurf/windsurf`,`/opt/windsurf/windsurf`],[`windsurf`]),args:ah,supportsSsh:!0}}},",
  "linuxZed={id:`zed`,platforms:{linux:{label:`Zed`,icon:`apps/zed.png`,kind:`editor`,detect:()=>linuxResolveEditorTarget([`zed`],[`/usr/bin/zed`,`/opt/zed/zed`,`/opt/Zed/zed`],[`zed`]),args:hg}}},",
  "linuxFileManager={id:`fileManager`,platforms:{linux:{label:`File Manager`,icon:`apps/file-explorer.png`,kind:`fileManager`,detect:linuxFileManagerDetect,args:e=>[e],open:async({path:e})=>linuxOpenFileManagerPath(e)}}};",
].join("");

const linuxTargets = [
  "linuxVscode",
  "linuxVscodeInsiders",
  "linuxCursor",
  "linuxWindsurf",
  "linuxZed",
  "linuxFileManager",
].join(",");

const replacement = `${linuxPatch}var ${registryName}=[${linuxTargets},${registryEntries}],${loggerName}=t.Pr(\`open-in-targets\`);`;
source = source.replace(registrySource, replacement);

for (const marker of ["linuxResolveEditorTarget", "linuxFileManager", "code-oss"]) {
  if (!source.includes(marker)) {
    fail(`patch verification failed; missing marker after patch: ${marker}`);
  }
}

writeFileSync(targetFile, source);
console.log(`patch-linux-open-targets: patched ${targetFile}`);
