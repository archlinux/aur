pkgname=sauna-sim
pkgver=0.22.12
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
sha256sums_x86_64=('731EF74FE1A06DB53CD40558736477D81A4212BC62301F65EF01764D83D9CEA4')
sha256sums_aarch64=('944612A0593E97C409E451E8831A991E0F95927D1959EBB724A531F7F29B788F')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
