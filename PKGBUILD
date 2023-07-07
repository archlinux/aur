# Maintainer: cat6241 <shakalnykot@proton.me>
pkgver=2.0.0
pkgrel=2

pkgname=asciicaesar
pkgdesc="(Utility from my friend R2U2 at Github) Utility to get source code from e.g. Quantum Browser by Innovation Studio"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/FINVS/asciicaesar"
license=('GPL3')

source=("${pkgname}-${pkgver}::https://github.com/FINVS/asciicaesar/archive/v$pkgver.tar.gz")
sha256sums=('f432b8ccd7d410b4ffb14c3436197abed7b1caf815a3323c1466ff866a421a84')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    cp -v buina "$pkgdir/usr/bin/asciicaesar"
}
