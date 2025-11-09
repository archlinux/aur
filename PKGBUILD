# Maintainer: innsbluck
# Contributor: innsbluck
pkgname=sledge
pkgver=0.1.1
pkgrel=1
pkgdesc="A pixel-based drawing tool."
arch=('x86_64')
url="https://github.com/sledge-pdm/sledge"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/sledge_${pkgver}_amd64_linux.deb")
sha256sums_x86_64=('c009ea2d044017a87752fc8479f8ab03b8de867fe9761d3b371300b6ebc9a9ff')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}