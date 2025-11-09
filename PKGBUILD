# Maintainer: innsbluck
# Contributor: innsbluck
pkgname=sledge
pkgver=0.1.2
pkgrel=1
pkgdesc="Pixel-based drawing tool."
arch=('x86_64')
url="https://github.com/sledge-pdm/sledge"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/sledge_${pkgver}_amd64_linux.deb")
sha256sums_x86_64=('0e69a28e8a7e2d184dd0e76d67eb584912473951d97cf507149f0a7dbe2354cb')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}