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
  "id:`vscode`",
  "id:`vscodeInsiders`",
  "id:`cursor`",
  "id:`windsurf`",
  "id:`zed`",
  "id:`fileManager`",
];

for (const marker of requiredMarkers) {
  if (!source.includes(marker)) {
    fail(`upstream bundle layout changed; missing marker: ${marker}`);
  }
}

const codeArgsPattern =
  /(?:var |,)([A-Za-z_$][\w$]*)=\([A-Za-z_$][\w$]*,n,r,i,a\)=>r!=null&&(?:[A-Za-z_$][\w$]*\.)?[A-Za-z_$][\w$]*\(r\)&&\(i!=null\|\|a!=null\)\?[A-Za-z_$][\w$]*\(\{hostConfig:r,location:n,remotePath:a,remoteWorkspaceRoot:i\}\):[A-Za-z_$][\w$]*\([A-Za-z_$][\w$]*,n\)[,;]/;
const codeArgsMatch = source.match(codeArgsPattern);

if (!codeArgsMatch) {
  fail("could not find VS Code-compatible open-target args helper");
}

const codeArgsName = codeArgsMatch[1];

const openPathPattern =
  /async function ([A-Za-z_$][\w$]*)\(e\)\{let t=await [A-Za-z_$][\w$]*\.shell\.openPath\(e\);if\(t\)throw Error\(t\)\}/;
const openPathMatch = source.match(openPathPattern);

if (!openPathMatch) {
  fail("could not find Electron shell.openPath helper");
}

const openPathName = openPathMatch[1];

const registryPattern =
  /var ([A-Za-z_$][\w$]*)=\[((?:[A-Za-z_$][\w$]*,?)+)\],([A-Za-z_$][\w$]*)=([A-Za-z_$][\w$]*)\.([A-Za-z_$][\w$]*)\(`open-in-targets`\);/;
const registryMatch = source.match(registryPattern);

if (!registryMatch) {
  fail("could not find open-in-targets registry declaration");
}

const [
  registrySource,
  registryName,
  registryEntries,
  loggerName,
  loggerFactoryObjectName,
  loggerFactoryName,
] = registryMatch;
const expectedTargets = ["vscode", "vscodeInsiders", "cursor", "windsurf", "zed", "fileManager"];

for (const targetId of expectedTargets) {
  if (!source.includes(`id:\`${targetId}\``)) {
    fail(`upstream bundle layout changed; missing target id: ${targetId}`);
  }
}

function findRequireBinding(moduleName) {
  const escapedModuleName = moduleName.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const pattern = new RegExp(
    String.raw`(?:^|[;,])(?:let |const |var )?([A-Za-z_$][\w$]*)=require\(\`node:${escapedModuleName}\`\)`,
  );
  return source.match(pattern)?.[1] ?? null;
}

const fsName = findRequireBinding("fs");
const osName = findRequireBinding("os");
const pathName = findRequireBinding("path");

if (!fsName || !osName || !pathName) {
  fail("could not find required Node module bindings");
}

