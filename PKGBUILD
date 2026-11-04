# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
pkgname=madlions-control
pkgver=0.3.2
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for MADLIONS magnetic-switch keyboards"
arch=('any')
url="https://github.com/NasirA1991/madlions-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'hicolor-icon-theme')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/madlions-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b0fe5b2dca4aee9002041dd20250c24a4aca920489a8128e80df842fb4549d72')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
