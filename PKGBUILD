# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=abella
pkgver=2.0.5
pkgrel=1
pkgdesc='Interactive theorem prover'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://abella-prover.org/'
makedepends=('ocaml')
source=("${pkgname}::http://abella-prover.org/distributions/abella-${pkgver}.tar.gz")
sha256sums=('20b23594f66a69ceaddda9a488a1d42d135aadd7b33d9fced3c7a76be4253e2f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 abella "${pkgdir}/usr/bin/abella"
}

# vim:set et sw=4 sts=4 et:
