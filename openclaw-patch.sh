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

# Create bunfig.toml to force Bun to always use hoisted linker
# and restrict to glibc linux-x64 only. This prevents musl-specific
# native packages (e.g. @anthropic-ai/*-linux-x64-musl, @github/*-linuxmusl-x64,
# sharp-linuxmusl-x64, lightningcss-linux-x64-musl, etc.) from ever being downloaded.
echo "Creating bunfig.toml..."
cat > bunfig.toml <<EOF
[install]
linker = "hoisted"

# Only glibc x64 Linux — prevents all the musl variants that cause
# "missing libc.musl-x86_64.so.1" errors in namcap/makepkg on Arch.
supportedArchitectures = { os = ["linux"], cpu = ["x64"], libc = ["glibc"] }
EOF

# 2. Patch package.json (Hoisting and pinning)
echo "Updating package.json and hoisting dependencies..."
node -e '
    const fs = require("fs");
    const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));

    // --- HOISTING ---
    // Runtime pins (keep these explicit — they fix Arch/Bun install issues).
    const hoistMap = {
        "node-edge-tts": "1.2.10",
        "playwright-core": "1.60.0",
        "grammy": "1.43.0",
        "@whiskeysockets/baileys": "7.0.0-rc11",
        "@homebridge/ciao": "1.3.8",
        "@grammyjs/runner": "2.0.3",
        "@grammyjs/transformer-throttler": "1.2.1",
        "jimp": "1.6.1",
        "hono": "4.12.21",
        "@hono/node-server": "1.19.14",
        "axios": "1.16.1",
        "follow-redirects": "1.16.0",
        "acpx": "0.8.0",
        "@agentclientprotocol/claude-agent-acp": "0.36.1",
        "@zed-industries/codex-acp": "0.14.0",
        "https-proxy-agent": "9.0.0",
        "undici": "8.3.0",
        "jsdom": "29.1.1",
        "zod": "4.4.1",
        "@openclaw/proxyline": "0.3.3"
    };

    pkg.dependencies = pkg.dependencies || {};
    pkg.devDependencies = pkg.devDependencies || {};

    for (const [dep, ver] of Object.entries(hoistMap)) {
        // Prefer the version already declared upstream. Pinning older
        // fallbacks over current package.json (e.g. grammy/zod/proxyline)
        // causes tsdown type/API mismatches on current main.
        const existing = pkg.dependencies[dep] || pkg.devDependencies[dep];
        pkg.dependencies[dep] = existing || ver;
        if (pkg.devDependencies[dep]) {
            delete pkg.devDependencies[dep];
        }
    }

    // Build tools must track upstream. Pinning old tsdown/unrun breaks the
    // tsdown-build step (config API + --config-loader unrun peer). Hoist the
    // versions already declared in package.json into dependencies so bun
    // install still gets them under NODE_ENV=production / --production.
    const hoistUpstreamAsDeps = ["tsdown", "unrun", "tsx", "rolldown", "esbuild"];
    for (const dep of hoistUpstreamAsDeps) {
        const ver = pkg.devDependencies[dep] || pkg.dependencies[dep];
        if (ver) {
            pkg.dependencies[dep] = ver;
            delete pkg.devDependencies[dep];
        }
    }
    // Fallbacks if upstream ever drops the declaration from package.json.
    if (!pkg.dependencies.tsdown) pkg.dependencies.tsdown = "0.22.1";
    if (!pkg.dependencies.unrun) pkg.dependencies.unrun = "0.3.1";

    // --- BUN RESOLUTIONS ---
    if (pkg.pnpm && pkg.pnpm.overrides) {
        pkg.resolutions = Object.assign({}, pkg.resolutions || {}, pkg.pnpm.overrides);
        pkg.overrides = Object.assign({}, pkg.overrides || {}, pkg.pnpm.overrides);
    }

    // --- TRUSTED DEPENDENCIES ---
    // Bun only runs lifecycle scripts for packages listed here. rolldown and
    // esbuild ship native bindings that need postinstall; without them the
    // tsdown-build step can appear to "run" and produce no usable dist.
    const trusted = [
        "tsdown",
        "unrun",
        "rolldown",
        "esbuild",
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
        "node-llama-cpp",
        "protobufjs",
        "sharp"
    ];
    pkg.trustedDependencies = trusted; // Bun uses trustedDependencies or onlyBuiltDependencies
    if (pkg.pnpm) {
        pkg.pnpm.onlyBuiltDependencies = trusted;
    }

    // Ensure runtime workspace templates are included in published package files.
    // HEARTBEAT.md (the only template under src/) is required by the runtime
    // resolver in src/agents/workspace-templates.ts and workspace.ts.
    pkg.files = pkg.files || [];
    if (!pkg.files.includes("src/agents/templates/**")) {
        pkg.files.push("src/agents/templates/**");
    }

    fs.writeFileSync("package.json", JSON.stringify(pkg, null, 4));
'

