# Maintainer: innsbluck
# Contributor: innsbluck
pkgname=sledge
pkgver=0.2.0
pkgrel=1
pkgdesc="Pixel-based drawing tool."
arch=('x86_64')
url="https://github.com/sledge-pdm/sledge"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/sledge_${pkgver}_amd64.deb")
sha256sums_x86_64=('8e164a5c18571aee5a891b0fcd11240c26554768074f02a497cefc9bd3dddf76')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}