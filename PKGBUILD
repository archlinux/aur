# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=qt-logout
pkgver=2021.06.01
pkgrel=1
pkgdesc='Logout screen for QT using QT5 and pyside2'
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('pyside2')
optdepends=('multimonitorlock: default lock screen for qt-logout')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('b2bd00f3bab00eaab15dc6d963548a46772e2d7a702f5618c8b30039bab3dcfe')

package() {
    cp -a $srcdir/$pkgname-$pkgver/etc $pkgdir/etc
    mkdir -p $pkgdir/usr
    cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib
    cp -a $srcdir/$pkgname-$pkgver/usr/lib/qt-logout $pkgdir/usr/lib/qt-logout
}
