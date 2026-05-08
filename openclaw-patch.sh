#!/usr/bin/env bash
# openclaw-patch.sh - Robust, idempotent patching for OpenClaw Arch Linux package
# (Optimized Version for Bun + Hardening)

set -euo pipefail

# This script handles all necessary transformations for a clean,
# reproducible build using Bun on Arch Linux.

PATCH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$PATCH_DIR/openclaw"

echo "Applying optimized patches to OpenClaw in $REPO_ROOT (Idempotent)..."

cd "$REPO_ROOT"

# 1. Restore to pristine state (Idempotent)
echo "Restoring source tree to pristine state via git reset --hard..."
git reset --hard

# 2. Patch package.json (Hoisting and pinning)
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
        "axios": "1.16.0",
        "follow-redirects": "1.16.0",
        "acpx": "0.6.1",
        "@agentclientprotocol/claude-agent-acp": "0.31.1",
        "@zed-industries/codex-acp": "0.12.0",
        "https-proxy-agent": "9.0.0",
        "undici": "8.1.0",
        "jsdom": "29.1.1",
        "zod": "4.4.1",
        "unrun": "0.2.37",
        "tsdown": "0.21.10"
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

    // --- TRUSTED DEPENDENCIES ---
    const trusted = [
        "tsdown",
        "unrun",
        "@openclaw/fs-safe",
        "@discordjs/opus",
        "@google/genai",
        "@lydell/node-pty",
        "@matrix-org/matrix-sdk-crypto-nodejs",
        "@tloncorp/api",
        "@tloncorp/tlon-skill",
        "@whiskeysockets/baileys",
        "@whiskeysockets/libsignal-node",
        "authenticate-pam",
        "esbuild",
        "node-llama-cpp",
        "protobufjs",
        "sharp"
    ];
    pkg.trustedDependencies = trusted; // Bun uses trustedDependencies or onlyBuiltDependencies
    if (pkg.pnpm) {
        pkg.pnpm.onlyBuiltDependencies = trusted;
    }

    fs.writeFileSync("package.json", JSON.stringify(pkg, null, 4));
'

# 3. Patch build scripts
echo "Patching build scripts for Bun..."
sed -i 's/pnpm/bun/g' package.json
sed -i 's/pnpm exec/bun x/g' scripts/*.mjs 2>/dev/null || true
sed -i 's/pnpm exec/bun x/g' scripts/*.sh 2>/dev/null || true

# 4. Run bun install
bun install

# 5. Complex source patches
echo "Running complex source patches..."
node -e '
    const fs = require("fs");
    const path = require("path");

    // Fix plugin discovery for Bun global paths
    const discoveryPath = "src/plugins/discovery.ts";
    if (fs.existsSync(discoveryPath)) {
        let content = fs.readFileSync(discoveryPath, "utf8");
        if (!content.includes("discoverNpmPlugins")) {
            // Add import
            content = content.replace("import { resolveUserPath } from \"../utils.js\";", "import { CONFIG_DIR, resolveUserPath } from \"../utils.js\";");
            
            const anchor = "seen,\n        realpathCache,\n      });";
            const callCode = "\n      discoverNpmPlugins({ dir: CONFIG_DIR, origin: \"global\", env: params.env ?? process.env, ownershipUid: params.ownershipUid, candidates: result.candidates, diagnostics: result.diagnostics, seen, realpathCache });";
            content = content.replace(anchor, anchor + callCode);
            content += "\nfunction discoverNpmPlugins(params: { dir: string; origin: PluginOrigin; env: NodeJS.ProcessEnv; ownershipUid?: number | null; workspaceDir?: string; candidates: PluginCandidate[]; diagnostics: PluginDiagnostic[]; seen: Set<string>; realpathCache: Map<string, string>; }) {\n  const nodeModules = path.join(params.dir, \"node_modules\");\n  if (!fs.existsSync(nodeModules)) return;\n  try {\n    const entries = fs.readdirSync(nodeModules, { withFileTypes: true });\n    for (const entry of entries) {\n      if (!entry.isDirectory()) continue;\n      if (entry.name.startsWith(\"@\")) {\n        const scopeDir = path.join(nodeModules, entry.name);\n        const scopeEntries = fs.readdirSync(scopeDir, { withFileTypes: true });\n        for (const scopeEntry of scopeEntries) {\n          if (!scopeEntry.isDirectory()) continue;\n          discoverInDirectory({ dir: path.join(scopeDir, scopeEntry.name), origin: params.origin, env: params.env, ownershipUid: params.ownershipUid, workspaceDir: params.workspaceDir, candidates: params.candidates, diagnostics: params.diagnostics, seen: params.seen, realpathCache: params.realpathCache });\n        }\n      } else if (!entry.name.startsWith(\".\")) {\n        discoverInDirectory({ dir: path.join(nodeModules, entry.name), origin: params.origin, env: params.env, ownershipUid: params.ownershipUid, workspaceDir: params.workspaceDir, candidates: params.candidates, diagnostics: params.diagnostics, seen: params.seen, realpathCache: params.realpathCache });\n      }\n    }\n  } catch {}\n}";
            fs.writeFileSync(discoveryPath, content);
        }
    }
'

# 6. Rewrite pnpm-runner.mjs
echo "Rewriting pnpm-runner.mjs..."
cat > scripts/pnpm-runner.mjs <<EOF
import { spawn, spawnSync as spawnSyncInternal } from "node:child_process";
import fs from "node:fs";
import path from "node:path";
function sysWhich(cmd) {
  try { const res = spawnSyncInternal("which", [cmd], { encoding: "utf8" }); return res.status === 0 ? res.stdout.trim() : null; } catch { return null; }
}
export function resolvePnpmRunner(params = {}) {
  const pnpmArgs = params.pnpmArgs ?? [];
  const filteredArgs = pnpmArgs.filter(a => a !== "-s" && a !== "--silent");
  const isExec = filteredArgs[0] === "exec";
  if (isExec && filteredArgs[1]) {
    const localBin = path.join(process.cwd(), "node_modules", ".bin", filteredArgs[1]);
    if (fs.existsSync(localBin)) return { command: localBin, args: filteredArgs.slice(2) };
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

# Fix duplicate import in googlechat (causes PARSE_ERROR in rolldown)
sed -i '/resolveGoogleChatAccount,/{n; /listGoogleChatAccountIds,/d}' extensions/googlechat/src/channel.ts 2>/dev/null || true

echo "All optimized patches applied successfully."
