# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=abella
pkgver=2.0.4
pkgrel=1
pkgdesc='Interactive theorem prover'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://abella-prover.org/'
makedepends=('ocaml')
source=("${pkgname}::http://abella-prover.org/distributions/abella-${pkgver}.tar.gz")
sha256sums=('4c70180962f7e56e66ebce3c20755f54554e7ceab593acf13cfff1efa964ccc2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 abella "${pkgdir}/usr/bin/abella"
}

# vim:set et sw=4 sts=4 et:
