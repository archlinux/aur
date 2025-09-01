# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A GUI app for Omarchy."
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchist"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Omarchist_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Omarchist_${pkgver}_arm64.deb")
sha256sums_x86_64=('e8d28e63d2198e50f4c8bc79a322624510d3ad5bd6484f1ca455b1ec494ae025')
sha256sums_aarch64=('b49628a973d5d6fbd8c2cd77bd6fae3f7dcc8eb4c03588b1ac03c2f95f994b1f')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}