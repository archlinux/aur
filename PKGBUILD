# Maintainer: cat6241 <shakalnykot@proton.me>
pkgver=2.0.1
pkgrel=1

pkgname=asciicaesar
pkgdesc="(Utility from my friend R2U2 at Github) Utility which implements the Caesar cipher and used to decode the obfuscation used in Innovation Studio"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/FINVS/asciicaesar"
license=('GPL3')

source=("${pkgname}-${pkgver}::https://github.com/FINVS/asciicaesar/archive/v$pkgver.tar.gz")
sha256sums=('535f76f0ad8133aad5ad310b1958e9cb285d63164a6eaeec939df7c9abd592ee')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    cp asciicaesar "$pkgdir/usr/bin/asciicaesar"
}
