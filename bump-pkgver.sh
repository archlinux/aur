#!/usr/bin/env bash
# bump-pkgver.sh — Sync PKGBUILD to latest release and push to AUR
# Run from inside your AUR git repo, or: AUR_DIR=/path/to/repo bash bump-pkgver.sh

set -euo pipefail

REPO="anomalyco/opencode"
AUR_DIR="${AUR_DIR:-$(dirname "$(realpath "$0")")}"
PKGBUILD="$AUR_DIR/PKGBUILD"

info()    { echo -e "\e[34m[•]\e[0m $*"; }
success() { echo -e "\e[32m[✓]\e[0m $*"; }
die()     { echo -e "\e[31m[✗]\e[0m $*" >&2; exit 1; }

command -v curl    &>/dev/null || die "curl not found"
command -v jq      &>/dev/null || die "jq not found (pacman -S jq)"
command -v python3 &>/dev/null || die "python3 not found"

# ── Bootstrap: write PKGBUILD if missing or empty ─────────────────────────────
if ! grep -q '^pkgname=' "$PKGBUILD" 2>/dev/null; then
  info "PKGBUILD is empty or missing — writing template..."
  python3 << 'PYEOF'
import os
pkgbuild_path = os.environ.get('PKGBUILD', '')

# Read AUR_DIR from environment
aur_dir = os.environ.get('AUR_DIR', '')
pkgbuild = os.path.join(aur_dir, 'PKGBUILD') if aur_dir else pkgbuild_path

template = r"""# Maintainer: Your Name <your@email.com>
pkgname=opencode-desktop-electron-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="OpenCode desktop client (Electron)"
arch=('x86_64')
url="https://github.com/anomalyco/opencode"
license=('MIT')
provides=('opencode-desktop-electron')
conflicts=('opencode-desktop-electron')
depends=('nss' 'libnotify' 'libxss' 'xdg-utils' 'hicolor-icon-theme' 'gtk3')
options=('!strip' '!debug')

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE"
        "opencode-electron-${pkgver}-linux-x86_64.AppImage::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-electron-linux-x86_64.AppImage")

sha256sums=('SKIP'
            'PLACEHOLDER_X86_64')

package() {
  local appimage="${srcdir}/opencode-electron-${pkgver}-linux-x86_64.AppImage"
  local extractdir
  local appdir
  extractdir="$(mktemp -d)"
  appdir="${extractdir}/squashfs-root"
  chmod +x "$appimage"
  (cd "$extractdir" && "$appimage" --appimage-extract >/dev/null)

  install -dm755 "${pkgdir}/opt/OpenCode"
  cp -a "$appdir"/. "${pkgdir}/opt/OpenCode/"
  find "${pkgdir}/opt/OpenCode" -type d -exec chmod 755 {} +

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/opencode-desktop-electron" <<'WRAPPER'
#!/bin/sh
export APPDIR=/opt/OpenCode
export CHROME_DESKTOP=opencode-desktop-electron.desktop
exec /opt/OpenCode/AppRun --no-sandbox "$@"
WRAPPER

  # Expose the bundled CLI as /usr/bin/opencode
  ln -sf "/opt/OpenCode/resources/opencode-cli" "${pkgdir}/usr/bin/opencode"

  local icon_source=
  local candidate
  for candidate in \
    "${pkgdir}/opt/OpenCode/usr/share/icons/hicolor/128x128/apps/@opencode-aidesktop-electron.png" \
    "${pkgdir}/opt/OpenCode/usr/share/icons/hicolor/310x310/apps/@opencode-aidesktop-electron.png" \
    "${pkgdir}/opt/OpenCode/usr/share/icons/hicolor/64x64/apps/@opencode-aidesktop-electron.png"; do
    if [[ -f "$candidate" ]]; then
      icon_source="$candidate"
      break
    fi
  done
  [[ -n "$icon_source" ]] || { echo "ERROR: icon asset not found"; exit 1; }

  install -dm755 "${pkgdir}/usr/share"
  cp -a "${pkgdir}/opt/OpenCode/usr/share/icons" "${pkgdir}/usr/share/"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
  install -Dm644 "$icon_source" "${pkgdir}/opt/OpenCode/resources/icons/icon.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/opencode-desktop-electron.desktop" <<DESKTOP
[Desktop Entry]
Name=Opencode
Comment=OpenCode desktop client
Exec=opencode-desktop-electron %U
Icon=@opencode-aidesktop-electron
Terminal=false
Type=Application
Categories=Development;
StartupNotify=true
StartupWMClass=OpenCode
MimeType=x-scheme-handler/opencode;
DESKTOP

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "$extractdir"
}
"""
with open(pkgbuild, 'w') as f:
    f.write(template)
