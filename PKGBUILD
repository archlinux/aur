pkgname=sauna-sim
pkgver=0.22.11
pkgrel=1
pkgdesc="An ATC Training Simulator."
arch=('x86_64' 'aarch64')
url="https://sauna-sim.github.io"
license=('gpl-3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_amd64.deb")
source_aarch64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_arm64.deb")
sha256sums_x86_64=('4AA13990F9CBB1309FD838DD150FFDD3E471CB1D6D482957246FEAC84EAB587E')
sha256sums_aarch64=('AE60D3044768102CF3E9DE5980B2444C173D9E9A87581AA0CD69B80A08F16DAB')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
