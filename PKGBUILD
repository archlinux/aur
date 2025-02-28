pkgname=sauna-sim
pkgver=0.23.3
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
sha256sums_x86_64=('a60afccc38a9e550fcbef722bd4d4b2a16a47cdfd9d2e63b0970bf536ae3ea0d')
sha256sums_aarch64=('66e7d77babcfb1bf93761c45724f17eeac5b4ae0226cc7210884c9e40af4fa6c')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
