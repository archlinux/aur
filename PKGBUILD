# Maintainer: innsbluck
# Contributor: innsbluck
pkgname=sledge
pkgver=0.1.3
pkgrel=1
pkgdesc="Pixel-based drawing tool."
arch=('x86_64')
url="https://github.com/sledge-pdm/sledge"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/sledge_${pkgver}_amd64.deb")
sha256sums_x86_64=('5ec772638d3cd404dfb65f0f648a6aec8f89e7b21e2bc3130d94504740b9acce')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}