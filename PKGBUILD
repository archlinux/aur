# Maintainer: Gemini CLI Agent
pkgname=cockpit-tools-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A tool for managing Cockpit (Tauri-based)"
arch=('x86_64')
url="https://github.com/jlcodes99/cockpit-tools"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libnm' 'libayatana-appindicator')
provides=('cockpit-tools')
conflicts=('cockpit-tools')
source=("${pkgname}-${pkgver}.deb::https://github.com/jlcodes99/cockpit-tools/releases/download/v${pkgver}/Cockpit.Tools_${pkgver}_amd64.deb")
sha256sums=('5d04578934c531ba58a41f6389e960e5e82787f461049681eb670262187baa29')

package() {
  # Extract data.tar.gz which contains the filesystem structure
  tar -xzf data.tar.gz -C "${pkgdir}"
}
