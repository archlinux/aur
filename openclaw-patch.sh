#!/usr/bin/env bash
# openclaw-patch.sh - Robust, idempotent patching for OpenClaw Arch Linux package
# (Optimized Version for Bun + Hardening)

set -euo pipefail

# This script handles all necessary transformations for a clean,
# Bun-compatible build of OpenClaw.

# Use proper path detection
if [[ -f "package.json" ]]; then
    cd "."
elif [[ -d "openclaw" && -f "openclaw/package.json" ]]; then
    cd "openclaw"
elif [[ -d "src/openclaw" && -f "src/openclaw/package.json" ]]; then
    cd "src/openclaw"
else
    echo "Error: Could not find openclaw source tree from $(pwd)"
    exit 1
fi

echo "Applying optimized patches to OpenClaw in $(pwd) (Idempotent)..."

# 0. Nuclear Reset
# This is CRITICAL because previous build attempts may have pruned files 
# directly in the source tree (like tsconfig.json).
if [ -d ".git" ]; then
    echo "Restoring source tree to pristine state via git reset --hard..."
    # Force restoration of ALL tracked files.
    git reset --hard HEAD
    git clean -f # Remove any stray files that might interfere
fi

# 1. Update package.json for Bun, exact versions, and HOISTING
echo "Updating package.json and hoisting dependencies..."
node -e '
    const fs = require("fs");
    const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));
    
    // --- HOISTING ---
    const hoistMap = {
        "node-edge-tts": "1.2.10",
        "playwright-core": "1.59.1",
        "grammy": "1.42.0",
        "@whiskeysockets/baileys": "7.0.0-rc.9",
        "@homebridge/ciao": "1.3.7",
        "@grammyjs/runner": "2.0.3",
        "@grammyjs/transformer-throttler": "1.2.1",
        "jimp": "1.6.1",
        "hono": "4.12.14",
        "@hono/node-server": "1.19.14",
        "axios": "1.15.0",
        "follow-redirects": "1.16.0",
        "acpx": "0.6.1",
        "@agentclientprotocol/claude-agent-acp": "0.31.1",
        "@zed-industries/codex-acp": "0.12.0",
        "https-proxy-agent": "9.0.0",
        "undici": "8.1.0",
        "jsdom": "29.1.1",
        "zod": "4.4.1"
    };

    pkg.dependencies = pkg.dependencies || {};
    pkg.devDependencies = pkg.devDependencies || {};

    for (const [dep, ver] of Object.entries(hoistMap)) {
        pkg.dependencies[dep] = ver;
        if (pkg.devDependencies[dep]) {
            delete pkg.devDependencies[dep];
        }
    }

    // --- BUN RESOLUTIONS ---
    if (pkg.pnpm && pkg.pnpm.overrides) {
        pkg.resolutions = Object.assign({}, pkg.resolutions || {}, pkg.pnpm.overrides);
        pkg.overrides = Object.assign({}, pkg.overrides || {}, pkg.pnpm.overrides);
    }
    
    // Force exact versions (remove ^/~)
    for (const key in pkg.dependencies) {
        if (typeof pkg.dependencies[key] === "string") {
            pkg.dependencies[key] = pkg.dependencies[key].replace(/^[\^~]/, "");
        }
    }

    fs.writeFileSync("package.json", JSON.stringify(pkg, null, 2));
'

# Standard sed patches
sed -i '/"scripts": {/,/},/ s/pnpm/bun run/g' package.json
sed -i 's/"tough-cookie": "[^"]*"/"tough-cookie": "4.1.3"/' package.json
sed -i 's/"packageManager": "pnpm@[^"]*"/"packageManager": "bun@1.3.11"/' package.json
if ! grep -q '"node-gyp":' package.json; then
    sed -i '/"lit":/a \    "node-gyp": "^12.2.0",' package.json
fi
sed -i '/"@discordjs\/opus":/d' package.json

