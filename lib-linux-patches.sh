#!/bin/bash
# Linux-specific post-copy patches applied to the packed app.asar.
#
# Fix 1 — "no window appears on launch" (E2BIG):
#   The main process stores a ~260KB product configuration JSON into the
#   environment variable ACC_PRODUCT_CONFIG_V3. Linux's MAX_ARG_STRLEN cap
#   (128KB per env string) then causes every execve() to fail with E2BIG,
#   including Chromium's internal /proc/self/exe spawn for the network
#   service and utility processes. Without those child processes the
#   renderer cannot start and the main window never shows.
#
#   We install a tiny shim at the top of main/index.js that intercepts
#   writes to ACC_PRODUCT_CONFIG_V3 / ACC_PRODUCT_CONFIG_V2 via
#   Object.defineProperty on process.env. The value is kept in a JS slot
#   only — libc setenv is never called, so execve() stays well under the
#   per-string limit while JS code still observes the same values.
#
# Fix 2 — "tray icon menu is empty":
#   On Linux, Electron's Tray is backed by libayatana-appindicator. The
#   indicator never emits the `click` / `right-click` events the upstream
#   code relies on, and only renders a menu that has been attached via
#   tray.setContextMenu(...). We inject that call right after the Tray is
#   constructed so the "显示窗口 / 退出" menu actually appears.
#
# Fix 3 — "tray icon is a missing-image placeholder" (exclamation mark):
#   Upstream hands the Tray a resized in-memory NativeImage. The
#   AppIndicator backend can't re-read those bytes through GTK so the
#   indicator shows its "broken image" fallback. We patch the Tray
#   construction on Linux to use the on-disk PNG at
#   <install-dir>/.workbuddy-linux/workbuddy.png (written by install.sh
#   and shipped inside the generated .deb/.rpm/.pkg.tar.zst under
#   /opt/<app>/.workbuddy-linux/).

LINUX_PATCHES_SHIM_MARKER="__WB_LINUX_PATCHES_V5__"

apply_linux_runtime_patches() {
    local app_dir="$1"
    local asar_path="$app_dir/resources/app.asar"

    [ -f "$asar_path" ] || {
        warn "Linux patches: app.asar not found at $asar_path"
        return 0
    }

    info "=== Applying Linux runtime patches to app.asar ==="

    # The Node helper needs @electron/asar available. Install it into the
    # per-build WORK_DIR so we don't pollute the project with a persistent
    # node_modules tree.
    local asar_tool_dir="$WORK_DIR/asar-tool"
    if [ ! -x "$asar_tool_dir/node_modules/.bin/asar" ]; then
        info "  Installing @electron/asar for patcher"
        mkdir -p "$asar_tool_dir"
        (
            cd "$asar_tool_dir"
            npm init -y >/dev/null 2>&1
            npm install @electron/asar --no-audit --no-fund --silent 2>&1
        ) || {
            warn "  Failed to install @electron/asar; skipping Linux patches"
            return 0
        }
    fi

    NODE_PATH="$asar_tool_dir/node_modules" \
        node "$SCRIPT_DIR/lib-apply-linux-patches.js" \
             "$asar_path" \
             "$LINUX_PATCHES_SHIM_MARKER" \
        || {
        warn "  Failed to apply Linux patches; leaving app.asar untouched"
        return 0
    }
    info "  Linux runtime patches applied successfully"
}
