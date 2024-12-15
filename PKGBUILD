# Maintainer: Imna <imna@imna.digital>
pkgname=imna-file-manager-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="File manager created by Imna Digital"
arch=('x86_64' 'aarch64')
url="https://github.com/Imna29/imna_file_manager"
license=('Apache-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/Imna29/imna_file_manager/releases/download/app-v$pkgver/Imna.File.Manager_"$pkgver"_amd64.deb")
sha256sums_x86_64=('ba1a9c26491f2dd6cf8edcd14de4c2d69b394a0b13fb7169bd827c6ee016e7c1')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
