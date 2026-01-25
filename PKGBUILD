# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.8.0
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
sha256sums_x86_64=('a4402a6d6261b7869cedcfcd5a705968d4e008e5508facd0fe4b06ae45d3beb8')
sha256sums_aarch64=('457b74df798b69839c18bd70b82106a3d26029134be3dd3b5bd64070fc51f876')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
