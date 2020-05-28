# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=qt-logout
pkgver=1.0.0
pkgrel=1
pkgdesc='Logout script for qt5'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GNU General Public License v3.0')
depends=('python-pyqt5' 'betterlockscreen')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('bfe854915e42d568c232dd9261173fe7afacb0446523a13c9efb3cc6c3f8f51b')

package() {
  cp -a $srcdir/$pkgname-$pkgver-$pkgrel/etc $pkgdir/etc
  mkdir -p $pkgdir/usr/local
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/local/bin $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/lib/qt-logout $pkgdir/usr/lib/qt-logout
}
