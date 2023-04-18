# Maintainer: Tyler Murphy <tylerm@tylerm.dev>
pkgname=wig
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple dns client written in C"
arch=('x86_64' 'i686')
url="https://g.tylerm.dev/tylermurphy534/wig"
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
    install -D --mode=755 --owner=root --group=root ./bin/app ${pkgdir}/usr/local/bin/wig
}
