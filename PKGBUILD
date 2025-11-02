# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.7.0
pkgrel=3
pkgdesc="A GUI app for Omarchy."
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchist"
license=('MIT')
depends=('cairo' 'zstd' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
provides=('omarchist')
conflicts=('omarchist' 'omarchist-git')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/Omarchist_${pkgver}_amd64_linux.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Omarchist_${pkgver}_arm64_linux.deb")
sha256sums_x86_64=('420adc0c0a3a9f81ee2b9c9b277a89fd95d589f431bd19cccaf31cedfec4ca28')
sha256sums_aarch64=('61911fe8287b96e927e006cc5f4cf5612f6f46d3004c3a2a035caf175d9faa99')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}