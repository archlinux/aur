pkgname=sauna-sim
pkgver=0.22.9
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
sha256sums_x86_64=('99D294CF421C3BA583837F4C0E3B6F3FF67B39C41AF0CD9CA6A72FC663ACFB56')
sha256sums_aarch64=('CC2473C1A4AFFED98B723FBFADB7BE6B27337057878F6CED34DCCCC00A641806')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