# 3. Patch build scripts to use Bun instead of pnpm
echo "Patching build scripts for Bun..."
if [ -f scripts/build-all.mjs ]; then
    sed -i "s/kind: \"pnpm\"/kind: \"bun\"/g" scripts/build-all.mjs
    sed -i "s/step.kind === \"pnpm\"/step.kind === \"bun\"/g" scripts/build-all.mjs
fi

if [ -f scripts/pnpm-runner.mjs ]; then
    sed -i "s/command: \"pnpm\"/command: \"bun\"/g" scripts/pnpm-runner.mjs
    sed -i "s/command: \"pnpm.cmd\"/command: \"bun\"/g" scripts/pnpm-runner.mjs
    sed -i "s/if (isNodeRunnablePnpmExecPath(npmExecPath))/if (false \&\& isNodeRunnablePnpmExecPath(npmExecPath))/g" scripts/pnpm-runner.mjs
fi

if [ -f scripts/bundle-a2ui.sh ]; then
    sed -i 's/pnpm -s exec tsc/bun run tsc/g' scripts/bundle-a2ui.sh
fi

# 5. Use Node.js for complex source patches
echo "Running complex source patches..."
node -e '
    const fs = require("fs");
    const path = require("path");

    // --- Patch scripts/ui.js ---
    if (fs.existsSync("scripts/ui.js")) {
        let ui = fs.readFileSync("scripts/ui.js", "utf8");
        if (!ui.includes("const bun = which(\"bun\");")) {
            ui = ui.replace(/function resolveRunner\(\) \{[\s\S]+?return null;\n\}/, 
                "function resolveRunner() {\n  const bun = which(\"bun\");\n  if (bun) return { cmd: bun, kind: \"bun\" };\n  const pnpm = which(\"pnpm\");\n  if (pnpm) return { cmd: pnpm, kind: \"pnpm\" };\n  return null;\n}");
            fs.writeFileSync("scripts/ui.js", ui);
        }
    }

    // --- Patch scripts/stage-bundled-plugin-runtime-deps.mjs ---
    if (fs.existsSync("scripts/stage-bundled-plugin-runtime-deps.mjs")) {
        let stage = fs.readFileSync("scripts/stage-bundled-plugin-runtime-deps.mjs", "utf8");
        stage = stage.replace(/throw createRootRuntimeStagingError/g, "console.warn");
        if (!stage.includes("fs.accessSync(\".\"")) {
            stage = stage.replace("function installPluginRuntimeDeps(params) {", 
                "function installPluginRuntimeDeps(params) {\n  try { fs.accessSync(\".\", fs.constants.W_OK); } catch { return; }");
            fs.writeFileSync("scripts/stage-bundled-plugin-runtime-deps.mjs", stage);
        }
    }

    // --- Patch src/plugins/bundled-runtime-deps-roots.ts ---
    if (fs.existsSync("src/plugins/bundled-runtime-deps-roots.ts")) {
        let roots = fs.readFileSync("src/plugins/bundled-runtime-deps-roots.ts", "utf8");
        if (!roots.includes("startsWith(\"/usr/lib/openclaw\")")) {
            roots = roots.replace("function isPackagedBundledPluginRoot(pluginRoot: string): boolean {", 
                "function isPackagedBundledPluginRoot(pluginRoot: string): boolean {\n  if (pluginRoot.startsWith(\"/usr/lib/openclaw\")) return false;");
            roots = roots.replace("export function isWritableDirectory(dir: string): boolean {", 
                "export function isWritableDirectory(dir: string): boolean {\n  if (dir.startsWith(\"/usr/lib/openclaw\")) return true;");
             fs.writeFileSync("src/plugins/bundled-runtime-deps-roots.ts", roots);
        }
    }

    // --- Patch src/plugins/discovery.ts ---
    const discoveryPath = "src/plugins/discovery.ts";
    if (fs.existsSync(discoveryPath)) {
        let content = fs.readFileSync(discoveryPath, "utf8");
        if (!content.includes("CONFIG_DIR")) {
            content = content.replace("import { resolveUserPath } from \"../utils.js\";", "import { resolveUserPath, CONFIG_DIR } from \"../utils.js\";");
            const anchor = "seen,\n        realpathCache,\n      });";
            const callCode = "\n      discoverNpmPlugins({ dir: CONFIG_DIR, origin: \"global\", ownershipUid: params.ownershipUid, candidates: result.candidates, diagnostics: result.diagnostics, seen, realpathCache });";
            content = content.replace(anchor, anchor + callCode);
            content += "\nfunction discoverNpmPlugins(params: { dir: string; origin: PluginOrigin; ownershipUid?: number | null; workspaceDir?: string; candidates: PluginCandidate[]; diagnostics: PluginDiagnostic[]; seen: Set<string>; realpathCache: Map<string, string>; }) {\n  const nodeModules = path.join(params.dir, \"node_modules\");\n  if (!fs.existsSync(nodeModules)) return;\n  try {\n    const entries = fs.readdirSync(nodeModules, { withFileTypes: true });\n    for (const entry of entries) {\n      if (!entry.isDirectory()) continue;\n      if (entry.name.startsWith(\"@\")) {\n        const scopeDir = path.join(nodeModules, entry.name);\n        const scopeEntries = fs.readdirSync(scopeDir, { withFileTypes: true });\n        for (const scopeEntry of scopeEntries) {\n          if (!scopeEntry.isDirectory()) continue;\n          discoverInDirectory({ dir: path.join(scopeDir, scopeEntry.name), origin: params.origin, ownershipUid: params.ownershipUid, workspaceDir: params.workspaceDir, candidates: params.candidates, diagnostics: params.diagnostics, seen: params.seen, realpathCache: params.realpathCache });\n        }\n      } else if (!entry.name.startsWith(\".\")) {\n        discoverInDirectory({ dir: path.join(nodeModules, entry.name), origin: params.origin, ownershipUid: params.ownershipUid, workspaceDir: params.workspaceDir, candidates: params.candidates, diagnostics: params.diagnostics, seen: params.seen, realpathCache: params.realpathCache });\n      }\n    }\n  } catch {}\n}";
            fs.writeFileSync(discoveryPath, content);
        }
    }
