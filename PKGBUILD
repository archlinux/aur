# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
pkgname=madlions-control
pkgver=0.2.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for MADLIONS magnetic-switch keyboards"
arch=('any')
url="https://github.com/NasirA1991/madlions-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'hicolor-icon-theme')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/madlions-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a1b521ef6056e1eada51a478e55ef5945a7bc695ab72dff1838e4229f773775b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
