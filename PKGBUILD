# Maintainer: asm0dey <me@asm0dey.site>
pkgname=ayandict-bin
pkgver=2.1.2
pkgrel=2
pkgdesc=" AyanDict - a simple multi-lingual cross-platform offline dictionary based on Qt and written in Go "
arch=('x86_64')
url="https://github.com/ilius/ayandict"
license=('AGPL-3.0-only')
source=("ayandict-$pkgver.bz2::$url/releases/download/v$pkgver/ayandict-v$pkgver-linux-$CARCH.bz2")
sha256sums=('dd60ef8c64b8e4c688b1f85a7f97fdfd4f692fa5f60608bf11184b070a6a259b')

package() {
    install -dm 755 $pkgdir/usr/bin
    install -m 755 "$srcdir/ayandict-$pkgver" $pkgdir/usr/bin/ayandict
}