'

# 6. Rewrite pnpm-runner.mjs
echo "Rewriting pnpm-runner.mjs..."
cat > scripts/pnpm-runner.mjs <<EOF
import { spawn, spawnSync as spawnSyncInternal } from "node:child_process";
import path from "node:path";
function sysWhich(cmd) {
  try { const res = spawnSyncInternal("which", [cmd], { encoding: "utf8" }); return res.status === 0 ? res.stdout.trim() : null; } catch { return null; }
}
export function resolvePnpmRunner(params = {}) {
  const pnpmArgs = params.pnpmArgs ?? [];
  const filteredArgs = pnpmArgs.filter(a => a !== "-s" && a !== "--silent");
  const isExec = filteredArgs[0] === "exec";
  if (isExec && filteredArgs[1]) {
    const sysBin = sysWhich(filteredArgs[1]);
    if (sysBin) return { command: sysBin, args: filteredArgs.slice(2) };
    return { command: "bun", args: ["x", ...filteredArgs.slice(1)] };
  }
  return { command: "bun", args: ["run", ...filteredArgs] };
}
export function createPnpmRunnerSpawnSpec(params = {}) {
  const runner = resolvePnpmRunner(params);
  return { command: runner.command, args: runner.args, options: { cwd: params.cwd, detached: params.detached, stdio: params.stdio ?? "inherit", env: params.env ?? process.env, shell: false } };
}
export function spawnPnpmRunner(params = {}) {
  const spawnSpec = createPnpmRunnerSpawnSpec(params);
  return spawn(spawnSpec.command, spawnSpec.args, spawnSpec.options);
}
EOF

# 7. Fix extension specific errors
sed -i 's/typeof import("@discordjs\/opus")/any/g' extensions/discord/src/voice/sdk-runtime.ts 2>/dev/null || true
sed -i 's/abortWith(requestSignal)/abortWith(requestSignal as any)/g' extensions/telegram/src/bot.ts 2>/dev/null || true

echo "All optimized patches applied successfully."
