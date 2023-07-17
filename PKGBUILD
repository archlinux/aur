# Maintainer: cat6241 <shakalnykot@proton.me>
pkgver=2.2
pkgrel=1

pkgname=asciicaesar
pkgdesc="(Utility from my friend R2U2 at Github) Utility which implements the Caesar cipher and used to decode the obfuscation used in Innovation Studio"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/FINVS/asciicaesar"
license=('GPL3')

source=("${pkgname}-${pkgver}::https://github.com/FINVS/asciicaesar/archive/v$pkgver.tar.gz")
sha256sums=('7c1973bcabae06c13e23a0a7fe61de8ba87f5a7d620237b57d91e7f8d19e6980')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    cp asciicaesar "$pkgdir/usr/bin/asciicaesar"
}
