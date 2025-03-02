pkgname=sauna-sim
pkgver=0.24.0
pkgrel=1
pkgdesc="ATC Training Simulator."
arch=('x86_64' 'aarch64')
url="https://saunasim.com"
license=('gpl-3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_amd64.deb")
source_aarch64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_arm64.deb")
sha256sums_x86_64=('4b046ed9874a2d6dfe8a3b670aa6ca761a652c47aa8610ffaa399b00e7c8ea44')
sha256sums_aarch64=('c0cf63943b09f85fb64af0e68f0feff0b89c4686d25921944108b30d77434152')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