print(f"Written to {pkgbuild}")
PYEOF
  success "PKGBUILD template written."
fi

# ── 1. Latest version ─────────────────────────────────────────────────────────
info "Fetching latest release..."
RELEASE_JSON="$(curl -fsSL --max-time 30 -H "User-Agent: bump-pkgver/1.0" \
  "https://api.github.com/repos/${REPO}/releases/latest")" \
  || die "curl failed"

if echo "$RELEASE_JSON" | jq -e '.message' &>/dev/null; then
  die "GitHub API error: $(echo "$RELEASE_JSON" | jq -r '.message')"
fi

LATEST_TAG="$(echo "$RELEASE_JSON" | jq -r '.tag_name')"
LATEST_VER="${LATEST_TAG#v}"
CURRENT_VER="$(grep '^pkgver=' "$PKGBUILD" | cut -d= -f2 || true)"
info "Current: ${CURRENT_VER:-<empty>}  →  Latest: $LATEST_VER"

if [[ "$CURRENT_VER" == "$LATEST_VER" ]] && ! grep -q 'PLACEHOLDER' "$PKGBUILD"; then
  success "Already at $LATEST_VER — nothing to do."
  exit 0
fi

# ── 2. Resolve asset URL ──────────────────────────────────────────────────────
APPIMAGE_URL="$(echo "$RELEASE_JSON" | jq -r '.assets[] | select(.name == "opencode-electron-linux-x86_64.AppImage") | .browser_download_url' | head -1)"
[[ -z "$APPIMAGE_URL" ]] && die "x86_64 AppImage not found in release $LATEST_TAG"
info "Asset: $APPIMAGE_URL"

# ── 3. Download & checksum ────────────────────────────────────────────────────
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

info "Downloading x86_64 AppImage..."
curl -fsSL --progress-bar -o "$TMPDIR/opencode.AppImage" "$APPIMAGE_URL"
SHA_X86_64="$(sha256sum "$TMPDIR/opencode.AppImage" | awk '{print $1}')"
info "sha256: $SHA_X86_64"

# ── 4. Patch PKGBUILD ─────────────────────────────────────────────────────────
python3 - "$PKGBUILD" "$LATEST_VER" "$SHA_X86_64" << 'PYEOF'
import sys, re
path, ver, sha = sys.argv[1], sys.argv[2], sys.argv[3]
content = open(path).read()
content = re.sub(r'^pkgver=.*', f'pkgver={ver}', content, flags=re.MULTILINE)
content = re.sub(r'^pkgrel=.*', 'pkgrel=1', content, flags=re.MULTILINE)
content = re.sub(
    r"sha256sums=\(.*?\)",
    f"sha256sums=('SKIP'\n            '{sha}')",
    content, flags=re.DOTALL
)
open(path, 'w').write(content)
PYEOF

success "PKGBUILD patched to $LATEST_VER."

# ── 5. Regenerate .SRCINFO ────────────────────────────────────────────────────
cd "$AUR_DIR"
makepkg --printsrcinfo > .SRCINFO
success ".SRCINFO regenerated."

# ── 6. Commit and push ────────────────────────────────────────────────────────
git add PKGBUILD .SRCINFO
git commit -m "upgpkg: opencode-desktop-electron-bin ${LATEST_VER}"
git push

success "Pushed $LATEST_VER to AUR — users get it on next: yay -Syu"
