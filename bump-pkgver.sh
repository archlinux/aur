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
provides=('opencode-desktop-electron' 'opencode')
conflicts=('opencode-desktop-electron' 'opencode')
depends=('nss' 'libnotify' 'libxss' 'xdg-utils' 'hicolor-icon-theme' 'gtk3')
options=('!strip' '!debug')

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE"
        "opencode-desktop-${pkgver}-linux-x86_64.AppImage::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-x86_64.AppImage")

sha256sums=('SKIP'
            'PLACEHOLDER_X86_64')

package() {
  local appimage="${srcdir}/opencode-desktop-${pkgver}-linux-x86_64.AppImage"
  local extractdir
  local appdir
  local desktop_source=
  local desktop_basename=
  local icon_name=
  local icon_source=
  local startup_wm_class=
  local candidate
  local had_nullglob=0
  extractdir="$(mktemp -d)"
  appdir="${extractdir}/squashfs-root"
  chmod +x "$appimage"
  (cd "$extractdir" && "$appimage" --appimage-extract >/dev/null)

  install -dm755 "${pkgdir}/opt/OpenCode"
  cp -a "$appdir"/. "${pkgdir}/opt/OpenCode/"
  find "${pkgdir}/opt/OpenCode" -type d -exec chmod 755 {} +

  if shopt -q nullglob; then
    had_nullglob=1
  fi
  shopt -s nullglob

  for candidate in "$appdir"/*.desktop "$appdir"/usr/share/applications/*.desktop; do
    if [[ -f "$candidate" ]]; then
      desktop_source="$candidate"
      break
    fi
  done
  [[ -n "$desktop_source" ]] || { echo "ERROR: desktop file not found"; exit 1; }

  desktop_basename="$(basename "$desktop_source")"
  icon_name="$(grep -m1 '^Icon=' "$desktop_source" | cut -d= -f2-)"
  [[ -n "$desktop_basename" ]] || desktop_basename='@opencode-aidesktop.desktop'
  [[ -n "$icon_name" ]] || icon_name='@opencode-aidesktop'
  startup_wm_class="$(grep -m1 '^StartupWMClass=' "$desktop_source" | cut -d= -f2-)"
  [[ -n "$startup_wm_class" ]] || startup_wm_class='OpenCode'

  for candidate in \
    "$appdir"/usr/share/icons/hicolor/*/apps/"${icon_name}".png \
    "$appdir"/usr/share/icons/hicolor/*/apps/*opencode*.png \
    "$appdir"/*.png; do
    if [[ -f "$candidate" ]]; then
      icon_source="$candidate"
      break
    fi
  done
  [[ -n "$icon_source" ]] || { echo "ERROR: icon asset not found"; exit 1; }

  if (( ! had_nullglob )); then
    shopt -u nullglob
  fi

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/opencode-desktop-electron" <<WRAPPER
#!/bin/sh
export APPDIR=/opt/OpenCode
export CHROME_DESKTOP=${desktop_basename}
exec /opt/OpenCode/AppRun --no-sandbox "\$@"
WRAPPER

  ln -sf opencode-desktop-electron "${pkgdir}/usr/bin/opencode-desktop"

  # Expose the bundled CLI as /usr/bin/opencode
  ln -sf "/opt/OpenCode/resources/opencode-cli" "${pkgdir}/usr/bin/opencode"

  install -dm755 "${pkgdir}/usr/share"
  cp -a "${pkgdir}/opt/OpenCode/usr/share/icons" "${pkgdir}/usr/share/"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +

  shopt -s nullglob
  for candidate in "${pkgdir}"/usr/share/icons/hicolor/*/apps/"${icon_name}".png; do
    ln -sf "${icon_name}.png" "${candidate%/*}/opencode-desktop-electron.png"
    ln -sf "${icon_name}.png" "${candidate%/*}/opencode-desktop.png"
    ln -sf "${icon_name}.png" "${candidate%/*}/opencode.png"
  done
  if (( ! had_nullglob )); then
    shopt -u nullglob
  fi

  install -Dm644 "$icon_source" "${pkgdir}/opt/OpenCode/resources/icons/icon.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${desktop_basename}" <<DESKTOP
[Desktop Entry]
Name=OpenCode
Comment=OpenCode desktop client
Exec=opencode-desktop-electron %U
Icon=${icon_name}
Terminal=false
Type=Application
Categories=Development;
StartupNotify=true
StartupWMClass=${startup_wm_class}
X-GNOME-WMClass=${startup_wm_class}
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

if [[ "$CURRENT_VER" == "$LATEST_VER" ]] \
  && ! grep -Eq 'PLACEHOLDER|opencode-electron-linux-x86_64\.AppImage|@opencode-aidesktop-electron|StartupWMClass=OpenCode|Name=Opencode' "$PKGBUILD"; then
  success "Already at $LATEST_VER — nothing to do."
  exit 0
fi

# ── 2. Resolve asset URL ──────────────────────────────────────────────────────
APPIMAGE_ASSET_JSON="$(echo "$RELEASE_JSON" | jq -c '.assets[] | select(.name == "opencode-desktop-linux-x86_64.AppImage" or .name == "opencode-electron-linux-x86_64.AppImage")' | head -1)"
[[ -z "$APPIMAGE_ASSET_JSON" ]] && die "x86_64 AppImage not found in release $LATEST_TAG"
APPIMAGE_NAME="$(echo "$APPIMAGE_ASSET_JSON" | jq -r '.name')"
APPIMAGE_URL="$(echo "$APPIMAGE_ASSET_JSON" | jq -r '.browser_download_url')"
APPIMAGE_SHA256="$(echo "$APPIMAGE_ASSET_JSON" | jq -r '.digest // empty' | sed 's/^sha256://')"
info "Asset: $APPIMAGE_NAME"

# ── 3. Download & checksum ────────────────────────────────────────────────────
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

if [[ -n "$APPIMAGE_SHA256" ]]; then
  SHA_X86_64="$APPIMAGE_SHA256"
  info "Using release-provided sha256."
else
  info "Downloading x86_64 AppImage..."
  curl -fsSL --progress-bar -o "$TMPDIR/opencode.AppImage" "$APPIMAGE_URL"
  SHA_X86_64="$(sha256sum "$TMPDIR/opencode.AppImage" | awk '{print $1}')"
fi
info "sha256: $SHA_X86_64"

# ── 4. Patch PKGBUILD ─────────────────────────────────────────────────────────
python3 - "$PKGBUILD" "$LATEST_VER" "$SHA_X86_64" << 'PYEOF'
import sys, re
path, ver, sha = sys.argv[1], sys.argv[2], sys.argv[3]
content = open(path).read()
content = re.sub(r'^pkgver=.*', f'pkgver={ver}', content, flags=re.MULTILINE)
content = re.sub(r'^pkgrel=.*', 'pkgrel=1', content, flags=re.MULTILINE)
content = content.replace(
    'opencode-electron-${pkgver}-linux-x86_64.AppImage::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-electron-linux-x86_64.AppImage',
    'opencode-desktop-${pkgver}-linux-x86_64.AppImage::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-x86_64.AppImage',
)
content = content.replace(
    'local appimage="${srcdir}/opencode-electron-${pkgver}-linux-x86_64.AppImage"',
    'local appimage="${srcdir}/opencode-desktop-${pkgver}-linux-x86_64.AppImage"',
)
content = content.replace('export CHROME_DESKTOP=opencode-desktop-electron.desktop', 'export CHROME_DESKTOP=${desktop_basename}')
content = content.replace('export CHROME_DESKTOP=opencode.desktop', 'export CHROME_DESKTOP=${desktop_basename}')
content = content.replace('exec /opt/OpenCode/AppRun --class=opencode-desktop-electron --no-sandbox "$@"', 'exec /opt/OpenCode/AppRun --no-sandbox "\\$@"')
content = content.replace('exec /opt/OpenCode/AppRun --no-sandbox "$@"', 'exec /opt/OpenCode/AppRun --no-sandbox "\\$@"')
content = content.replace('Icon=@opencode-aidesktop-electron', 'Icon=${icon_name}')
content = content.replace('Icon=opencode-desktop-electron', 'Icon=${icon_name}')
content = content.replace('Icon=opencode', 'Icon=${icon_name}')
content = content.replace('StartupWMClass=opencode-desktop-electron', 'StartupWMClass=${startup_wm_class}')
content = content.replace('StartupWMClass=OpenCode', 'StartupWMClass=${startup_wm_class}')
content = content.replace('X-GNOME-WMClass=opencode-desktop-electron', 'X-GNOME-WMClass=${startup_wm_class}')
content = content.replace('X-GNOME-WMClass=OpenCode', 'X-GNOME-WMClass=${startup_wm_class}')
content = content.replace('${pkgdir}/usr/share/applications/opencode-desktop-electron.desktop', '${pkgdir}/usr/share/applications/${desktop_basename}')
content = content.replace('${pkgdir}/usr/share/applications/opencode.desktop', '${pkgdir}/usr/share/applications/${desktop_basename}')
content = content.replace('ln -sf opencode-desktop-electron.desktop "${pkgdir}/usr/share/applications/opencode-desktop.desktop"\n', '')
content = content.replace('ln -sf opencode-desktop-electron.desktop "${pkgdir}/usr/share/applications/opencode.desktop"\n', '')
if 'X-GNOME-WMClass=${startup_wm_class}' not in content:
    content = content.replace('StartupWMClass=${startup_wm_class}', 'StartupWMClass=${startup_wm_class}\nX-GNOME-WMClass=${startup_wm_class}')
content = content.replace('Name=Opencode', 'Name=OpenCode')
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
