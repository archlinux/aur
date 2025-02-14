pkgname=sauna-sim
pkgver=0.22.14
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
sha256sums_x86_64=('0D12D90FDDE01DB7D94EF7201C794B729641862726CED6E8B2780FA2BA032E6E')
sha256sums_aarch64=('944D7328E533432096257D5ED4C41E93AFF808B007E6A315596F8BD223CDAA81')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
