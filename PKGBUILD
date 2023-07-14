# Maintainer: cat6241 <shakalnykot@proton.me>
pkgver=2.1.0
pkgrel=1

pkgname=asciicaesar
pkgdesc="(Utility from my friend R2U2 at Github) Utility which implements the Caesar cipher and used to decode the obfuscation used in Innovation Studio"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/FINVS/asciicaesar"
license=('GPL3')

source=("${pkgname}-${pkgver}::https://github.com/FINVS/asciicaesar/archive/v$pkgver.tar.gz")
sha256sums=('e2a0d655e62cffaf90cbd601ebd352da51bf9853af79dbfe6b3b2ef777bf1005')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    cp asciicaesar "$pkgdir/usr/bin/asciicaesar"
}
