pkgname=sauna-sim
pkgver=0.23.1
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
sha256sums_x86_64=('e020583a0b2ee17c83a6b565ebb290562ed179d8260ff2c4b5bd3b7c994ed68a')
sha256sums_aarch64=('83f8df4a8858e96c53a2984430289bd0dd5eba96ee01ad81d7b12f1a4afaad03')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
