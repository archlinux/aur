# Maintainer: Ваше Имя <you@example.com>
pkgname=icon-theme-toolkit
pkgver=1.0.2
pkgrel=1
pkgdesc="Toolkit for creating and editing Linux icon themes"
arch=('any')
url="https://github.com/nestoris/icon-theme-toolkit"
license=('GPLv3')
depends=('gjs' 'gtk3' 'gdk-pixbuf2')
optdepends=('icoutils: support of importing/exporting ICO')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3186292e9ca25c9b7e0989d69514c002bf348a298c4edb9c986b9c5dec25308e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}
