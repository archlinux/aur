pkgname=sauna-sim
pkgver=0.22.18
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
sha256sums_x86_64=('d1b01db0cf97d23136e073a3a3ab5943ffd8d64dc7b9ea9ef94dee551f18da37')
sha256sums_aarch64=('53f56f22974d11114618891e4c3817b2a21c53534d98c6a445937704928210be')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
