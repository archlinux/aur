#!/usr/bin/env node

import { existsSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const appRoot = process.argv[2] ?? "app-extracted";
const mainPath = join(appRoot, "out", "main", "index.js");
const pythonRuntimePath = join(appRoot, "out", "main", "chunks", "python-runtime-DEvgRPNg.js");

function fail(message) {
  console.error(`patch-linux-runtime: ${message}`);
  process.exit(1);
}

function replaceExactlyOnce(source, marker, replacement, message) {
  const count = source.split(marker).length - 1;
  if (count !== 1) {
    fail(message);
  }
  return source.replace(marker, replacement);
}

if (!existsSync(mainPath)) {
  fail(`could not find main bundle: ${mainPath}`);
}

if (!existsSync(pythonRuntimePath)) {
  fail(`could not find runtime bundle: ${pythonRuntimePath}`);
}

let source = readFileSync(mainPath, "utf8");
let runtimeSource = readFileSync(pythonRuntimePath, "utf8");

const resourceExpression = "(process.env.HILO_DESKTOP_RESOURCES_PATH??process.resourcesPath)";

source = source.replaceAll("process.resourcesPath", resourceExpression);
runtimeSource = runtimeSource.replaceAll("process.resourcesPath", resourceExpression);

runtimeSource = replaceExactlyOnce(
  runtimeSource,
  '      ELECTRON_RUN_AS_NODE: "1",\n',
  "",
  "upstream bundle layout changed; could not remove Electron Node gateway flag",
);

runtimeSource = replaceExactlyOnce(
  runtimeSource,
  "    const spawnExecPath = resolveSpawnPath(process.execPath, this.logService);",
  '    const spawnExecPath = resolveSpawnPath(process.env.HILO_GATEWAY_NODE_PATH ?? "/usr/bin/node", this.logService);',
  "upstream bundle layout changed; could not patch gateway Node runtime",
);

source = replaceExactlyOnce(
  source,
  "  if (options.binaryPath) {\n    return options.binaryPath;\n  }\n  if (!options.isPackaged) {",
  '  if (options.binaryPath) {\n    return options.binaryPath;\n  }\n  if (process.env.HILO_OPENCODE_BINARY_PATH) {\n    return process.env.HILO_OPENCODE_BINARY_PATH;\n  }\n  if (!options.isPackaged) {',
  "upstream bundle layout changed; could not patch OpenCode runtime override",
);

source = replaceExactlyOnce(
  source,
  'const isDev = !app.isPackaged;',
  'try{Object.defineProperty(app,"isPackaged",{configurable:true,get:()=>true})}catch{}const isDev = false;',
  "upstream bundle layout changed; could not patch packaged state",
);

source = replaceExactlyOnce(
  source,
  '  if (isDev) {\n    log.info("Dev mode, skipping autoUpdater configuration");\n    reportPendingUpdaterFailure(options);\n    return;\n  }\n  configureAutoUpdater();',
  '  if (isDev || process.env.HILO_DISABLE_BUILTIN_UPDATER === "1") {\n    log.info("Built-in updater disabled");\n    reportPendingUpdaterFailure(options);\n    return;\n  }\n  configureAutoUpdater();',
  "upstream bundle layout changed; could not patch updater",
);

if (!source.includes("HILO_DESKTOP_RESOURCES_PATH") || !runtimeSource.includes("HILO_DESKTOP_RESOURCES_PATH")) {
  fail("patch verification failed; resource path override missing");
}

if (!source.includes('Object.defineProperty(app,"isPackaged"') || !source.includes("HILO_DISABLE_BUILTIN_UPDATER")) {
  fail("patch verification failed; packaged state or updater guard missing");
}

if (!source.includes("HILO_OPENCODE_BINARY_PATH")) {
  fail("patch verification failed; OpenCode runtime override missing");
}

if (
  !runtimeSource.includes('process.env.HILO_GATEWAY_NODE_PATH ?? "/usr/bin/node"') ||
  runtimeSource.includes('      ELECTRON_RUN_AS_NODE: "1",')
) {
  fail("patch verification failed; gateway Node runtime override missing");
}

writeFileSync(mainPath, source);
writeFileSync(pythonRuntimePath, runtimeSource);
console.log(`patch-linux-runtime: patched ${mainPath}`);
console.log(`patch-linux-runtime: patched ${pythonRuntimePath}`);
