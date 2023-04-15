# Maintainer: Tyler Murphy <tylermurphy534@gmail.com>
pkgname=brainfucked
pkgver=0.0.1
pkgrel=1
pkgdesc="Brainfuck but with manual memory management"
arch=('x86_64' 'i686')
url="https://g.tylerm.dev/tylermurphy534/brainfucked"
license=('GPL3')
makedepends=('gcc' 'make')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://f.tylerm.dev/source/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "$srcdir"
    make
}

package() {
    cd "$srcdir"
    install -D --mode=755 --owner=root --group=root ./bin/app ${pkgdir}/usr/local/bin/brainfucked
}