const linuxPatch = [
  `function linuxResolveAbsoluteCommand(e){if(!(0,${pathName}.isAbsolute)(e))return null;try{let t=(0,${fsName}.statSync)(e);return t.isFile()?e:null}catch{return null}}`,
  `function linuxPathSearch(e){if(!e)return null;if(e.includes(\`/\`))return linuxResolveAbsoluteCommand(e);for(let t of(process.env.PATH??\`\`).split(\`:\`)){if(!t)continue;let n=linuxResolveAbsoluteCommand((0,${pathName}.join)(t,e));if(n)return n}return null}`,
  `function linuxDesktopEntrySearchRoots(){let e=(0,${osName}.homedir)();return[(0,${pathName}.join)(e,\`.local\`,\`share\`,\`applications\`),\`/usr/share/applications\`]}`,
  `function linuxOpenTargetSearchRoots(){let e=(0,${osName}.homedir)();return[(0,${pathName}.join)(e,\`Applications\`),(0,${pathName}.join)(e,\`Downloads\`),\`/opt\`]}`,
  "function linuxSplitDesktopExec(e){return e.match(/\"([^\"\\\\]*(?:\\\\.[^\"\\\\]*)*)\"|'([^']*)'|\\S+/g)?.map(e=>e.replace(/^\"|\"$/g,``).replace(/^'|'$/g,``))??[]}",
  "function linuxResolveDesktopExec(e){let t=linuxSplitDesktopExec(e.replace(/%.?/g,``).trim());for(;t[0]===`env`;){t.shift();for(;t[0]?.includes(`=`)&&!t[0].startsWith(`/`);)t.shift()}let n=t[0];if(!n)return null;return linuxResolveAbsoluteCommand(n)??linuxPathSearch(n)}",
  `function linuxFindDesktopEntryExec(e){let t=e.map(e=>e.toLowerCase());for(let e of linuxDesktopEntrySearchRoots()){let n;try{n=(0,${fsName}.readdirSync)(e)}catch{continue}for(let r of n){let a=r.toLowerCase();if(!a.endsWith(\`.desktop\`)||!t.some(e=>a.includes(e)))continue;let s=(0,${pathName}.join)(e,r),c=null;try{c=(0,${fsName}.readFileSync)(s,\`utf8\`)}catch{continue}let l=c.match(/^Exec=(.+)$/m)?.[1]?.trim();if(!l)continue;let u=linuxResolveDesktopExec(l.replace(/%.?/g,\`\`).trim());if(u)return u}}return null}`,
  `function linuxFindAppImage(e){let t=e.map(e=>e.toLowerCase());for(let e of linuxOpenTargetSearchRoots()){let n;try{n=(0,${fsName}.readdirSync)(e,{withFileTypes:!0})}catch{continue}for(let r of n){if(!r.isFile())continue;let n=r.name.toLowerCase();if(!n.endsWith(\`.appimage\`)||!t.some(e=>n.includes(e)))continue;let a=linuxResolveAbsoluteCommand((0,${pathName}.join)(e,r.name));if(a)return a}}return null}`,
  "function linuxResolveEditorTarget(e,t=[],n=[]){for(let t of e){let e=linuxPathSearch(t);if(e)return e}for(let e of t){let t=linuxResolveAbsoluteCommand(e);if(t)return t}let r=n.length>0?linuxFindDesktopEntryExec(n):null;return r??(n.length>0?linuxFindAppImage(n):null)}",
  "function linuxFileManagerDetect(){return linuxPathSearch(`xdg-open`)??linuxResolveAbsoluteCommand(`/usr/bin/xdg-open`)}",
  `function linuxOpenFileManagerPath(e){let t=e;for(;;){if((0,${fsName}.existsSync)(t))break;let e=(0,${pathName}.dirname)(t);if(e===t){t=null;break}t=e}let n=t??e;if((0,${fsName}.existsSync)(n)&&(0,${fsName}.statSync)(n).isFile())n=(0,${pathName}.dirname)(n);return ${openPathName}(n)}`,
  "function linuxZedArgs(e,t){return t?[`${e}:${t.line}:${t.column}`]:[e]}",
  `var linuxVscode={id:\`vscode\`,platforms:{linux:{label:\`VS Code\`,icon:\`apps/vscode.png\`,kind:\`editor\`,detect:()=>linuxResolveEditorTarget([\`code\`,\`code-oss\`],[\`/usr/bin/code\`,\`/usr/bin/code-oss\`,\`/snap/bin/code\`],[\`visual studio code\`,\`code\`,\`code-oss\`]),args:${codeArgsName},supportsSsh:!0}}},`,
  `linuxVscodeInsiders={id:\`vscodeInsiders\`,platforms:{linux:{label:\`VS Code Insiders\`,icon:\`apps/vscode-insiders.png\`,kind:\`editor\`,detect:()=>linuxResolveEditorTarget([\`code-insiders\`],[\`/usr/bin/code-insiders\`,\`/snap/bin/code-insiders\`],[\`insiders\`,\`code-insiders\`]),args:${codeArgsName},supportsSsh:!0}}},`,
  `linuxCursor={id:\`cursor\`,platforms:{linux:{label:\`Cursor\`,icon:\`apps/cursor.png\`,kind:\`editor\`,detect:()=>linuxResolveEditorTarget([\`cursor\`],[\`/usr/bin/cursor\`,\`/opt/Cursor/cursor\`,\`/opt/cursor/cursor\`],[\`cursor\`]),args:${codeArgsName},supportsSsh:!0}}},`,
  `linuxWindsurf={id:\`windsurf\`,platforms:{linux:{label:\`Windsurf\`,icon:\`apps/windsurf.png\`,kind:\`editor\`,detect:()=>linuxResolveEditorTarget([\`windsurf\`],[\`/usr/bin/windsurf\`,\`/opt/Windsurf/windsurf\`,\`/opt/windsurf/windsurf\`],[\`windsurf\`]),args:${codeArgsName},supportsSsh:!0}}},`,
  "linuxZed={id:`zed`,platforms:{linux:{label:`Zed`,icon:`apps/zed.png`,kind:`editor`,detect:()=>linuxResolveEditorTarget([`zed`],[`/usr/bin/zed`,`/opt/zed/zed`,`/opt/Zed/zed`],[`zed`]),args:linuxZedArgs}}},",
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

const replacement = `${linuxPatch}var ${registryName}=[${linuxTargets},${registryEntries}],${loggerName}=${loggerFactoryObjectName}.${loggerFactoryName}(\`open-in-targets\`);`;
source = source.replace(registrySource, replacement);

for (const marker of ["linuxResolveEditorTarget", "linuxFileManager", "code-oss"]) {
  if (!source.includes(marker)) {
    fail(`patch verification failed; missing marker after patch: ${marker}`);
  }
}

writeFileSync(targetFile, source);
console.log(`patch-linux-open-targets: patched ${targetFile}`);
