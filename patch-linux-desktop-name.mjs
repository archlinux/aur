#!/usr/bin/env node
// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD

import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const appDir = process.argv[2];

if (!appDir) {
  console.error("usage: patch-linux-desktop-name.mjs <extracted-app-dir>");
  process.exit(1);
}

const packagePath = join(appDir, "package.json");
const packageJson = JSON.parse(readFileSync(packagePath, "utf8"));

// Electron reads this value before the application entry point runs and uses
// it as the XDG application ID on Wayland. It must match the installed desktop
// filename so compositors can resolve the application icon.
packageJson.desktopName = "ChatGPT.desktop";

writeFileSync(packagePath, `${JSON.stringify(packageJson, null, 2)}\n`);
