pkgname=sauna-sim
pkgver=0.23.2
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
sha256sums_x86_64=('d7ee1a6f748710a6253a88e4c75a5f07afabaf06b3ee9d5a25c0f059f0cd8358')
sha256sums_aarch64=('f3ad2b8ea7bb6640eaa5e04a6fad77e17692d22d73f7fbc1581e0a24d17880b7')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
