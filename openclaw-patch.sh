#!/usr/bin/env bash

set -e

PATCH_FILE="openclaw-adjustment.patch"

if [[ "$1" == "--refresh-patch" ]]; then
    echo "Refreshing pristine sources..."
    updpkgsums
    makepkg -Co --noprepare

    cd src/openclaw

    # 1. package.json
    echo "Patching package.json..."
    cp package.json package.json.orig
    sed -i '/"scripts": {/,/},/ s/pnpm/bun run/g' package.json
    # Replace npm package manager definition
    sed -i 's/"packageManager": "pnpm@[^"]*"/"packageManager": "bun@1.2.0"/' package.json
    # Insert node-gyp if missing
    if ! grep -q '"node-gyp":' package.json; then
        sed -i '/"lit":/a \    "node-gyp": "^12.2.0",' package.json
    fi
    # Remove @discordjs/opus to prevent gyp build failures natively on Node 25
    sed -i '/"@discordjs\/opus":/d' package.json

    # 2. scripts/bundle-a2ui.sh
    echo "Patching scripts/bundle-a2ui.sh..."
    cp scripts/bundle-a2ui.sh scripts/bundle-a2ui.sh.orig
    sed -i 's/pnpm -s exec tsc/bun run tsc/' scripts/bundle-a2ui.sh

    # 3. scripts/ui.js
    echo "Patching scripts/ui.js..."
    cp scripts/ui.js scripts/ui.js.orig
    # Insert bun detection
    sed -i '/const pnpm = which("pnpm");/i \  const bun = which("bun");\n  if (bun) {\n    return { cmd: bun, kind: "bun" };\n  }' scripts/ui.js
    sed -i 's/install pnpm, then retry/install bun or pnpm, then retry/' scripts/ui.js

    # 4. src/discord/voice/manager.ts
    echo "Patching src/discord/voice/manager.ts..."
    cp src/discord/voice/manager.ts src/discord/voice/manager.ts.orig
    sed -i 's/typeof import("@discordjs\/opus")/any/g' src/discord/voice/manager.ts

    # 5. src/agents/skills-install.ts
    echo "Patching src/agents/skills-install.ts..."
    cp src/agents/skills-install.ts src/agents/skills-install.ts.orig
    sed -i 's/import { resolveUserPath } from "..\/utils.js";/import { resolveUserPath, CONFIG_DIR } from "..\/utils.js";/' src/agents/skills-install.ts
    sed -i 's/env?: NodeJS.ProcessEnv;/env?: NodeJS.ProcessEnv;\n  cwd?: string;/' src/agents/skills-install.ts
    sed -i 's/env: params.env,/env: params.env,\n    cwd: params.cwd,/' src/agents/skills-install.ts
    
    sed -i '/const uvInstallFailure = await ensureUvInstalled({ spec, brewExe, timeoutMs });/i \
  // Force installation into user config directory if package.json exists there or forced by env\
  const configPkgJson = path.join(CONFIG_DIR, "package.json");\
  const forceLocal = process.env.OPENCLAW_FORCE_LOCAL_SKILLS === "1";\
' src/agents/skills-install.ts

    sed -i '/if (spec.kind === "brew" && brewExe && argv?\.\[0\] === "brew") {/i \
  if (spec.kind === "node" && argv && (forceLocal || fs.existsSync(configPkgJson))) {\
    // Remove global flags\
    for (let i = 0; i < argv.length; i++) {\
      if (argv[i] === "-g" || argv[i] === "global") {\
        argv.splice(i, 1);\
        i--;\
      }\
    }\
  }\
' src/agents/skills-install.ts

    # executeInstallCommand arguments - replace carefully by matching the exact line
    sed -i 's/return withWarnings(await executeInstallCommand({ argv, timeoutMs, env }), warnings);/\
  \/\/ Use CONFIG_DIR as cwd if we are installing locally (stripped globals)\
  const cwd = (spec.kind === "node" \&\& (forceLocal || fs.existsSync(configPkgJson)))\
    ? CONFIG_DIR\
    : undefined;\
\
  return withWarnings(await executeInstallCommand({ argv, timeoutMs, env, cwd }), warnings);/' src/agents/skills-install.ts

    # 5. src/plugins/discovery.ts
    echo "Patching src/plugins/discovery.ts..."
    cp src/plugins/discovery.ts src/plugins/discovery.ts.orig
    
    cat << 'EOF' >> src/plugins/discovery.ts

