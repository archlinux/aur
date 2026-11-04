# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/release.yml for each v* tag.
pkgname=madlions-control
pkgver=0.1.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for MADLIONS magnetic-switch keyboards"
arch=('any')
url="https://github.com/NasirA1991/madlions-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'hicolor-icon-theme')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/madlions-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('acce052410244b5ae40f96d4dc0e0fbb33d400d9bde1b2995b579fa91c31a917')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
