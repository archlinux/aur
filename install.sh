#!/bin/bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
APP_ID="${WORKBUDDY_APP_ID:-workbuddy}"
APP_DISPLAY_NAME="${WORKBUDDY_APP_DISPLAY_NAME:-WorkBuddy}"
INSTALL_DIR="${WORKBUDDY_INSTALL_DIR:-$SCRIPT_DIR/workbuddy-app}"
ELECTRON_VERSION="${ELECTRON_VERSION:-41.1.1}"
ELECTRON_HEADERS_URL="${ELECTRON_HEADERS_URL:-${npm_config_disturl:-${NPM_CONFIG_DISTURL:-https://artifacts.electronjs.org/headers/dist}}}"
ELECTRON_MIRROR="${ELECTRON_MIRROR:-}"
WORK_DIR="$(mktemp -d)"
ARCH="$(uname -m)"
PROVIDED_INPUT=""
FRESH=0

. "$SCRIPT_DIR/lib-common.sh"
. "$SCRIPT_DIR/lib-dmg.sh"
. "$SCRIPT_DIR/lib-electron.sh"
. "$SCRIPT_DIR/lib-native-modules.sh"
. "$SCRIPT_DIR/lib-linux-patches.sh"

usage() {
    cat <<'HELP'
Usage: ./install.sh [--fresh] [path/to/WorkBuddy.dmg | path/to/WorkBuddy.app]

Builds a local Linux Electron app from a user-owned official WorkBuddy
macOS Intel/x64 DMG or extracted .app bundle. With no path, the installer
expects exactly one official DMG in downloads/.

Environment:
  WORKBUDDY_INSTALL_DIR     Output app directory (default: ./workbuddy-app)
  ELECTRON_MIRROR           Optional Electron runtime mirror
  ELECTRON_HEADERS_URL      Electron headers dist URL for native rebuilds
HELP
}

parse_args() {
    while [ "$#" -gt 0 ]; do
        case "$1" in
            --fresh)
                FRESH=1
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            -*)
                usage >&2
                exit 2
                ;;
            *)
                [ -z "$PROVIDED_INPUT" ] || error "Only one input path can be provided"
                PROVIDED_INPUT="$1"
                ;;
        esac
        shift
    done
}

check_deps() {
    require_cmd python3
    require_cmd curl
    require_cmd unzip
    require_cmd node
    require_cmd npm
    require_cmd npx
    find_7z >/dev/null
}

prepare_install_dir() {
    if [ -e "$INSTALL_DIR" ]; then
        if [ "$FRESH" -eq 1 ]; then
            rm -rf "$INSTALL_DIR"
        else
            info "Replacing existing install dir: $INSTALL_DIR"
            rm -rf "$INSTALL_DIR"
        fi
    fi
    mkdir -p "$INSTALL_DIR"
}

copy_app_payload() {
    local app_bundle="$1"
    local resources_dir="$app_bundle/Contents/Resources"
    local app_asar="$resources_dir/app.asar"
    local app_asar_unpacked="$resources_dir/app.asar.unpacked"
    local app_payload="$resources_dir/app"

    # WorkBuddy uses app.asar + app.asar.unpacked (unlike CodeBuddy's plain app dir)
    if [ -f "$app_asar" ]; then
        info "Copying WorkBuddy app.asar payload"
        mkdir -p "$INSTALL_DIR/resources"
        cp "$app_asar" "$INSTALL_DIR/resources/app.asar"

        if [ -d "$app_asar_unpacked" ]; then
            info "Copying app.asar.unpacked"
            cp -a "$app_asar_unpacked" "$INSTALL_DIR/resources/app.asar.unpacked"
        fi
    elif [ -d "$app_payload" ]; then
        info "Copying WorkBuddy app payload (directory mode)"
        rm -rf "$INSTALL_DIR/resources/app"
        mkdir -p "$INSTALL_DIR/resources"
        cp -a "$app_payload" "$INSTALL_DIR/resources/app"
    else
        error "No app.asar or app directory found in: $resources_dir"
    fi

    if [ -f "$resources_dir/node_modules.asar" ]; then
        cp "$resources_dir/node_modules.asar" "$INSTALL_DIR/resources/" 2>/dev/null || true
    fi
}