# Do not rewrite the substring "pnpm" in package.json or scripts/. Current
# upstream names the runner scripts/pnpm-runner.mts and lists pnpm-workspace.yaml
# in package.json "files". A blanket substitution turns those into missing
# modules (bun-runner.mts) and breaks the tsdown build. build() sets
# OPENCLAW_BUILD_ALL_NO_PNPM=1, and scripts/build-all.mts already runs those
# steps with node instead of pnpm.

# Patch package.json workspaces for Bun (excluding root '.' to prevent issues)
echo "Configuring workspaces in package.json for Bun..."
node -e '
    const fs = require("fs");
    const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));
    pkg.workspaces = ["ui", "packages/*", "extensions/*"];
    fs.writeFileSync("package.json", JSON.stringify(pkg, null, 4));
'

# Replace workspace:* / file:* references to the root "openclaw" package with a
# depth-correct file: path. Required because we rewrite workspaces to exclude
# the root itself, and Bun refuses workspace: references to a non-member.
#
# Path depth matters:
#   ui/package.json              -> file:..      (one level below root)
#   packages/*/package.json      -> file:../..   (two levels)
#   extensions/*/package.json    -> file:../..   (two levels)
# A blanket file:../.. breaks ui (and any depth-1 package): Bun reports
#   Could not find package.json for "file:.." dependency "openclaw"
#   openclaw@file:../.. failed to resolve
echo "Rewriting openclaw workspace/file references to depth-correct file: paths..."
node -e '
    const fs = require("fs");
    const path = require("path");
    const root = process.cwd();

    function walk(dir, out = []) {
        for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
            if (ent.name === "node_modules" || ent.name === ".git") continue;
            const full = path.join(dir, ent.name);
            if (ent.isDirectory()) walk(full, out);
            else if (ent.name === "package.json") out.push(full);
        }
        return out;
    }

    const sections = ["dependencies", "devDependencies", "optionalDependencies", "peerDependencies"];
    let fixed = 0;
    for (const pkgPath of walk(root)) {
        if (path.resolve(pkgPath) === path.resolve(root, "package.json")) continue;
        let pkg;
        try { pkg = JSON.parse(fs.readFileSync(pkgPath, "utf8")); }
        catch { continue; }

        const relDir = path.relative(root, path.dirname(pkgPath));
        const depth = relDir ? relDir.split(path.sep).filter(Boolean).length : 0;
        if (depth < 1) continue;
        const fileRef = "file:" + Array(depth).fill("..").join("/");

        let changed = false;
        for (const section of sections) {
            const bag = pkg[section];
            if (!bag || typeof bag !== "object") continue;
            const ver = bag.openclaw;
            if (typeof ver !== "string") continue;
            // Only rewrite local/workspace refs (not semver ranges like ">=2026.7.2"
            // that live in peerDependenciesMeta-adjacent peerDependencies).
            if (ver.startsWith("workspace:") || ver.startsWith("file:") || ver.startsWith("link:")) {
                if (bag.openclaw !== fileRef) {
                    bag.openclaw = fileRef;
                    changed = true;
                }
            }
        }
        if (changed) {
            fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + "\n");
            fixed++;
            console.log("  " + relDir + " -> openclaw: " + fileRef);
        }
    }
    console.log("Rewrote openclaw file: refs in " + fixed + " package.json file(s).");
'

# Remove lockfiles to force Bun to resolve workspaces from scratch and avoid conflicts
echo "Removing pre-existing lockfiles to force workspace resolution..."
rm -f bun.lock bun.lockb pnpm-lock.yaml npm-shrinkwrap.json

# 4. Run bun install with hoisted linker to correctly flatten workspace dependencies.
# --minimum-release-age=0: upstream's 7-day cooldown (pnpm-workspace.yaml /
# .npmrc min-release-age) rejects packages this git snapshot intentionally
# depends on, including @openclaw/fs-safe. Arch -git builds track that tree.
bun install --linker hoisted --minimum-release-age=0

# Fail fast if the tsdown toolchain did not land. A broken .bin symlink with a
# missing package root is exactly what makes the tsdown-build step produce no dist.
if [[ ! -f node_modules/tsdown/dist/run.mjs ]]; then
    echo "error: bun install did not provide node_modules/tsdown/dist/run.mjs" >&2
    echo "error: package.json tsdown dep: $(node -pe 'require("./package.json").dependencies?.tsdown || require("./package.json").devDependencies?.tsdown || "MISSING"' 2>/dev/null || echo unknown)" >&2
    ls -la node_modules/.bin/tsdown node_modules/tsdown 2>&1 || true
    exit 1
fi
if [[ ! -d node_modules/unrun ]]; then
    echo "error: bun install did not provide node_modules/unrun (required by tsdown --config-loader unrun)" >&2
    exit 1
fi
echo "Verified tsdown toolchain: $(node -pe 'require("./node_modules/tsdown/package.json").version') + unrun $(node -pe 'require("./node_modules/unrun/package.json").version')"

