# Maintainer: Gemini CLI Agent
pkgname=cockpit-tools-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A tool for managing Cockpit (Tauri-based)"
arch=('x86_64')
url="https://github.com/jlcodes99/cockpit-tools"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libnm' 'libayatana-appindicator')
provides=('cockpit-tools')
conflicts=('cockpit-tools')
source=("${pkgname}-${pkgver}.deb::https://github.com/jlcodes99/cockpit-tools/releases/download/v${pkgver}/Cockpit.Tools_${pkgver}_amd64.deb")
sha256sums=('21982c1f2dd24cea67d1044dab83fbf43218f69593cb9b2c97c1d97f4b2adb79')

package() {
  # Extract data.tar.gz which contains the filesystem structure
  tar -xzf data.tar.gz -C "${pkgdir}"
}
