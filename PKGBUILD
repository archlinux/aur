# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("sand")
pkgver=0.1.4
pkgrel=1
pkgdesc="Sand is an engaging and interactive terminal physics sandbox"
url="https://github.com/mbwilding/sand"
license=("MIT")
arch=("x86_64")
source=("https://github.com/mbwilding/sand/releases/download/v$pkgver/sand-Linux-x86_64-musl.tar.gz
")
sha256sums=('30ca6ff9a97f0ff3f33447fb02caca8d32d782d06938fa435d96148b3c80cb04')

package() {
  install -Dm755 "$srcdir/sand" "$pkgdir/usr/bin/sand"
}
