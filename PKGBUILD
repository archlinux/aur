# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=abella
pkgver=2.0.3
pkgrel=1
pkgdesc='Interactive theorem prover'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://abella-prover.org/'
depends=('ocaml')
source=("${pkgname}::http://abella-prover.org/distributions/abella-${pkgver}.tar.gz")
sha256sums=('db808ea999f09a3e920c14e1e3bd856683741114cdef3bdbc76fa05f33995a29')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 abella "${pkgdir}/usr/bin/abella"
}

# vim:set et sw=4 sts=4 et:
