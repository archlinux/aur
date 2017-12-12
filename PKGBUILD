# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-xdis
pkgver=3.6.3
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
makedepends=('python')
source=('git://github.com/rocky/python-xdis.git#commit=18ffdae2081130588aea324049139e74bcded5e5')
sha256sums=('SKIP')
build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}
package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}
