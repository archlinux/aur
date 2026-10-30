# Maintainer: Ваше Имя <you@example.com>
pkgname=icon-theme-toolkit
pkgver=1.0.1
pkgrel=1
pkgdesc="Toolkit for creating and editing Linux icon themes"
arch=('any')
url="https://github.com/nestoris/icon-theme-toolkit"
license=('GPLv3')
depends=('gjs' 'gtk3' 'gdk-pixbuf2')
optdepends=('icoutils: support of importing/exporting ICO')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d41735e12a5f1ddcf12a4f7957d4b176c3982e6de5f2e15e6f9b0ba801cb48c0')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}
