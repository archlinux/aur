# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=qt-logout
pkgver=v1.2.0
_pkgver=1.2.0
pkgrel=1
pkgdesc='Logout script for qt5'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GNU General Public License v3.0')
depends=('python-pyqt5' 'multimonitorlock' 'gtk-engine-murrine')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('7712ec407686122aa6422159abb9c3524f8710a46175fb9fc1b137e7ac288881')

package() {
  cp -a $srcdir/$pkgname-$_pkgver-$pkgrel/etc $pkgdir/etc
  mkdir -p $pkgdir/usr/local
	cp -a $srcdir/$pkgname-$_pkgver-$pkgrel/usr/local/bin $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$_pkgver-$pkgrel/usr/lib/qt-logout $pkgdir/usr/lib/qt-logout
}
