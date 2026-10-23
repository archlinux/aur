#!/bin/bash
# Linux Electron runtime download. Sourced by install.sh.

electron_arch() {
    case "$ARCH" in
        x86_64) echo "x64" ;;
        aarch64) echo "arm64" ;;
        armv7l) echo "armv7l" ;;
        *) error "Unsupported architecture: $ARCH" ;;
    esac
}

download_electron_runtime() {
    local arch zip_name url cache_dir cached_zip partial_zip

    arch="$(electron_arch)"
    zip_name="electron-v${ELECTRON_VERSION}-linux-${arch}.zip"

    # A pre-seeded runtime zip (e.g. provided via PKGBUILD source[]) wins over
    # any download, so builds can run fully offline.
    if [ -n "${WORKBUDDY_ELECTRON_ZIP:-}" ] && [ -f "$WORKBUDDY_ELECTRON_ZIP" ]; then
        info "Using pre-seeded Electron runtime: $WORKBUDDY_ELECTRON_ZIP"
        unzip -qo "$WORKBUDDY_ELECTRON_ZIP" -d "$INSTALL_DIR"
        [ -x "$INSTALL_DIR/electron" ] || error "Electron binary was not extracted"
        return 0
    fi

    if [ -n "$ELECTRON_MIRROR" ]; then
        url="${ELECTRON_MIRROR%/}/v${ELECTRON_VERSION}/${zip_name}"
    else
        url="https://github.com/electron/electron/releases/download/v${ELECTRON_VERSION}/${zip_name}"
    fi

    cache_dir="${WORKBUDDY_ELECTRON_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/workbuddy-linux/electron}"
    cached_zip="$cache_dir/$zip_name"
    partial_zip="$cached_zip.part"
    mkdir -p "$cache_dir"

    if [ ! -f "$cached_zip" ]; then
        info "Downloading $zip_name"
        curl -L --fail --continue-at - --progress-bar -o "$partial_zip" "$url"
        mv "$partial_zip" "$cached_zip"
    else
        info "Using cached Electron runtime: $cached_zip"
    fi

    unzip -qo "$cached_zip" -d "$INSTALL_DIR"
    [ -x "$INSTALL_DIR/electron" ] || error "Electron binary was not extracted"
}
