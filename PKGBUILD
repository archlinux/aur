# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.3.1
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
sha256sums_x86_64=('a039321b2388c3a55e1d5503f5bcf08d8c7b3c78c68e2583ca5af7effb7b3bdd')
sha256sums_aarch64=('4d601d61430bc84ee080acb9c2b1f1538534537ed5c8fc8125100c19fdb6de29')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}