#!/bin/bash
# Patches Electron's safeStorage to gracefully fall back to plaintext token
# storage when encryption is unavailable (e.g. on standalone Wayland compositors
# like niri that Electron doesn't recognize as having a keyring).
set -euo pipefail

asar_path="$1"
work_dir="$(mktemp -d)"
trap 'rm -rf "$work_dir"' EXIT

npx --yes @electron/asar extract "$asar_path" "$work_dir/app"

main="$work_dir/app/dist/main.js"
[[ -f "$main" ]] || { echo "error: dist/main.js not found in asar"; exit 1; }

# saveTokens: check isEncryptionAvailable before encrypting
perl -0777 -i -pe '
s{function saveTokens\(tokens\) \{\n    const encrypted = electron_1\.safeStorage\.encryptString\(JSON\.stringify\(tokens\)\);\n    fs\.writeFileSync\(getTokensPath\(\), encrypted\);\n\}}
{function saveTokens(tokens) {
    const json = JSON.stringify(tokens);
    if (electron_1.safeStorage.isEncryptionAvailable()) {
        const encrypted = electron_1.safeStorage.encryptString(json);
        fs.writeFileSync(getTokensPath(), encrypted);
    } else {
        fs.writeFileSync(getTokensPath() + ".plain", json, "utf-8");
    }
}}s' "$main"

# getTokens: try plaintext first, then encrypted
perl -0777 -i -pe '
s{function getTokens\(\) \{\n    try \{\n        const encrypted = fs\.readFileSync\(getTokensPath\(\)\);\n        const decrypted = electron_1\.safeStorage\.decryptString\(encrypted\);\n        return JSON\.parse\(decrypted\);\n    \}\n    catch \{\n        return null;\n    \}\n\}}
{function getTokens() {
    try {
        const plainPath = getTokensPath() + ".plain";
        if (fs.existsSync(plainPath)) {
            return JSON.parse(fs.readFileSync(plainPath, "utf-8"));
        }
        const encrypted = fs.readFileSync(getTokensPath());
        const decrypted = electron_1.safeStorage.decryptString(encrypted);
        return JSON.parse(decrypted);
    }
    catch {
        return null;
    }
}}s' "$main"

# clearTokens: also remove plaintext file
perl -0777 -i -pe '
s{function clearTokens\(\) \{\n    try \{\n        fs\.unlinkSync\(getTokensPath\(\)\);\n    \}\n    catch \{\n        // Ignore errors if file doesn.t exist\n    \}\n\}}
{function clearTokens() {
    try { fs.unlinkSync(getTokensPath()); } catch {}
    try { fs.unlinkSync(getTokensPath() + ".plain"); } catch {}
}}s' "$main"

# setCachedUser: check isEncryptionAvailable before encrypting
perl -0777 -i -pe '
s{function setCachedUser\(user\) \{\n    const encrypted = electron_1\.safeStorage\.encryptString\(JSON\.stringify\(user\)\);\n    fs\.writeFileSync\(getUserCachePath\(\), encrypted\);\n\}}
{function setCachedUser(user) {
    const json = JSON.stringify(user);
    if (electron_1.safeStorage.isEncryptionAvailable()) {
        const encrypted = electron_1.safeStorage.encryptString(json);
        fs.writeFileSync(getUserCachePath(), encrypted);
    } else {
        fs.writeFileSync(getUserCachePath() + ".plain", json, "utf-8");
    }
}}s' "$main"

# getCachedUser: try plaintext first, then encrypted
perl -0777 -i -pe '
s{function getCachedUser\(\) \{\n    try \{\n        const encrypted = fs\.readFileSync\(getUserCachePath\(\)\);\n        const decrypted = electron_1\.safeStorage\.decryptString\(encrypted\);\n        return JSON\.parse\(decrypted\);\n    \}\n    catch \{\n        return null;\n    \}\n\}}
{function getCachedUser() {
    try {
        const plainPath = getUserCachePath() + ".plain";
        if (fs.existsSync(plainPath)) {
            return JSON.parse(fs.readFileSync(plainPath, "utf-8"));
        }
        const encrypted = fs.readFileSync(getUserCachePath());
        const decrypted = electron_1.safeStorage.decryptString(encrypted);
        return JSON.parse(decrypted);
    }
    catch {
        return null;
    }
}}s' "$main"

# clearCachedUser: also remove plaintext file
perl -0777 -i -pe '
s{function clearCachedUser\(\) \{\n    try \{\n        fs\.unlinkSync\(getUserCachePath\(\)\);\n    \}\n    catch \{\n        // Ignore if file doesn.t exist\n    \}\n\}}
{function clearCachedUser() {
    try { fs.unlinkSync(getUserCachePath()); } catch {}
    try { fs.unlinkSync(getUserCachePath() + ".plain"); } catch {}
}}s' "$main"

# writeDeviceKeysMap: check isEncryptionAvailable before encrypting
perl -0777 -i -pe '
s{function writeDeviceKeysMap\(map\) \{\n    deviceKeysCache = map;\n    const encrypted = electron_1\.safeStorage\.encryptString\(JSON\.stringify\(map\)\);\n    fs\.writeFileSync\(getDeviceKeysPath\(\), encrypted\);\n\}}
{function writeDeviceKeysMap(map) {
    deviceKeysCache = map;
    const json = JSON.stringify(map);
    if (electron_1.safeStorage.isEncryptionAvailable()) {
        const encrypted = electron_1.safeStorage.encryptString(json);
        fs.writeFileSync(getDeviceKeysPath(), encrypted);
    } else {
        fs.writeFileSync(getDeviceKeysPath() + ".plain", json, "utf-8");
    }
}}s' "$main"

# readDeviceKeysMap: try plaintext first, then encrypted
perl -0777 -i -pe '
s{function readDeviceKeysMap\(\) \{\n    if \(deviceKeysCache !== null\)\n        return deviceKeysCache;\n    try \{\n        const encrypted = fs\.readFileSync\(getDeviceKeysPath\(\)\);\n        const decrypted = electron_1\.safeStorage\.decryptString\(encrypted\);\n        deviceKeysCache = JSON\.parse\(decrypted\);\n        return deviceKeysCache \?\? \{\};\n    \}\n    catch \{\n        deviceKeysCache = \{\};\n        return deviceKeysCache;\n    \}\n\}}
{function readDeviceKeysMap() {
    if (deviceKeysCache !== null)
        return deviceKeysCache;
    try {
        const plainPath = getDeviceKeysPath() + ".plain";
        if (fs.existsSync(plainPath)) {
            deviceKeysCache = JSON.parse(fs.readFileSync(plainPath, "utf-8"));
            return deviceKeysCache ?? {};
        }
        const encrypted = fs.readFileSync(getDeviceKeysPath());
        const decrypted = electron_1.safeStorage.decryptString(encrypted);
        deviceKeysCache = JSON.parse(decrypted);
        return deviceKeysCache ?? {};
    }
    catch {
        deviceKeysCache = {};
        return deviceKeysCache;
    }
}}s' "$main"

npx --yes @electron/asar pack "$work_dir/app" "$asar_path"
echo "Patched safeStorage plaintext fallback"
