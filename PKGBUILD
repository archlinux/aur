pkgname=sauna-sim
pkgver=0.22.6
pkgrel=1
pkgdesc="SaunaSim. An ATC Training Simulator."
arch=('x86_64' 'aarch64')
url="https://github.com/sauna-sim/sauna-ui"
license=('gpl-3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_amd64.deb")
source_aarch64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_arm64.deb")
sha256sums_x86_64=('46C17D52AA89B449F5389903879CC44AF767C086C35B4CBFE1C9C89D910EBC79')
sha256sums_aarch64=('5F15FD8BBEC49F6628E6501A308C5148C7044152542D91708C92EA1BB1A2FC49')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
