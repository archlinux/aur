# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=abella
pkgver=2.0.6
pkgrel=1
pkgdesc='Interactive theorem prover'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://abella-prover.org/'
makedepends=('ocaml')
source=("${pkgname}::http://abella-prover.org/distributions/abella-${pkgver}.tar.gz")
sha256sums=('d1f793b1e34f3adcaf6d28e2c0274bccb281afe89c8e3093c1e64df6ec4b9898')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 abella "${pkgdir}/usr/bin/abella"
}

# vim:set et sw=4 sts=4 et:
