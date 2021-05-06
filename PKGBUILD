# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=qt-logout
pkgver=2021.05.06
pkgrel=1
pkgdesc='Logout screen for QT using QT6 and pyside6'
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('pyside2')
optdepends=('multimonitorlock: default lock screen for qt-logout')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('14d7efaeb7393f4670184bca6cec311f9f980d99d2b5c6306a84c049503b9694')

package() {
    cp -a $srcdir/$pkgname-$pkgver/etc $pkgdir/etc
    mkdir -p $pkgdir/usr
    cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib
    cp -a $srcdir/$pkgname-$pkgver/usr/lib/qt-logout $pkgdir/usr/lib/qt-logout
}
