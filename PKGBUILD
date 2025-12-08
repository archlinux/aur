# Maintainer: innsbluck
# Contributor: innsbluck
pkgname=sledge
pkgver=0.1.5
pkgrel=1
pkgdesc="Pixel-based drawing tool."
arch=('x86_64')
url="https://github.com/sledge-pdm/sledge"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/sledge_${pkgver}_amd64.deb")
sha256sums_x86_64=('2cd8aa4ad1de715493d76a748b7d7b3e2642bc5f4a46a2bdae1642fb63deaa88')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}