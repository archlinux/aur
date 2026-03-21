# Maintainer: Gemini CLI Agent
pkgname=cockpit-tools-bin
pkgver=0.17.8
pkgrel=1
pkgdesc="A tool for managing Cockpit (Tauri-based)"
arch=('x86_64')
url="https://github.com/jlcodes99/cockpit-tools"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libnm' 'libayatana-appindicator')
provides=('cockpit-tools')
conflicts=('cockpit-tools')
source=("${pkgname}-${pkgver}.deb::https://github.com/jlcodes99/cockpit-tools/releases/download/v${pkgver}/Cockpit.Tools_${pkgver}_amd64.deb")
sha256sums=('a21302aceb4d34fd55d4d619a7503a79c8d6d8f6ee8884aa7b9cdcd612d79dbd')

package() {
  # Extract data.tar.gz which contains the filesystem structure
  tar -xzf data.tar.gz -C "${pkgdir}"
}
