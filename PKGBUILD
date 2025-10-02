# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.6.0
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
sha256sums_x86_64=('8b9666b45cc3c33a20412be016e98f623349e456036cbfcc6083c6e5e78fda59')
sha256sums_aarch64=('0dd8e9d5ed22f134430995aa0b7ba71e7adcd6b6ca38af4ebe1fdd4d32eb9178')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}