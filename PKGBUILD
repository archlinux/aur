# Maintainer: asm0dey <me@asm0dey.site>
pkgname=ayandict-bin
pkgver=2.2.0
pkgrel=1
pkgdesc=" AyanDict - a simple multi-lingual cross-platform offline dictionary based on Qt and written in Go "
arch=('x86_64')
url="https://github.com/ilius/ayandict"
license=('AGPL-3.0-only')
source=("ayandict-$pkgver.bz2::$url/releases/download/v$pkgver/ayandict-v$pkgver-linux-$CARCH.bz2")
sha256sums=('16469cc9a8f45132b8eaf5646a3d281299d335035c810741074d04db16484a9c')

package() {
    install -dm 755 $pkgdir/usr/bin
    install -m 755 "$srcdir/ayandict-$pkgver" $pkgdir/usr/bin/ayandict
}
