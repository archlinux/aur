# Maintainer: Gemini CLI Agent
pkgname=cockpit-tools-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Universal AI IDE account manager for Antigravity / Codex / GitHub Copilot / Windsurf / Kiro / Cursor / Gemini-cli / CodeBuddy"
arch=('x86_64')
url="https://github.com/jlcodes99/cockpit-tools"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libnm' 'libayatana-appindicator')
provides=('cockpit-tools')
conflicts=('cockpit-tools')
source=("${pkgname}-${pkgver}.deb::https://github.com/jlcodes99/cockpit-tools/releases/download/v${pkgver}/Cockpit.Tools_${pkgver}_amd64.deb")
sha256sums=('a86d7663403c0ea3140efc192e5f76622cb6960d8e3a8f1b3d0b4b1619e35a65')

package() {
  # Extract data.tar.gz which contains the filesystem structure
  tar -xzf data.tar.gz -C "${pkgdir}"
}
