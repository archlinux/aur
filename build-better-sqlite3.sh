#!/bin/bash
# Build better-sqlite3 from source and prepare cached artifact for electron-builder
# Usage: build_better_sqlite3 <SYSTEM_ELECTRON_VERSION> <CARCH> <SRC_DIR>

build_better_sqlite3() {
    local SYSTEM_ELECTRON_VERSION="$1"
    local CARCH="$2"
    local SRC_DIR="$3"
    
    cd "${SRC_DIR}/cherry-studio.git"
    
    msg2 "Building better-sqlite3 from source for electron..."
    
    # Find better-sqlite3 in node_modules
    local _better_sqlite3_path
    _better_sqlite3_path=$(find node_modules -type d -name "better-sqlite3" -path "*/node_modules/better-sqlite3" | head -1)
    if [[ -z "${_better_sqlite3_path}" ]]; then
        error "better-sqlite3 not found in node_modules"
        return 1
    fi
    
    # Compile better-sqlite3 from source for system electron
    cd "${_better_sqlite3_path}"
    npm_config_target="${SYSTEM_ELECTRON_VERSION}" \
    npm_config_runtime=electron \
    npm_config_disturl="https://electronjs.org/headers" \
    npm_config_build_from_source=true \
    npm install
    
    cd "${SRC_DIR}/cherry-studio.git"
    
    # Determine architecture name
    local _arch_name
    case "${CARCH}" in
        x86_64)  _arch_name="x64" ;;
        aarch64) _arch_name="arm64" ;;
        *)       error "Unsupported architecture: ${CARCH}"; return 1 ;;
    esac
    
    # Copy the compiled addon to the prebuilt cache directory
    local _prebuilt_dir="scripts/linux-native/prebuilt/${_arch_name}"
    mkdir -p "${_prebuilt_dir}"
    
    # Find and copy the compiled addon
    local _addon_source
    _addon_source=$(find "${_better_sqlite3_path}" -name "better_sqlite3.node" -path "*/build/Release/*" | head -1)
    if [[ -z "${_addon_source}" ]]; then
        error "Failed to find compiled better_sqlite3.node addon"
        return 1
    fi
    
    cp "${_addon_source}" "${_prebuilt_dir}/better_sqlite3.node"
    
    # Extract glibc requirements from the binary
    local _glibc _glibcxx _cxxabi
    _glibc=$(strings "${_prebuilt_dir}/better_sqlite3.node" | grep -oP 'GLIBC_\K[0-9]+(\.[0-9]+)+' | sort -V | tail -1)
    _glibcxx=$(strings "${_prebuilt_dir}/better_sqlite3.node" | grep -oP 'GLIBCXX_\K[0-9]+(\.[0-9]+)+' | sort -V | tail -1)
    _cxxabi=$(strings "${_prebuilt_dir}/better_sqlite3.node" | grep -oP 'CXXABI_\K[0-9]+(\.[0-9]+)+' | sort -V | tail -1)
    
    # Generate manifest.json with actual requirements
    local _sha256
    _sha256=$(sha256sum "${_prebuilt_dir}/better_sqlite3.node" | awk '{print $1}')
    local _better_sqlite3_version
    _better_sqlite3_version=$(jq -r '.version' "${_better_sqlite3_path}/package.json")
    local _electron_abi
    _electron_abi=$(node -e "console.log(require('node-abi').getAbi('${SYSTEM_ELECTRON_VERSION}', 'electron'))")
    
    cat > "${_prebuilt_dir}/manifest.json" << EOF
{
  "schemaVersion": 2,
  "platform": "linux",
  "arch": "${_arch_name}",
  "electronVersion": "${SYSTEM_ELECTRON_VERSION}",
  "electronAbi": "${_electron_abi}",
  "betterSqlite3Version": "${_better_sqlite3_version}",
  "sha256": "${_sha256}",
  "requirements": {
    "glibc": "$([ -n "${_glibc}" ] && echo "${_glibc}" || echo "null")",
    "glibcxx": "$([ -n "${_glibcxx}" ] && echo "${_glibcxx}" || echo "null")",
    "cxxabi": "$([ -n "${_cxxabi}" ] && echo "${_cxxabi}" || echo "null")"
  }
}
EOF
    
    # Update release.json with the new sha256 so verification passes
    local _manifest_sha256
    _manifest_sha256=$(sha256sum "${_prebuilt_dir}/manifest.json" | awk '{print $1}')
    
    # Update addon sha256 (both x64 and arm64 entries)
    sed -i "s/\"sha256\": \"[a-f0-9]*\"/\"sha256\": \"${_sha256}\"/g" scripts/linux-native/release.json
    
    # Update manifest sha256 using python3
    python3 -c "
import json
with open('scripts/linux-native/release.json', 'r') as f:
    config = json.load(f)
config['artifacts']['x64']['manifest']['sha256'] = '${_manifest_sha256}'
config['artifacts']['arm64']['manifest']['sha256'] = '${_manifest_sha256}'
with open('scripts/linux-native/release.json', 'w') as f:
    json.dump(config, f, indent=2)
"
    
    # Update glibc version limits in compat.js to allow newer system glibc
    sed -i "s/glibc: '2.28'/glibc: '2.44'/" scripts/linux-native/compat.js
    sed -i "s/glibcxx: '3.4.25'/glibcxx: '3.4.39'/" scripts/linux-native/compat.js
    sed -i "s/cxxabi: '1.3.11'/cxxabi: '1.3.15'/" scripts/linux-native/compat.js
    
    msg2 "better-sqlite3 compiled and cached successfully"
}