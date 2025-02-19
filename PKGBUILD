pkgname=sauna-sim
pkgver=0.22.17
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
sha256sums_x86_64=('E1C271534EAA3B55B862FA91D22EB0D6D898BA7C2468D9629B3D0BE7088B3F0D')
sha256sums_aarch64=('1A833F99762F69D1A164C77098E9B4A181B4FA1EAE60F11A6D733D5991CC7606')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
