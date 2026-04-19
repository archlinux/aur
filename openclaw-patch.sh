#!/usr/bin/env bash

set -euo pipefail

PATCH_FILE="openclaw-adjustment.patch"

patch_source() {
    # 1. package.json
    echo "Patching package.json..."
    if ! grep -q '"node-gyp":' package.json; then
        # Verify original strings exist before patching
        grep -q '"scripts": {' package.json
        grep -q '"packageManager": "pnpm@' package.json
        grep -q '"lit":' package.json

        sed -i '/"scripts": {/,/},/ s/pnpm/bun run/g' package.json
        # Replace npm package manager definition
        sed -i 's/"packageManager": "pnpm@[^"]*"/"packageManager": "bun@1.2.0"/' package.json
        # Insert node-gyp
        sed -i '/"lit":/a \    "node-gyp": "^12.2.0",' package.json
        # Remove @discordjs/opus if it exists (don't fail if already gone)
        sed -i '/"@discordjs\/opus":/d' package.json
    fi

    # 2. scripts/ui.js
    echo "Patching scripts/ui.js..."
    # Insert bun detection
    if ! grep -q 'const bun = which("bun");' scripts/ui.js; then
        grep -q 'const pnpm = which("pnpm");' scripts/ui.js
        sed -i '/const pnpm = which("pnpm");/i \  const bun = which("bun");\n  if (bun) {\n    return { cmd: bun, kind: "bun" };\n  }' scripts/ui.js
    fi
    if ! grep -q 'install bun or pnpm, then retry' scripts/ui.js; then
        grep -q 'install pnpm, then retry' scripts/ui.js
        sed -i 's/install pnpm, then retry/install bun or pnpm, then retry/' scripts/ui.js
    fi

    # 3. discord voice manager (path moved upstream)
    VOICE_MANAGER=""
    for f in src/discord/voice/manager.ts extensions/discord/src/voice/manager.ts; do
        if [ -f "$f" ]; then
            VOICE_MANAGER="$f"
            break
        fi
    done
    if [ -n "$VOICE_MANAGER" ]; then
        echo "Patching $VOICE_MANAGER..."
        if ! grep -q 'any' "$VOICE_MANAGER" 2>/dev/null || ! grep -q 'opus' "$VOICE_MANAGER" 2>/dev/null; then
            if grep -q 'typeof import("@discordjs/opus")' "$VOICE_MANAGER"; then
                sed -i 's/typeof import("@discordjs\/opus")/any/g' "$VOICE_MANAGER"
            fi
        fi
    else
        echo "Skipping discord voice manager patch (file not found, upstream removed opus)"
    fi

    # 4. src/agents/skills-install.ts
    echo "Patching src/agents/skills-install.ts..."
    if ! grep -q 'CONFIG_DIR' src/agents/skills-install.ts; then
        grep -q 'import { resolveUserPath } from "../utils.js";' src/agents/skills-install.ts
        grep -q 'env?: NodeJS.ProcessEnv;' src/agents/skills-install.ts
        grep -q 'env: params.env,' src/agents/skills-install.ts
        grep -q 'const uvInstallFailure = await ensureUvInstalled' src/agents/skills-install.ts
        grep -q 'if (spec.kind === "brew" && brewExe && argv?\.\[0\] === "brew") {' src/agents/skills-install.ts
        grep -q 'return withWarnings(await executeInstallCommand({ argv, timeoutMs, env }), warnings);' src/agents/skills-install.ts

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

        sed -i 's/return withWarnings(await executeInstallCommand({ argv, timeoutMs, env }), warnings);/\
  \/\/ Use CONFIG_DIR as cwd if we are installing locally (stripped globals)\
  const cwd = (spec.kind === "node" \&\& (forceLocal || fs.existsSync(configPkgJson)))\
    ? CONFIG_DIR\
    : undefined;\
\
  return withWarnings(await executeInstallCommand({ argv, timeoutMs, env, cwd }), warnings);/' src/agents/skills-install.ts
    fi
}

show_help() {
    echo "Usage: $0 [OPTION]"
    echo "Options:"
    echo "  --patch           Apply changes to the source"
    echo "  --refresh-patch   Recreate the patch file from pristine source for reference"
    echo "  --help            Show this help"
}

case "${1:-}" in
--patch)
    patch_source
    ;;
--refresh-patch)
    echo "Refreshing pristine sources..."
    updpkgsums
    makepkg -Co --noprepare

    cd src/openclaw

    echo "Creating backups for diff..."
    cp package.json package.json.orig
    cp scripts/ui.js scripts/ui.js.orig

    VOICE_MANAGER=""
    for f in src/discord/voice/manager.ts extensions/discord/src/voice/manager.ts; do
        if [ -f "$f" ]; then
            VOICE_MANAGER="$f"
            break
        fi
    done
    if [ -n "$VOICE_MANAGER" ]; then
        cp "$VOICE_MANAGER" "$VOICE_MANAGER.orig"
    fi

    cp src/agents/skills-install.ts src/agents/skills-install.ts.orig

    patch_source

    echo "Generating new $PATCH_FILE..."
    {
        diff -u package.json.orig package.json || true
        diff -u scripts/ui.js.orig scripts/ui.js || true
        if [ -n "$VOICE_MANAGER" ]; then
            diff -u "$VOICE_MANAGER.orig" "$VOICE_MANAGER" || true
        fi
        diff -u src/agents/skills-install.ts.orig src/agents/skills-install.ts || true
    } >"../../$PATCH_FILE"

    cd ../..
    echo "Updating PKGBUILD checksums..."
    updpkgsums
    echo "Done! You can now review $PATCH_FILE."
    ;;
--help | "")
    show_help
    ;;
*)
    echo "Unknown option: $1"
    show_help
    exit 1
    ;;
esac