# 5. Complex source patches
echo "Running complex source patches..."
node -e '
    const fs = require("fs");
    const path = require("path");

    // Scan plugins installed with bun into ~/.openclaw/node_modules.
    // Upstream discovers extensions/ and install records, not that node_modules
    // tree. utils.js no longer exports CONFIG_DIR; importing it fails tsdown.
    const discoveryPath = "src/plugins/discovery.ts";
    if (fs.existsSync(discoveryPath)) {
        let content = fs.readFileSync(discoveryPath, "utf8");
        const importLine = "import { resolveUserPath } from \"../utils.js\";";
        const anchor = [
            "        discoverInDirectory({",
            "          dir: roots.global,",
            "          origin: \"global\",",
            "          managedPluginDirs,",
            "          skipRootDirKeys: installedPluginDirKeys,",
            "        });",
        ].join("\n");
        if (content.includes("discoverNpmPluginsInConfigDir")) {
            console.log("plugin discovery patch already present");
        } else if (!content.includes(importLine) || !content.includes(anchor)) {
            console.log("discovery.ts layout changed; skipping ~/.openclaw/node_modules plugin scan patch");
        } else {
            content = content.replace(
                importLine,
                "import { resolveConfigDir } from \"../infra/config-dir.js\";\n" + importLine,
            );
            content = content.replace(
                anchor,
                anchor + "\n        discoverNpmPluginsInConfigDir(discoverInDirectory, env);",
            );
            content += `

function discoverNpmPluginsInConfigDir(
  discoverInDirectory: (params: { dir: string; origin: PluginOrigin }) => void,
  env: NodeJS.ProcessEnv,
) {
  const nodeModules = path.join(resolveConfigDir(env), "node_modules");
  if (!fs.existsSync(nodeModules)) return;
  let entries: fs.Dirent[];
  try {
    entries = fs.readdirSync(nodeModules, { withFileTypes: true });
  } catch {
    return;
  }
  for (const entry of entries) {
    if (!entry.isDirectory() || entry.name.startsWith(".")) continue;
    if (entry.name.startsWith("@")) {
      const scopeDir = path.join(nodeModules, entry.name);
      let scopeEntries: fs.Dirent[];
      try {
        scopeEntries = fs.readdirSync(scopeDir, { withFileTypes: true });
      } catch {
        continue;
      }
      for (const scopeEntry of scopeEntries) {
        if (!scopeEntry.isDirectory() || scopeEntry.name.startsWith(".")) continue;
        discoverInDirectory({
          dir: path.join(scopeDir, scopeEntry.name),
          origin: "global",
        });
      }
      continue;
    }
    discoverInDirectory({
      dir: path.join(nodeModules, entry.name),
      origin: "global",
    });
  }
}
`;
            fs.writeFileSync(discoveryPath, content);
            console.log("Patched plugin discovery to scan ~/.openclaw/node_modules");
        }
    }

    // Make HEARTBEAT template loading resilient: always use search dirs (src + docs fallback).
    // This ensures that even if packaging omitted src/agents/templates (pre-fix builds),
    // the docs/reference/templates copy can still be used as fallback.
    // The clean src version is still preferred when present.
    const workspaceTs = "src/agents/workspace.ts";
    if (fs.existsSync(workspaceTs)) {
        let content = fs.readFileSync(workspaceTs, "utf8");
        const before = "    const templateDirs =\n      name === DEFAULT_HEARTBEAT_FILENAME\n        ? [await resolveWorkspaceTemplateDir()]\n        : await resolveWorkspaceTemplateSearchDirs();";
        if (content.includes(before)) {
            const after = "    const templateDirs = await resolveWorkspaceTemplateSearchDirs();";
            content = content.replace(before, after);
            fs.writeFileSync(workspaceTs, content);
        }
    }
'

# scripts/pnpm-runner.mts is the current runner. build-all.mts does not use it
# when OPENCLAW_BUILD_ALL_NO_PNPM=1. Do not overwrite it, and do not replace
# extensions/canvas/scripts/pnpm-runner.mjs — that file is a separate module
# with its own exports.

# 8. Fix Proxyline ESM resolution
echo "Fixing @openclaw/proxyline ESM exports..."
node -e '
    const fs = require("fs");
    const path = "node_modules/@openclaw/proxyline/package.json";
    if (fs.existsSync(path)) {
        const pkg = JSON.parse(fs.readFileSync(path, "utf8"));
        pkg.exports = {
            ".": "./dist/index.js",
            "./dispatcher-brand": "./dist/dispatcher-brand.js"
        };
        fs.writeFileSync(path, JSON.stringify(pkg, null, 4));
    }
'

# 7. Fix extension specific errors
sed -i 's/typeof import("@discordjs\/opus")/any/g' extensions/discord/src/voice/sdk-runtime.ts 2>/dev/null || true
sed -i 's/abortWith(requestSignal)/abortWith(requestSignal as any)/g' extensions/telegram/src/bot.ts 2>/dev/null || true

# Fix duplicate import in googlechat (causes PARSE_ERROR in rolldown)
sed -i '/resolveGoogleChatAccount,/{n; /listGoogleChatAccountIds,/d}' extensions/googlechat/src/channel.ts 2>/dev/null || true

echo "All optimized patches applied successfully."
