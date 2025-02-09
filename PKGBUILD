pkgname=sauna-sim
pkgver=0.22.3
pkgrel=1
pkgdesc="SaunaSim. An ATC Training Simulator."
arch=('x86_64' 'aarch64')
url="https://github.com/Sauna-ATC-Training-Simulator/sauna-ui"
license=('gpl-3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/Sauna-ATC-Training-Simulator/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_amd64.deb")
source_aarch64=("https://github.com/Sauna-ATC-Training-Simulator/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_arm64.deb")

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}