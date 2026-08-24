# Maintainer: asm0dey <me@asm0dey.site>
pkgname=ayandict-bin
pkgver=3.0.0
pkgrel=1
pkgdesc=" AyanDict - a simple multi-lingual cross-platform offline dictionary based on Qt and written in Go "
arch=('x86_64')
url="https://github.com/ilius/ayandict"
license=('AGPL-3.0-only')
source=("ayandict-$pkgver.bz2::$url/releases/download/v$pkgver/ayandict-v$pkgver-linux-amd64.bz2")
sha256sums=('acd19aa326c5a6d2a84935592796411192a25d022785e698c6c06c34c85ac935')

package() {
    install -dm 755 $pkgdir/usr/bin
    install -m 755 "$srcdir/ayandict-$pkgver" $pkgdir/usr/bin/ayandict
}
