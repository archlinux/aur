# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-xdis
pkgver=3.5.4
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
makedepends=('python')
source=('git://github.com/rocky/python-xdis.git#commit=ff6c93eb38bf0464dff8ff0cf7b9d5a1f342a4b7')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}
