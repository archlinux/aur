# Maintainer: asm0dey <me@asm0dey.site>
pkgname=ayandict-bin
pkgver=2.1.1
pkgrel=1
pkgdesc=" AyanDict - a simple multi-lingual cross-platform offline dictionary based on Qt and written in Go "
arch=('x86_64')
url="https://github.com/ilius/ayandict"
license=('AGPL-3.0-only')
source=("ayandict.bz2::$url/releases/download/v$pkgver/ayandict-v$pkgver-linux-$CARCH.bz2")
sha256sums=('26d1afeb50349cf09833e2406ba7e5273226e44cc4afc3f23496b34e99eb7f7d')

package() {
    install -dm 755 $pkgdir/usr/bin
    install -m 755 $srcdir/ayandict $pkgdir/usr/bin/ayandict
}
