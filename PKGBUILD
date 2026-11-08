# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
pkgname=madlions-control
pkgver=0.3.3
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for MADLIONS magnetic-switch keyboards"
arch=('any')
url="https://github.com/NasirA1991/madlions-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'hicolor-icon-theme')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/madlions-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('58e50e6c00c7f9bc86adb7dba1cb473dceaf08338aef20b5f15b4bdbd4bd4875')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
