# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="A GUI app for Omarchy."
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchist"
license=('MIT')
depends=('cairo' 'zstd' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
provides=('omarchist')
conflicts=('omarchist' 'omarchist-git')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Omarchist_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Omarchist_${pkgver}_arm64.deb")
sha256sums_x86_64=('acd4a534ac568f989a91072e3d8cc5c0b7ea676df8088fa8fc06c28ee68f966d')
sha256sums_aarch64=('ec47e1ecfaab3082f23a836b19a7a143076784aac286763a26dbeb386dde91bb')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
