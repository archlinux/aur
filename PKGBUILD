pkgname=sauna-sim
pkgver=0.23.0
pkgrel=1
pkgdesc="An ATC Training Simulator."
arch=('x86_64' 'aarch64')
url="https://saunasim.com"
license=('gpl-3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_amd64.deb")
source_aarch64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_arm64.deb")
sha256sums_x86_64=('0d483046de148e96f1841a3c4d2abc826d4c8b94f075e0daf0c5518d9ffa6efa')
sha256sums_aarch64=('d5e837073a9e7f8cb189552d7cc367873e6e1d8fcb81015b5cff5ddebd32e7c6')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
