pkgname=sauna-sim
pkgver=0.22.16
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
sha256sums_x86_64=('21750C05B604A16BCA5F5D627976195F62C1C10B292617B12F14BE9B5ADF23B4')
sha256sums_aarch64=('9EC82B1B5C3BA631119C572379B07D61F2A944A4E515E2F095B2F0E94021C1D3')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
