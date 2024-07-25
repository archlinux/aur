# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("sand")
pkgver=0.1.1
pkgrel=1
pkgdesc="Sand is an engaging and interactive terminal physics sandbox"
url="https://github.com/mbwilding/sand"
license=("MIT")
arch=("x86_64")
source=("https://github.com/mbwilding/sand/releases/download/v$pkgver/sand-Linux-x86_64-musl.tar.gz
")
sha256sums=('11c8e57b313a7d1f7498fa6adc14fee712fe79125334745d66541d9bc46374c3')

package() {
  install -Dm755 "$srcdir/sand" "$pkgdir/usr/bin/sand"
}
