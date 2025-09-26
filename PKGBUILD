# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.5.0
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
sha256sums_x86_64=('cad97275b3a0ed2ffeedd4d8eace3e74c0fab450a43ff09f873008e93c1096d5')
sha256sums_aarch64=('7b10e911ff43693c1edc9919edc2af78ef04c7d76e458b7b502b7b0ac0aa6970')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}