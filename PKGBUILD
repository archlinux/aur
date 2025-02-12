pkgname=sauna-sim
pkgver=0.22.10
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
sha256sums_x86_64=('2B200F25DD8DD8E1998E4312E6313C09FBBC81AD4F2F1A1F518CC22A1B709D18')
sha256sums_aarch64=('5DACCAF67A4D14704B4F789D5E174E2F21AA2E1FC6AA9725DBBD91FAEE0B1B8B')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