write_icon() {
    local app_bundle="$1"
    local icon_source="$app_bundle/Contents/Resources/icon.icns"
    local icon_target="$INSTALL_DIR/.workbuddy-linux/workbuddy.png"
    local icon_tmp="$WORK_DIR/icon"

    mkdir -p "$INSTALL_DIR/.workbuddy-linux" "$icon_tmp"

    # Also check for icon in app.asar.unpacked/resources
    if [ ! -f "$icon_source" ]; then
        local alt_icon="$app_bundle/Contents/Resources/app.asar.unpacked/resources/icon.png"
        if [ -f "$alt_icon" ]; then
            cp "$alt_icon" "$icon_target"
            return 0
        fi
        warn "WorkBuddy icon not found in app bundle"
        return 0
    fi

    if command -v icns2png >/dev/null 2>&1; then
        icns2png -x -s 256 -o "$icon_tmp" "$icon_source" >/dev/null 2>&1 || true
        local generated
        generated="$(find "$icon_tmp" -type f -name "*.png" | sort | tail -n 1)"
        if [ -n "$generated" ]; then
            cp "$generated" "$icon_target"
            return 0
        fi
    fi

    if command -v magick >/dev/null 2>&1; then
        magick "$icon_source" "$icon_target" >/dev/null 2>&1 && return 0
    elif command -v convert >/dev/null 2>&1; then
        convert "$icon_source" "$icon_target" >/dev/null 2>&1 && return 0
    fi

    # Fallback: extract PNG directly from ICNS with python3 (no extra libs needed).
    # ICNS 256x256+ entries embed raw PNG data that we can locate by signature.
    if python3 - "$icon_source" "$icon_target" <<'PY' 2>/dev/null; then
import struct, sys

def extract(icns_path, out_path):
    # ICNS entry types containing PNG, ordered by preference
    wanted = [b'ic08', b'ic09', b'ic13', b'ic14', b'ic10', b'ic07']
    png_sig = b'\x89PNG'
    with open(icns_path, 'rb') as f:
        if f.read(4) != b'icns':
            return False
        total = struct.unpack('>I', f.read(4))[0]
        found = {}
        while f.tell() < total:
            etype = f.read(4)
            if len(etype) < 4:
                break
            esize = struct.unpack('>I', f.read(4))[0]
            edata = f.read(esize - 8)
            if etype in wanted and edata[:4] == png_sig:
                found[etype] = edata
        for t in wanted:
            if t in found:
                with open(out_path, 'wb') as o:
                    o.write(found[t])
                return True
    return False

sys.exit(0 if extract(sys.argv[1], sys.argv[2]) else 1)
PY
        return 0
    fi

    warn "Could not convert WorkBuddy .icns icon; desktop entry will use theme icon name"
}

write_launcher() {
    cat > "$INSTALL_DIR/start.sh" <<EOF
#!/bin/bash
set -euo pipefail

APP_DIR="\$(cd "\$(dirname "\${BASH_SOURCE[0]}")" && pwd)"
export CHROME_DESKTOP="${APP_ID}.desktop"
export ELECTRON_FORCE_IS_PACKAGED=1

exec "\$APP_DIR/electron" \\
  --no-sandbox \\
  --disable-dev-shm-usage \\
  --disable-gpu-sandbox \\
  --in-process-gpu \\
  --ozone-platform-hint=auto \\
  --enable-wayland-ime \\
  "\$@"
EOF
    chmod +x "$INSTALL_DIR/start.sh"
}

write_desktop_entry() {
    local icon_value="$APP_ID"
    if [ -f "$INSTALL_DIR/.workbuddy-linux/workbuddy.png" ]; then
        icon_value="$INSTALL_DIR/.workbuddy-linux/workbuddy.png"
    fi

    mkdir -p "$INSTALL_DIR/.workbuddy-linux"
    cat > "$INSTALL_DIR/.workbuddy-linux/$APP_ID.desktop" <<EOF
[Desktop Entry]
Name=$APP_DISPLAY_NAME
Comment=Run WorkBuddy on Linux
Exec=$INSTALL_DIR/start.sh %F
Icon=$icon_value
Type=Application
Categories=Development;IDE;
StartupNotify=true
StartupWMClass=WorkBuddy
MimeType=x-scheme-handler/workbuddy;
EOF
}

write_build_metadata() {
    local app_bundle="$1"
    local version
    version="$(read_app_version "$app_bundle")"
    mkdir -p "$INSTALL_DIR/.workbuddy-linux"
    cat > "$INSTALL_DIR/.workbuddy-linux/build-info.json" <<EOF
{
  "appId": "$APP_ID",
  "displayName": "$APP_DISPLAY_NAME",
  "upstreamVersion": "$version",
  "electronVersion": "$ELECTRON_VERSION",
  "generatedAt": "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
}
EOF
}

main() {
    parse_args "$@"
    check_deps

    local input_path app_bundle
    input_path="$(resolve_input_path "$PROVIDED_INPUT")"
    app_bundle="$(resolve_app_bundle "$input_path")"
    ELECTRON_VERSION="$(detect_electron_version "$app_bundle")"

    info "Using app bundle: $app_bundle"
    info "Using Electron: $ELECTRON_VERSION"

    prepare_install_dir
    download_electron_runtime
    copy_app_payload "$app_bundle"

    # Rebuild native modules in app.asar.unpacked (where the .node files live)
    local native_dir="$INSTALL_DIR/resources/app.asar.unpacked"
    if [ -d "$native_dir/node_modules" ]; then
        rebuild_native_modules "$native_dir"
    elif [ -d "$INSTALL_DIR/resources/app/node_modules" ]; then
        rebuild_native_modules "$INSTALL_DIR/resources/app"
    fi

    # Apply Linux-specific runtime patches inside app.asar so the main
    # window actually opens and the tray right-click menu is populated.
    apply_linux_runtime_patches "$INSTALL_DIR"

    write_icon "$app_bundle"
    write_launcher
    write_desktop_entry
    write_build_metadata "$app_bundle"

    info "Build complete: $INSTALL_DIR"
    info "Run: $INSTALL_DIR/start.sh"
}

trap 'rm -rf "$WORK_DIR"' EXIT
main "$@"
