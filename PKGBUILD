# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=qt-logout
pkgver=2021.01.02
pkgrel=1
pkgdesc='Logout screen for QT using QT6 and pyside6'
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('pyside6' 'gtk-engine-murrine')
optdepends=('multimonitorlock: default lock screen for qt-logout')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('c02076717f96cd97c95847b5b222c4cdb2680dbdd1b76b9c7fa92dc9cd2c4f04')

package() {
  cp -a $srcdir/$pkgname-$pkgver/etc $pkgdir/etc
  mkdir -p $pkgdir/usr
	cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver/usr/lib/qt-logout $pkgdir/usr/lib/qt-logout
}
