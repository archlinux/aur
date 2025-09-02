# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.2.0
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
sha256sums_x86_64=('a4e3b15a3b56be0e668403dd90ab34dc24d8dd4104678e749b79e4991172a28d')
sha256sums_aarch64=('d53cffbfe828b7b5d8ecd6ef1da708481fab677447d7a689bfa88b891a5102d5')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}