# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.8.1
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
sha256sums_x86_64=('f1389271c4a270e0bc25cd2afc91824ad9644a30183f4362550bb6163f2d92cb')
sha256sums_aarch64=('86477886c6ba59d7ca6b7154b7203187f457d12e3fae3cbe3eba071e99a87377')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
