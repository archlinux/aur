# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchist-bin
pkgver=0.4.0
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
sha256sums_x86_64=('293ba69c7be2893e21349d96980a7dd91ef5d6ae84d07d19ce3a207c678cee55')
sha256sums_aarch64=('696e97b36420cba6e3aee53492a4d26f5f7397720a138961d7e70bb02f90e4aa')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}