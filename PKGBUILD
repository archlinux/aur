# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
pkgname=madlions-control
pkgver=0.3.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for MADLIONS magnetic-switch keyboards"
arch=('any')
url="https://github.com/NasirA1991/madlions-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'hicolor-icon-theme')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/madlions-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b36b08d5d83b7bc65e3898220d665532d7f7701b6dbf6ed6e59e3498789ace9f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
