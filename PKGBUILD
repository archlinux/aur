# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=qt-logout
pkgver=2021.04.07
pkgrel=1
pkgdesc='Logout screen for QT using QT6 and pyside6'
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('pyside2')
optdepends=('multimonitorlock: default lock screen for qt-logout')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('bfe147e20b68d9e873edafddf0212e1a3feabc34a384eaec221cda91d82bac93')

package() {
  cp -a $srcdir/$pkgname-$pkgver/etc $pkgdir/etc
  mkdir -p $pkgdir/usr
	cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver/usr/lib/qt-logout $pkgdir/usr/lib/qt-logout
}
