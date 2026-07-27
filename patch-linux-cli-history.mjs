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

const TAG = "patch-linux-cli-history";
const appRoot = process.argv[2] ?? "app-extracted";
const webviewAssets = join(appRoot, "webview", "assets");

function fail(message) {
  console.error(`${TAG}: ${message}`);
  process.exit(1);
}

if (!existsSync(webviewAssets) || !statSync(webviewAssets).isDirectory()) {
  fail(`could not find webview assets directory: ${webviewAssets}`);
}

const jsFiles = readdirSync(webviewAssets, { withFileTypes: true })
  .filter((entry) => entry.isFile() && entry.name.endsWith(".js"))
  .map((entry) => join(webviewAssets, entry.name));

// Codex Desktop receives CLI threads from thread/list, but classifies threads
// outside its generated projectless workspace as project-scoped. On Linux the
// repackaged app has no project registration for CLI-created threads, so those
// threads are fetched and then omitted from the sidebar. Treat interactive CLI
// threads as projectless; subagent sources remain unaffected.
const unpatchedPattern = String.raw`getThreadWorkspaceKind\(([A-Za-z_$][\w$]*),([A-Za-z_$][\w$]*)\)\{let ([A-Za-z_$][\w$]*)=this\.getWorkspaceKindOverride\?\.\(\1\);if\(\3!=null\)return \3;if\(this\.conversationIds\.has\(\1\)\|\|this\.hostId===\x60local\x60&&([A-Za-z_$][\w$]*)\(\2\.cwd\)!=null\)return\x60projectless\x60;`;
const patchedPattern = String.raw`getThreadWorkspaceKind\(([A-Za-z_$][\w$]*),([A-Za-z_$][\w$]*)\)\{let ([A-Za-z_$][\w$]*)=this\.getWorkspaceKindOverride\?\.\(\1\);if\(\3!=null\)return \3;if\(this\.conversationIds\.has\(\1\)\|\|this\.hostId===\x60local\x60&&\(([A-Za-z_$][\w$]*)\(\2\.cwd\)!=null\|\|\2\.source===\x60cli\x60\)\)return\x60projectless\x60;`;

const unpatched = [];
const patched = [];

for (const file of jsFiles) {
  const source = readFileSync(file, "utf8");
  for (const match of source.matchAll(new RegExp(unpatchedPattern, "g"))) {
    unpatched.push({ file, match });
  }
  for (const match of source.matchAll(new RegExp(patchedPattern, "g"))) {
    patched.push({ file, match });
  }
}

if (unpatched.length === 0 && patched.length === 1) {
  console.log(`${TAG}: webview bundle already patched`);
  process.exit(0);
}

if (unpatched.length !== 1 || patched.length !== 0) {
  fail(
    `expected one workspace classifier (unpatched=${unpatched.length}, patched=${patched.length})`,
  );
}

const { file, match } = unpatched[0];
const thread = match[2];
const projectlessRootHelper = match[4];
const source = readFileSync(file, "utf8");
const replacement = match[0].replace(
  `${projectlessRootHelper}(${thread}.cwd)!=null`,
  `(${projectlessRootHelper}(${thread}.cwd)!=null||${thread}.source===\`cli\`)`,
);
const updated = source.replace(match[0], replacement);

if (updated === source) {
  fail(`replacement did not change ${file}`);
}

writeFileSync(file, updated);

const verificationMatches = [
  ...updated.matchAll(new RegExp(patchedPattern, "g")),
];
if (verificationMatches.length !== 1) {
  fail(`patch verification failed in ${file}`);
}

console.log(`${TAG}: patched ${file}`);