function discoverNpmPlugins(params: {
  dir: string;
  origin: PluginOrigin;
  workspaceDir?: string;
  candidates: PluginCandidate[];
  diagnostics: PluginDiagnostic[];
  seen: Set<string>;
}) {
  const nodeModules = path.join(params.dir, "node_modules");
  if (!fs.existsSync(nodeModules)) {
    return;
  }

  let entries: fs.Dirent[] = [];
  try {
    entries = fs.readdirSync(nodeModules, { withFileTypes: true });
  } catch {
    return;
  }

  for (const entry of entries) {
    if (!entry.isDirectory()) continue;

    // Handle scoped packages
    if (entry.name.startsWith("@")) {
      const scopeDir = path.join(nodeModules, entry.name);
      let scopeEntries: fs.Dirent[] = [];
      try {
        scopeEntries = fs.readdirSync(scopeDir, { withFileTypes: true });
      } catch {
        continue;
      }
      for (const scopeEntry of scopeEntries) {
        if (!scopeEntry.isDirectory()) continue;
        const fullPath = path.join(scopeDir, scopeEntry.name);
        const manifest = readPackageManifest(fullPath);
        if (!manifest || !getPackageManifestMetadata(manifest)) continue;

        // Use generic discovery but only because we confirmed manifest metadata exists
        discoverInDirectory({
          dir: fullPath,
          origin: params.origin,
          workspaceDir: params.workspaceDir,
          candidates: params.candidates,
          diagnostics: params.diagnostics,
          seen: params.seen,
        });
      }
      continue;
    }

    if (entry.name.startsWith(".")) continue;

    const fullPath = path.join(nodeModules, entry.name);
    const manifest = readPackageManifest(fullPath);
    if (!manifest || !getPackageManifestMetadata(manifest)) continue;

    discoverInDirectory({
      dir: fullPath,
      origin: params.origin,
      workspaceDir: params.workspaceDir,
      candidates: params.candidates,
      diagnostics: params.diagnostics,
      seen: params.seen,
    });
  }
}
EOF

    sed -i '/const bundledDir = resolveBundledPluginsDir();/i \
  // Discover NPM package plugins in config dir (e.g. ~/.openclaw/node_modules)\
  discoverNpmPlugins({\
    dir: resolveConfigDir(),\
    origin: "global",\
    candidates,\
    diagnostics,\
    seen,\
  });\
' src/plugins/discovery.ts

    # 6. src/plugins/install.ts
    echo "Patching src/plugins/install.ts..."
    cp src/plugins/install.ts src/plugins/install.ts.orig
    sed -i 's/import \* as skillScanner from "..\/security\/skill-scanner.js";/import * as skillScanner from "..\/security\/skill-scanner.js";\nimport { runCommandWithTimeout } from "..\/process\/exec.js";/' src/plugins/install.ts
    
    sed -i '/export async function installPluginFromArchive/,/}): Promise<InstallPluginResult> {/ {
        /}): Promise<InstallPluginResult> {/ a \
  // Force installation into user config directory if package.json exists there\
  const configPkgJson = path.join(CONFIG_DIR, "package.json");\
  if (await fileExists(configPkgJson)) {\
    const logger = params.logger ?? defaultLogger;\
    logger.info?.(`Installing ${params.archivePath} to ${CONFIG_DIR} using system package manager...`);\
\
    const hasPnpmLock = await fileExists(path.join(CONFIG_DIR, "pnpm-lock.yaml"));\
    const hasBunLock = await fileExists(path.join(CONFIG_DIR, "bun.lockb"));\
    const pm = hasBunLock ? "bun" : (hasPnpmLock ? "pnpm" : "npm");\
\
    await fs.mkdir(path.join(CONFIG_DIR, "node_modules"), { recursive: true });\
\
    const res = await runCommandWithTimeout([pm, "install", params.archivePath], {\
      cwd: CONFIG_DIR,\
      timeoutMs: params.timeoutMs ?? 300_000,\
    });\
\
    if (res.code !== 0) {\
      return { ok: false, error: `${pm} install failed: ${res.stderr || res.stdout}` };\
    }\
\
    return {\
      ok: true,\
      pluginId: params.archivePath,\
      targetDir: path.join(CONFIG_DIR, "node_modules", params.archivePath),\
      extensions: [],\
    };\
  }
    }' src/plugins/install.ts

    echo "Generating new $PATCH_FILE..."
    {
        diff -u package.json.orig package.json || true
        diff -u scripts/bundle-a2ui.sh.orig scripts/bundle-a2ui.sh || true
        diff -u scripts/ui.js.orig scripts/ui.js || true
        diff -u src/discord/voice/manager.ts.orig src/discord/voice/manager.ts || true
        diff -u src/agents/skills-install.ts.orig src/agents/skills-install.ts || true
        diff -u src/plugins/discovery.ts.orig src/plugins/discovery.ts || true
        diff -u src/plugins/install.ts.orig src/plugins/install.ts || true
    } > ../../$PATCH_FILE

    cd ../..
    echo "Updating PKGBUILD checkums..."
    updpkgsums
    echo "Done! You can now optionally build the package or review the patch."
else
    echo "This script is used with --refresh-patch."
fi
