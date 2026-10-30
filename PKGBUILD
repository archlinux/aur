# Maintainer: Ваше Имя <you@example.com>
pkgname=icon-theme-toolkit
pkgver=1.0.1
pkgrel=1
pkgdesc="Toolkit for creating and editing Linux icon themes"
arch=('any')
url="https://github.com/nestoris/icon-theme-toolkit"
license=('MIT')   # уточните лицензию в репозитории
depends=('gjs' 'gtk3' 'gdk-pixbuf2')
optdepends=('icoutils: поддержка импорта/экспорта ICO')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('SKIP')   # при первом запуске замените на реальную сумму

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}