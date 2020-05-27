# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=qt-logout
pkgver=1.0.0
pkgrel=1
pkgdesc='Logout script for qt5'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('MIT')
makedepends=('python-pyqt5')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('5b5f85caefcfb08c3b6a79afc076399825b061958f3aac2246b08d94992e801a')

package() {
  cp -a $srcdir/$pkgname-$pkgver-$pkgrel/etc $pkgdir/etc
  mkdir -p $pkgdir/usr/local
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/local/bin $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/lib/qt-logout $pkgdir/usr/lib/qt-logout
}
