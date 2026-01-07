# Maintainer: asm0dey <me@asm0dey.site>
pkgname=ayandict-bin
pkgver=2.2.4
pkgrel=1
pkgdesc=" AyanDict - a simple multi-lingual cross-platform offline dictionary based on Qt and written in Go "
arch=('x86_64')
url="https://github.com/ilius/ayandict"
license=('AGPL-3.0-only')
source=("ayandict-$pkgver.gz::$url/releases/download/v$pkgver/ayandict-v$pkgver-linux-$CARCH.gz")
sha256sums=('f02266a09bc204567e1103ff9dfd0a0a600b4f0757b646d5a1102d8952ecb4d0')

package() {
    install -dm 755 $pkgdir/usr/bin
    install -m 755 "$srcdir/ayandict-$pkgver" $pkgdir/usr/bin/ayandict
}
