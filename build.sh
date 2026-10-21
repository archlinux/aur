#!/usr/bin/env bash
#
# Build a Linux port of xTool Studio from the official Windows build.
#
# xTool Studio (formerly xTool Creative Space) is an Electron application that
# upstream ships for Windows and macOS only. This script repacks the official
# Windows installer into a native Linux application by:
#
#   1. extracting resources/app.asar (the actual application) from the installer
#   2. running it on an official Linux Electron runtime of the same version
#   3. swapping the two Windows-only native modules for their published Linux
#      builds (usb, @serialport/bindings-cpp) and replacing the private
#      @atomm-studio/system-rs addon with a pure-JS implementation of the same
#      API (see system-rs-index.js)
#   4. making the forked service workers resilient to stdio EPIPE
#      (see worker-stdio-guard.js)
#   5. making the closed-source, Windows-only algorithm worker (algo-server)
#      usable from Linux through Wine plus a small AF_UNIX <-> named-pipe
#      bridge (see algo-ipc-bridge.c, algo-server-linux-x64)
#
# Usage:
#   ./build.sh                 # uses ./xTool-Studio-x64-<APP_VER>.exe if present
#   INSTALLER=/path/to.exe ./build.sh
#
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TOOLS="${TOOLS:-$ROOT}"   # port sources live next to build.sh (AUR keeps the repo flat)
WORK="$ROOT/work"
OUT="$ROOT/dist/xtool-studio"

APP_VER="${APP_VER:-1.9.11}"
ELECTRON_VER="${ELECTRON_VER:-}"   # empty: auto-detected from the payload's `version`
INSTALLER="${INSTALLER:-$ROOT/xTool-Studio-x64-${APP_VER}.exe}"
INSTALLER_URL="${INSTALLER_URL:-https://storage.atomm.com/efficacy/atomm-package/packages/109/afffecbb-38d7-40ed-8bba-7e7acee5c18c/xTool-Studio-x64-${APP_VER}.exe}"
VERSION_HISTORY_URL="${VERSION_HISTORY_URL:-https://support.xtool.com/article/2419}"

# Native modules whose Linux prebuilds are published on the public npm registry.
USB_VER="${USB_VER:-2.18.0}"
SERIALPORT_BINDINGS_VER="${SERIALPORT_BINDINGS_VER:-13.0.0}"

log() { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
die() { printf '\n\033[1;31mERROR: %s\033[0m\n' "$*" >&2; exit 1; }

if [ "${1:-}" = "--check" ]; then
	log "Checking the upstream version history ($VERSION_HISTORY_URL)"
	python3 - "$APP_VER" "$VERSION_HISTORY_URL" <<'PY'
import re, sys, urllib.request

local, url = sys.argv[1], sys.argv[2]
html = urllib.request.urlopen(url, timeout=30).read().decode("utf-8", "replace")
found = {}
for m in re.finditer(r'https://storage[^"\'\s<>]*?/xTool-Studio-x64-(\d+(?:\.\d+)+)\.exe', html):
    found.setdefault(m.group(1), m.group(0))
if not found:
    sys.exit("could not find any xTool-Studio installer link on the page")

key = lambda v: tuple(int(x) for x in v.split("."))
latest = max(found, key=key)
print(f"  local build:  {local}")
print(f"  latest:       {latest}")
if key(latest) <= key(local):
    print("  up to date")
    sys.exit(0)

print("  newer version available")
print(f"  installer:    {found[latest]}")
print("  build it with:")
print(f"    APP_VER={latest} INSTALLER_URL='{found[latest]}' ./build.sh")
print("  (the Electron runtime version is read from the payload automatically)")
sys.exit(3)
PY
	exit $?
fi

log "Checking build dependencies"
missing=()
for bin in 7z asar npm curl unzip tar python3 wine x86_64-w64-mingw32-gcc; do
	command -v "$bin" >/dev/null 2>&1 || missing+=("$bin")
done
[ ${#missing[@]} -eq 0 ] || die "missing tools: ${missing[*]}
  Arch: sudo pacman -S p7zip asar nodejs npm curl unzip python wine mingw-w64-gcc"

[ -f "$INSTALLER" ] || {
	log "Installer not found, downloading $INSTALLER_URL"
	curl -fL -o "$INSTALLER" "$INSTALLER_URL"
}

rm -rf "$WORK" "$OUT"
mkdir -p "$WORK/nsis" "$WORK/asar" "$WORK/npm" "$OUT"

# ---------------------------------------------------------------- 1. unpack --
log "Extracting the official installer ($(basename "$INSTALLER"))"
inner="$(7z l "$INSTALLER" 2>/dev/null | awk '/app-64\.7z$/ {print $NF; exit}')"
[ -n "$inner" ] || die "no app-64.7z payload found inside the installer"
7z x -y -o"$WORK/nsis" "$INSTALLER" "$inner" >/dev/null
7z x -y -o"$WORK/payload" "$WORK/nsis/$inner" >/dev/null

RES_SRC="$WORK/payload/resources"
[ -f "$RES_SRC/app.asar" ] || die "unexpected installer layout: $RES_SRC/app.asar missing"

log "Extracting resources/app.asar"
asar extract "$RES_SRC/app.asar" "$WORK/asar"

# ---------------------------------------------------------------- 2. electron --
if [ -z "$ELECTRON_VER" ]; then
	ELECTRON_VER="$(tr -d '[:space:]' < "$WORK/payload/version" 2>/dev/null || true)"
	[ -n "$ELECTRON_VER" ] || die "cannot detect the Electron version from the payload"
	log "Detected Electron $ELECTRON_VER from the installer payload"
fi
ELECTRON_ZIP="electron-v${ELECTRON_VER}-linux-x64.zip"

log "Fetching Electron $ELECTRON_VER (linux-x64)"
if [ -n "${ELECTRON_ZIP_PATH:-}" ]; then
	cp "$ELECTRON_ZIP_PATH" "$WORK/$ELECTRON_ZIP"
elif [ ! -f "$WORK/$ELECTRON_ZIP" ]; then
	curl -fL -o "$WORK/$ELECTRON_ZIP" \
		"https://github.com/electron/electron/releases/download/v${ELECTRON_VER}/${ELECTRON_ZIP}"
fi
unzip -q -o "$WORK/$ELECTRON_ZIP" -d "$OUT"
rm -f "$OUT/resources/default_app.asar"
mv "$OUT/electron" "$OUT/xtool-studio"

# ------------------------------------------------------- 3. native modules --
log "Installing Linux prebuilds for usb and @serialport/bindings-cpp"
cd "$WORK/npm"
if [ -n "${USB_TGZ:-}" ] && [ -n "${SERIALPORT_TGZ:-}" ]; then
	cp "$USB_TGZ" "usb-$USB_VER.tgz"
	cp "$SERIALPORT_TGZ" "serialport-bindings-cpp-$SERIALPORT_BINDINGS_VER.tgz"
else
	npm pack "usb@$USB_VER" "@serialport/bindings-cpp@$SERIALPORT_BINDINGS_VER" --silent >/dev/null
fi
mkdir -p usb_x sp_x
tar xzf "usb-$USB_VER.tgz" -C usb_x
tar xzf "serialport-bindings-cpp-$SERIALPORT_BINDINGS_VER.tgz" -C sp_x

APPNM="$WORK/asar/node_modules"
rm -rf "$APPNM/usb/prebuilds" "$APPNM/@serialport/bindings-cpp/prebuilds"
cp -a usb_x/package/prebuilds "$APPNM/usb/prebuilds"
cp -a sp_x/package/prebuilds "$APPNM/@serialport/bindings-cpp/prebuilds"

# Keep only the x86_64 glibc builds: android/arm/ia32/musl prebuilds are dead
# weight and make dependency scanners report libraries this platform never uses.
for pre in "$APPNM/usb/prebuilds" "$APPNM/@serialport/bindings-cpp/prebuilds"; do
	find "$pre" -mindepth 1 -maxdepth 1 -type d ! -name linux-x64 -exec rm -rf {} +
	find "$pre/linux-x64" -maxdepth 1 -type f ! -name '*glibc*' -delete
done
rm -rf "$APPNM/.bin"   # npm shims (.cmd/.ps1) are useless on Linux

# Drop dev-only Node CLI scripts shipped inside the npm packages. They are never
# executed at runtime (the app carries its own Node), but package scanners
# report them as an unlisted "node" dependency.
find "$APPNM" -type d -path '*node-addon-api*' -name tools -prune -exec rm -rf {} +
rm -f "$APPNM/node-gyp-build/bin.js" "$APPNM/node-gyp-build/build-test.js" \
      "$APPNM/node-gyp-build/optional.js"

log "Replacing the private @atomm-studio/system-rs addon with the JS port"
SYSRS="$APPNM/@atomm-studio/system-rs"
cp "$TOOLS/system-rs-index.js" "$SYSRS/index.js"
cp "$TOOLS/system-rs-index.d.ts" "$SYSRS/index.d.ts"
rm -f "$SYSRS/browser.js"
python3 - "$SYSRS/package.json" <<-'PY'
	import json, sys
	p = sys.argv[1]
	d = json.load(open(p))
	d.pop('optionalDependencies', None)
	d.pop('napi', None)
	d['description'] = 'Host information (pure-JS Linux port of the upstream NAPI-RS addon)'
	json.dump(d, open(p, 'w'), indent=2)
PY
rm -rf "$APPNM/@atomm-studio"/system-rs-* "$APPNM/@atomm-studio/system-rs-win32-x64-msvc"

# ------------------------------------------------------------ 4. app layout --
log "Assembling the application payload"
cp -a "$WORK/asar" "$OUT/resources/app"
cp -a "$RES_SRC/exts.zip" "$RES_SRC/langs.zip" "$RES_SRC/ext.json" \
	"$RES_SRC/langs_manifest.json" "$RES_SRC/package.json" "$OUT/resources/"
cp -a "$RES_SRC/tools" "$OUT/resources/tools"
cp -a "$RES_SRC/esptool" "$OUT/resources/esptool"

log "Making the forked service workers EPIPE-tolerant"
for f in "$OUT/resources/app/.vite/build/"discover-worker.*.cjs \
	"$OUT/resources/app/.vite/build/"usb-detect-worker.*.cjs; do
	[ -f "$f" ] || continue
	cat "$TOOLS/worker-stdio-guard.js" "$f" > "$f.tmp" && mv "$f.tmp" "$f"
	printf '    patched %s\n' "$(basename "$f")"
done

# --------------------------------------------------- 5. port-cleanup fix ----
# The vendored `kill-port` helper (used by the legacy multicast discovery
# server to free UDP port 20000) implements "free this port" as
#   lsof -i <proto>:<port> | grep LISTEN | awk '{print $2}' | xargs kill -9
# which, on Linux, kills *itself*: the worker that calls it is the process
# holding the port, so the forked discover-worker dies with SIGKILL about a
# second after startup and the Discover Service reports "worker has exit".
# Exclude our own process (and the shell) from the candidate list.
log "Fixing the self-killing port cleanup helper (kill-port)"
python3 - "$OUT/resources/app/.vite/build" <<'PY'
import pathlib, re, sys

root = pathlib.Path(sys.argv[1])
expr = re.compile(
    r"lsof -i (\$\{[^}]{0,120}\}:\$\{[^}]{0,40}\})"
    r" \| grep \$\{[^}]{0,120}\} \| awk '\{print \$2\}' \| xargs kill -9"
)
repl = 'lsof -t -i \\1 | grep -v -x -e "$$" -e "$PPID" | xargs -r kill -9'
total = 0
for path in sorted(list(root.glob("*.js")) + list(root.glob("*.cjs"))):
    text = path.read_text(encoding="utf-8", errors="surrogateescape")
    text, n = expr.subn(repl, text)
    if n:
        path.write_text(text, encoding="utf-8", errors="surrogateescape")
        print(f"    patched {path.name} ({n})")
        total += n
if total == 0:
    sys.exit("kill-port pattern not found - upstream code changed")
PY

# ----------------------------------------------------------- 6. algo-server --
log "Building the Wine IPC bridge for the algorithm worker"
x86_64-w64-mingw32-gcc -O2 -o "$WORK/algo-ipc-bridge.exe" "$TOOLS/algo-ipc-bridge.c" -lws2_32
AS="$OUT/resources/tools/algo-server"
cp "$WORK/algo-ipc-bridge.exe" "$AS/algo-ipc-bridge.exe"
cp "$TOOLS/algo-server-linux-x64" "$AS/algo-server-linux-x64"
chmod 755 "$AS/algo-server-linux-x64"

# -------------------------------------------------------------- 6. launcher --
log "Writing launcher and desktop entry"
cat > "$OUT/xtool-studio-launcher" <<'SH'
#!/bin/sh
# Launcher for the Linux build of xTool Studio.
#
#   --gtk-version=3  Chromium 136 initialises GTK4 for some surfaces while the
#                    process already has GTK3 loaded, which aborts the app with
#                    "GTK 2/3 symbols detected. Using GTK 2/3 and GTK 4 in the
#                    same process is not supported".
#   --no-sandbox     only when chrome-sandbox is not setuid (unprivileged
#                    installs); a system package installs it 4755 and keeps the
#                    renderer sandbox enabled.
here=$(dirname -- "$(readlink -f -- "$0")")

set -- --gtk-version=3 "$@"
if [ ! -u "$here/chrome-sandbox" ]; then
	set -- --no-sandbox "$@"
fi
exec "$here/xtool-studio" "$@"
SH
chmod 755 "$OUT/xtool-studio-launcher"

install -Dm644 "$TOOLS/xtool-studio.desktop" "$OUT/xtool-studio.desktop"

# Icon: reuse the one shipped with the Windows build (resources/ext.ico).
icon_src="$RES_SRC/ext.ico"
if [ -f "$icon_src" ]; then
	if command -v magick >/dev/null 2>&1; then
		magick "$icon_src[0]" -resize 256x256 "$OUT/xtool-studio.png"
	elif command -v convert >/dev/null 2>&1; then
		convert "$icon_src[0]" -resize 256x256 "$OUT/xtool-studio.png"
	fi
fi

log "Done"
cat <<EOF

Linux build: $OUT
Run:         $OUT/xtool-studio-launcher

Notes
  * The algorithm worker runs under Wine (needs the 'wine' package) because
    upstream ships no Linux binary for it.
  * If Wine is unavailable the app still starts; only design processing that
    needs the algorithm worker will fail.
EOF
