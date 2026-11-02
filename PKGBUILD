# Maintainer: Ваше Имя <you@example.com>
pkgname=icon-theme-toolkit
pkgver=1.0.2.1
pkgrel=1
pkgdesc="Toolkit for editing Linux icon themes (comparer, editor, problem-fixer)"
arch=('any')
url="https://github.com/nestoris/icon-theme-toolkit"
license=('GPLv3')
depends=('gjs' 'gtk3' 'gdk-pixbuf2')
optdepends=('icoutils: support of importing/exporting ICO')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('22ea1a62abec9c732a2c1356a98dbf2e9f6e0a754f9b371f77b676d49becfa0a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}
