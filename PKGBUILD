pkgname=sauna-sim
pkgver=0.24.1
pkgrel=1
pkgdesc="ATC Training Simulator."
arch=('x86_64' 'aarch64')
url="https://saunasim.com"
license=('gpl-3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_amd64.deb")
source_aarch64=("https://github.com/sauna-sim/sauna-ui/releases/download/v$pkgver/SaunaSim_"$pkgver"_arm64.deb")
sha256sums_x86_64=('470aca0d2dc54a5ba9f956c4004b3c8324126271b45bafa205fe8373f90ef4e1')
sha256sums_aarch64=('aa7e543085e5185420c93503e8d2e80d1496b9a44873b1483010c95f6d96757e')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
