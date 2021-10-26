# Maintainer: Valters Tomsons <valters dot tomsons at protonmail dot com>

pkgname="psarc"
pkgver=0.1.3
pkgrel=2
pkgdesc="Utility for extracting PSARC files"
arch=('x86_64')
url='https://www.ferb.fr/ps3/PSARC'
license=('unknown')

source=("$pkgname-$pkgver.tar.bz2::https://www.ferb.fr/ps3/PSARC/psarc-0.1.3.tar.bz2")
sha256sums=('0501d6fa69928f1288c9abd37b00d02a07de7f744def6d83f8d36118d05371a8')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/${pkgname}"
}
