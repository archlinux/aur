# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.8.3
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
sha256sums_x86_64=('184af82f06e055c13f0804d9e90675616c72822a3e86697200ac209f1dd8a1ea')
sha256sums_aarch64=('6127bf28eab3d716b438cb1b6286d8eb9f474d96f4995cf89d68d3625908d1c1')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
