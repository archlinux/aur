# Maintainer: Gemini CLI Agent
pkgname=cockpit-tools-bin
pkgver=0.24.9
pkgrel=1
pkgdesc="Universal AI IDE account manager for Antigravity / Codex / GitHub Copilot / Windsurf / Kiro / Cursor / Gemini-cli / CodeBuddy"
arch=('x86_64')
url="https://github.com/jlcodes99/cockpit-tools"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libnm' 'libayatana-appindicator')
provides=('cockpit-tools')
conflicts=('cockpit-tools')
source=("${pkgname}-${pkgver}.deb::https://github.com/jlcodes99/cockpit-tools/releases/download/v${pkgver}/Cockpit.Tools_${pkgver}_amd64.deb")
sha256sums=('ff048abb0572cb22d24b2376d315fbd8d223bddb5413ac4cf1916143c524d790')

package() {
  # Extract data.tar.gz which contains the filesystem structure
  tar -xzf data.tar.gz -C "${pkgdir}"
}
