# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=qt-logout
pkgver=2021.01.01
pkgrel=1
pkgdesc='Logout script for qt5'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GPL3')
depends=('python-pyqt5' 'gtk-engine-murrine')
optdepends=('multimonitorlock: default lock screen for qt-logout')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('4acc5fc9ff44d39560900fc23882c481d91fcb695013b8cb53e907664530413f')

package() {
  cp -a $srcdir/$pkgname-$pkgver/etc $pkgdir/etc
  mkdir -p $pkgdir/usr
	cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver/usr/lib/qt-logout $pkgdir/usr/lib/qt-logout
}
